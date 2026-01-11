@echo off
cls
echo ========================================
echo   DSA Sports Database Management System
echo ========================================
echo.

REM Navigate to project directory
cd /d "%~dp0"

REM Copy data file if not exists
if not exist "Code\data.csv" (
    echo [1/3] Copying data file...
    copy data.csv Code\ >nul 2>&1
    echo      Done!
) else (
    echo [1/3] Data file already exists
)

REM Compile Java code
echo [2/3] Compiling Java code...
javac Code\dsa.java

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Compilation failed!
    echo Please check for syntax errors.
    pause
    exit /b 1
)
echo      Compiled successfully!

REM Run the program
echo [3/3] Starting application...
echo.
echo ========================================
java Code.dsa

echo.
echo ========================================
echo Program finished!
pause