@echo off
REM -- Torna alla cartella superiore
cd ..

REM -- Aggiunge tutte le modifiche
git add .

REM -- Commit con messaggio “a”
git commit -m "a"

REM -- Pusha sul remote di default (es. origin) e branch corrente
git push

pause
