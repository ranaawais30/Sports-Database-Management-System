#!/bin/bash

echo "========================================"
echo "  DSA Sports Database Management System"
echo "========================================"
echo ""

# Navigate to project directory
cd "$(dirname "$0")"

# Copy data file if not exists
if [ ! -f "Code/data.csv" ]; then
    echo "[1/3] Copying data file..."
    cp data.csv Code/ 2>/dev/null
    echo "      Done!"
else
    echo "[1/3] Data file already exists"
fi

# Compile Java code
echo "[2/3] Compiling Java code..."
javac Code/dsa.java

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: Compilation failed!"
    echo "Please check for syntax errors."
    read -p "Press Enter to exit..."
    exit 1
fi
echo "      Compiled successfully!"

# Run the program
echo "[3/3] Starting application..."
echo ""
echo "========================================"
java Code.dsa

echo ""
echo "========================================"
echo "Program finished!"
read -p "Press Enter to exit..."