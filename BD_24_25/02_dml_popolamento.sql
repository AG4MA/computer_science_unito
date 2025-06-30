-- DML: Inserimento dati coerenti e realistici per il progetto "Aree Protette Italiane"

-- 1. Inserimento dell'area protetta
INSERT INTO AreaProtetta (
    ID, nome, regione, tipologia, superficieTerrestre, superficieMarina,
    kmCosta, enteGestore, provvedimento, cets
)
VALUES (
    1, 'Parco Nazionale del Gran Paradiso', 'Piemonte', 'Parco Nazionale',
    70000, 0, 0, 'Ente Gran Paradiso', 'DPR 03/12/1922', TRUE
);

-- 2. Centro visita associato
INSERT INTO CentroVisita (
    ID, nome, parcoID, temporaneamenteChiuso, indirizzo, accessibilità, mostra
)
VALUES (
    1, 'Centro Visitatori Valsavarenche', 1, FALSE,
    'Valsavarenche (AO)', 'Accesso disabili', 'La vita a sei zampe'
);

-- 3. Struttura ricettiva collegata all'area
INSERT INTO StrutturaRicettiva (
    ID, nome, indirizzo, contatti, servizi, trattamenti,
    ecologico, perScuole, parcheggio, cets, parcoID
)
VALUES (
    1, 'Rifugio Vittorio Emanuele II', 'Valsavarenche (AO)',
    'info@rifugiovittorio.it', 'Wi-Fi, Ristorante', 'Mezza Pensione',
    TRUE, TRUE, TRUE, TRUE, 1
);

-- 4. Visitatore
INSERT INTO Visitatore (ID, username, password, tipo)
VALUES (1, 'mario_rossi', 'password123', 'Adulto');

-- 5. Guida
INSERT INTO Guida (ID, licenza, nome)
VALUES (1, 'GUIDA123', 'Luca Verdi');

-- 6. Itinerario
INSERT INTO Itinerario (
    ID, nome, segnaletica, partenza, modalità, difficoltà, durata, parcoID
)
VALUES (
    1, 'Sentiero Reale', 'CAI 3', 'Valsavarenche', 'a piedi',
    'Media', 240, 1
);

-- 7. Associazione Guida ↔ Itinerario
INSERT INTO GuidaItinerario (guidaID, itinerarioID)
VALUES (1, 1);

-- 8. Disponibilità guida
INSERT INTO DisponibilitàGuida (guidaID, data, orario)
VALUES (1, '2025-07-10', '08:30:00');

-- 9. Tour guidato
INSERT INTO TourGuidato (
    ID, itinerarioID, guidaID, orario, maxPartecipanti, stato
)
VALUES (
    1, 1, 1, '2025-07-10 09:00:00', 20, 'attivo'
);

-- 10. Prenotazione struttura ricettiva
INSERT INTO Prenotazione (
    ID, strutturaID, visitatoreID, dataInizio, dataFine, ospiti, stato
)
VALUES (
    1, 1, 1, '2025-07-10', '2025-07-12', 2, 'accettata'
);

-- 11. Prenotazione tour guidato
INSERT INTO PrenotazioneTour (guidaID, tourID, visitatoreID)
VALUES (1, 1, 1);

-- 12. Commento sull’itinerario
INSERT INTO Commento (
    ID, testo, data, visitatoreID, targetID, tipoTarget
)
VALUES (
    1, 'Bellissimo percorso, ben segnalato.', '2025-07-12',
    1, 1, 'itinerario'
);

-- 13. Valutazione sull’itinerario
INSERT INTO Valutazione (
    ID, stelle, visitatoreID, targetID, tipoTarget
)
VALUES (
    1, 5, 1, 1, 'itinerario'
);

-- 14. Notizia pubblicata dal parco
INSERT INTO Notizia (
    ID, data, titolo, testo, immagine, parcoID
)
VALUES (
    1, '2025-06-01', 'Apertura estiva',
    'Il parco apre i sentieri estivi!', 'apertura.jpg', 1
);

-- 15. Registrazione presenza del visitatore
INSERT INTO Presenza (
    ID, visitatoreID, parcoID, data, oraIngresso, oraUscita, tipologiaUtente
)
VALUES (
    1, 1, 1, '2025-07-10', '09:00:00', '17:00:00', 'Adulto'
);

-- 16. Itinerario percorso durante la visita
INSERT INTO ItinerarioPercorso (
    ID, presenzaID, itinerarioID, valutazione, commento
)
VALUES (
    1, 1, 1, 5, 'Sentiero panoramico e ben curato.'
);
