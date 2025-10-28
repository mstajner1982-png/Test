#!/usr/bin/env sh
# gradlew - Gradle wrapper shell script for Gradle 8.4
# This script delegates to the gradle wrapper jar in gradle/wrapper.
# It is a standard wrapper script (trimmed to POSIX sh compatible).
set -eu

PRG="$0"

# Resolve symbolic links
while [ -h "$PRG" ] ; do
  ls=$(ls -ld "$PRG")
  link=$(expr "$ls" : '.*-> \(.*\)$')
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=$(dirname "$PRG")/"$link"
  fi
done

GRADLE_HOME=
# Determine location of the wrapper JAR
HERE=$(dirname "$PRG")
WRAPPER_JAR="$HERE/gradle/wrapper/gradle-wrapper.jar"
WRAPPER_PROPERTIES="$HERE/gradle/wrapper/gradle-wrapper.properties"

# Detect java
if [ -n "${JAVA_HOME:-}" ] && [ -x "${JAVA_HOME}/bin/java" ]; then
  JAVA_CMD="${JAVA_HOME}/bin/java"
else
  JAVA_CMD=java
fi

if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Gradle wrapper jar not found: $WRAPPER_JAR" >&2
  echo "The gradle-wrapper.jar is required to run the wrapper. Ensure it exists." >&2
  exit 1
fi

exec "$JAVA_CMD" -jar "$WRAPPER_JAR" "$@"
