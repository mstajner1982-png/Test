@echo off
REM gradlew.bat - Gradle wrapper for Windows (Gradle 8.4)
SETLOCAL
SET PRG=%~dpnx0

REM Resolve location
SET HERE=%~dp0
SET WRAPPER_JAR=%HERE%gradle\wrapper\gradle-wrapper.jar

IF NOT EXIST "%WRAPPER_JAR%" (
  echo Gradle wrapper jar not found: %WRAPPER_JAR%
  echo The gradle-wrapper.jar is required to run the wrapper. Ensure it exists.
  exit /b 1
)

IF DEFINED JAVA_HOME (
  SET "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
) ELSE (
  SET "JAVA_EXE=java"
)

"%JAVA_EXE%" -jar "%WRAPPER_JAR%" %*
EXIT /B %ERRORLEVEL%
