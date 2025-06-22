-- DDL: Creazione delle tabelle per il progetto "Aree Protette Italiane"

CREATE TABLE AreaProtetta (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    regione VARCHAR(100),
    tipologia VARCHAR(100),
    superficieTerrestre FLOAT,
    superficieMarina FLOAT,
    kmCosta FLOAT,
    enteGestore VARCHAR(255),
    provvedimento TEXT,
    cets BOOLEAN
);

CREATE TABLE CentroVisita (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    parcoID INT,
    temporaneamenteChiuso BOOLEAN,
    indirizzo TEXT,
    accessibilità TEXT,
    mostra TEXT,
    FOREIGN KEY (parcoID) REFERENCES AreaProtetta(ID)
);

CREATE TABLE OrariCentroVisita (
    ID INT PRIMARY KEY,
    centroVisitaID INT,
    giornoSettimana VARCHAR(20),
    fasciaOraria VARCHAR(50),
    mesiValidi VARCHAR(50),
    FOREIGN KEY (centroVisitaID) REFERENCES CentroVisita(ID)
);

CREATE TABLE PrezziCentroVisita (
    ID INT PRIMARY KEY,
    centroVisitaID INT,
    costo DECIMAL(6,2),
    descrizione TEXT,
    prenotazioneObbligatoria BOOLEAN,
    FOREIGN KEY (centroVisitaID) REFERENCES CentroVisita(ID)
);

CREATE TABLE ConvenzioniSpecialiCentroVisita (
    ID INT PRIMARY KEY,
    centroVisitaID INT,
    descrizione TEXT,
    destinatari TEXT,
    costo DECIMAL(6,2),
    FOREIGN KEY (centroVisitaID) REFERENCES CentroVisita(ID)
);

CREATE TABLE StrutturaRicettiva (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    indirizzo TEXT,
    contatti TEXT,
    servizi TEXT,
    trattamenti TEXT,
    ecologico BOOLEAN,
    perScuole BOOLEAN,
    parcheggio BOOLEAN,
    cets BOOLEAN,
    parcoID INT,
    FOREIGN KEY (parcoID) REFERENCES AreaProtetta(ID)
);

CREATE TABLE Itinerario (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    segnaletica TEXT,
    partenza TEXT,
    modalità VARCHAR(50),
    difficoltà VARCHAR(50),
    durata INT,
    parcoID INT,
    FOREIGN KEY (parcoID) REFERENCES AreaProtetta(ID)
);

CREATE TABLE Visitatore (
    ID INT PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    tipo VARCHAR(50)
);

CREATE TABLE Guida (
    ID INT PRIMARY KEY,
    licenza VARCHAR(100),
    nome VARCHAR(100)
);

CREATE TABLE GuidaItinerario (
    guidaID INT,
    itinerarioID INT,
    PRIMARY KEY (guidaID, itinerarioID),
    FOREIGN KEY (guidaID) REFERENCES Guida(ID),
    FOREIGN KEY (itinerarioID) REFERENCES Itinerario(ID)
);

CREATE TABLE TourGuidato (
    ID INT PRIMARY KEY,
    itinerarioID INT,
    guidaID INT,
    orario DATETIME,
    maxPartecipanti INT,
    stato VARCHAR(50),
    FOREIGN KEY (itinerarioID) REFERENCES Itinerario(ID),
    FOREIGN KEY (guidaID) REFERENCES Guida(ID)
);

CREATE TABLE DisponibilitàGuida (
    guidaID INT,
    data DATE,
    orario TIME,
    PRIMARY KEY (guidaID, data, orario),
    FOREIGN KEY (guidaID) REFERENCES Guida(ID)
);

CREATE TABLE Prenotazione (
    ID INT PRIMARY KEY,
    strutturaID INT,
    visitatoreID INT,
    dataInizio DATE,
    dataFine DATE,
    ospiti INT,
    stato VARCHAR(50),
    FOREIGN KEY (strutturaID) REFERENCES StrutturaRicettiva(ID),
    FOREIGN KEY (visitatoreID) REFERENCES Visitatore(ID)
);

CREATE TABLE PrenotazioneTour (
    guidaID INT,
    tourID INT,
    visitatoreID INT,
    PRIMARY KEY (tourID, visitatoreID),
    FOREIGN KEY (guidaID) REFERENCES Guida(ID),
    FOREIGN KEY (tourID) REFERENCES TourGuidato(ID),
    FOREIGN KEY (visitatoreID) REFERENCES Visitatore(ID)
);

CREATE TABLE Commento (
    ID INT PRIMARY KEY,
    testo TEXT,
    data DATE,
    visitatoreID INT,
    targetID INT,
    tipoTarget VARCHAR(50),
    FOREIGN KEY (visitatoreID) REFERENCES Visitatore(ID)
);

CREATE TABLE Valutazione (
    ID INT PRIMARY KEY,
    stelle INT CHECK (stelle BETWEEN 1 AND 5),
    visitatoreID INT,
    targetID INT,
    tipoTarget VARCHAR(50),
    FOREIGN KEY (visitatoreID) REFERENCES Visitatore(ID)
);

CREATE TABLE Notizia (
    ID INT PRIMARY KEY,
    data DATE,
    titolo VARCHAR(255),
    testo TEXT,
    immagine TEXT,
    parcoID INT,
    FOREIGN KEY (parcoID) REFERENCES AreaProtetta(ID)
);

CREATE TABLE Presenza (
    ID INT PRIMARY KEY,
    visitatoreID INT,
    parcoID INT,
    data DATE,
    oraIngresso TIME,
    oraUscita TIME,
    tipologiaUtente VARCHAR(50),
    FOREIGN KEY (visitatoreID) REFERENCES Visitatore(ID),
    FOREIGN KEY (parcoID) REFERENCES AreaProtetta(ID)
);

CREATE TABLE ItinerarioPercorso (
    ID INT PRIMARY KEY,
    presenzaID INT,
    itinerarioID INT,
    valutazione INT CHECK (valutazione BETWEEN 1 AND 5),
    commento TEXT,
    FOREIGN KEY (presenzaID) REFERENCES Presenza(ID),
    FOREIGN KEY (itinerarioID) REFERENCES Itinerario(ID)
);
