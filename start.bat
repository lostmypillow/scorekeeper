@echo off
REM Start a simple HTTP server on port 3000 in the dist folder
cd /d C:\path\to\your\project
start cmd /k npx serve dist -l 3000

REM Wait a few seconds to let the server start (optional)
timeout /t 5 /nobreak

REM Launch Chrome in kiosk (fullscreen) mode at that URL
start chrome --start-fullscreen --app=http://localhost:3000
