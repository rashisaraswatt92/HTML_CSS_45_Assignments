@echo off
setlocal
cd /d "%~dp0"
where git >nul 2>nul
if errorlevel 1 (
  echo Git was not found. Install Git for Windows, then reopen this file.
  pause
  exit /b 1
)
if not exist .git (
  git init
  if errorlevel 1 goto error
)
git add .
git commit -m "Add HTML CSS assignment starter pages"
if errorlevel 1 (
  echo Commit failed. If Git says your identity is unknown, set your name and email first.
  echo Example: git config --global user.name "Rashi Saraswat"
  echo Example: git config --global user.email "YOUR_EMAIL_ADDRESS"
  pause
  exit /b 1
)
echo.
echo Initial local commit created. No files have been uploaded to GitHub yet.
echo Read README.md for the next steps and GitHub remote setup.
pause
exit /b 0
:error
echo Git operation failed. Read the error above.
pause
exit /b 1
