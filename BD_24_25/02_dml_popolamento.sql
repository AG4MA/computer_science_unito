
-- DML: Inserimento dati di esempio

INSERT INTO AreaProtetta (ID, nome, regione, tipologia, superficieTerrestre, superficieMarina, kmCosta, enteGestore, provvedimento, cets)
VALUES (1, 'Parco Nazionale del Gran Paradiso', 'Piemonte', 'Parco Nazionale', 70000, 0, 0, 'Ente Gran Paradiso', 'DPR 03/12/1922', TRUE);

INSERT INTO CentroVisita (ID, nome, parcoID)
VALUES (1, 'Centro Visitatori Valsavarenche', 1);

INSERT INTO StrutturaRicettiva (ID, nome, indirizzo, contatti, servizi, trattamenti, ecologico, perScuole, parcheggio, cets, parcoID)
VALUES (1, 'Rifugio Vittorio Emanuele II', 'Valsavarenche, AO', 'info@rifugiovittorio.it', 'Wi-Fi, Ristorante', 'Mezza Pensione', TRUE, TRUE, TRUE, TRUE, 1);

INSERT INTO Visitatore (ID, username, password, tipo)
VALUES (1, 'mario_rossi', 'password123', 'Adulto');

INSERT INTO Guida (ID, licenza, nome)
VALUES (1, 'GUIDA123', 'Luca Verdi');

INSERT INTO Itinerario (ID, nome, segnaletica, partenza, modalità, difficoltà, durata, parcoID)
VALUES (1, 'Sentiero Reale', 'CAI 3', 'Valsavarenche', 'a piedi', 'Media', 240, 1);

INSERT INTO TourGuidato (ID, itinerarioID, guidaID, orario, maxPartecipanti, stato)
VALUES (1, 1, 1, '2025-07-10 09:00:00', 20, 'attivo');

INSERT INTO Prenotazione (ID, strutturaID, visitatoreID, dataInizio, dataFine, ospiti, stato)
VALUES (1, 1, 1, '2025-07-10', '2025-07-12', 2, 'accettata');

INSERT INTO PrenotazioneTour (guidaID, tourID, visitatoreID)
VALUES (1, 1, 1);

INSERT INTO Commento (ID, testo, data, visitatoreID, itinerarioID)
VALUES (1, 'Bellissimo percorso, ben segnalato.', '2025-07-12', 1, 1);

INSERT INTO Valutazione (ID, stelle, visitatoreID, targetID, tipoTarget)
VALUES (1, 5, 1, 1, 'Itinerario');

INSERT INTO Notizia (ID, data, titolo, testo, immagine, parcoID)
VALUES (1, '2025-06-01', 'Apertura estiva', 'Il parco apre i sentieri estivi!', 'apertura.jpg', 1);
