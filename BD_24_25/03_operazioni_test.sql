-- Operazioni di test vincoli referenziali

-- 1. DELETE: tentativo di eliminare un Parco collegato a CentriVisita
DELETE FROM AreaProtetta WHERE ID = 1;

-- 2. UPDATE: modifica dell'ID di una Guida già assegnata
UPDATE Guida SET ID = 99 WHERE ID = 1;

-- 3. DELETE: eliminazione di un Itinerario con TourGuidati associati
DELETE FROM Itinerario WHERE ID = 1;

-- 4. DELETE: eliminazione di una Presenza con ItinerariPercorsi associati
DELETE FROM Presenza WHERE ID = 1;

-- 5. DELETE: eliminazione di un Visitatore con Presenze e Prenotazioni
DELETE FROM Visitatore WHERE ID = 1;
