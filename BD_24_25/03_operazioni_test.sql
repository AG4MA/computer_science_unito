-- TEST 1: Tentativo di eliminare un'AreaProtetta con entità collegate (CentroVisita, Itinerario, StrutturaRicettiva, Notizia, Presenza)
-- Aspettativa: fallisce se NON è definita ON DELETE CASCADE o ON DELETE SET NULL nei vincoli
DELETE FROM AreaProtetta WHERE ID = 1;

-- TEST 2: Modifica dell’ID di una Guida collegata a GuidaItinerario e TourGuidato
-- Aspettativa: fallisce per vincolo FOREIGN KEY se le relazioni non sono aggiornate in cascata
UPDATE Guida SET ID = 99 WHERE ID = 1;

-- TEST 3: Tentativo di eliminare un Itinerario con TourGuidati associati
-- Aspettativa: fallisce per vincolo referenziale (TourGuidato → Itinerario)
DELETE FROM Itinerario WHERE ID = 1;

-- TEST 4: Tentativo di eliminare una Presenza con riferimenti in ItinerarioPercorso
-- Aspettativa: fallisce per vincolo referenziale (ItinerarioPercorso → Presenza)
DELETE FROM Presenza WHERE ID = 1;

-- TEST 5: Tentativo di eliminare un Visitatore con relazioni attive (Prenotazioni, Commenti, Valutazioni, Presenze, ecc.)
-- Aspettativa: fallisce per vincoli referenziali multipli
DELETE FROM Visitatore WHERE ID = 1;
