@echo off
setlocal

where javac >nul 2>&1
if errorlevel 1 (
  echo javac not found. Please install JDK 17+ and reopen terminal.
  exit /b 1
)

if not exist out mkdir out

dir /s /b src\main\java\*.java > sources.txt
javac -d out @sources.txt
if errorlevel 1 (
  echo Compile failed.
  del sources.txt
  exit /b 1
)

del sources.txt

java -cp out com.example.foodordering.App