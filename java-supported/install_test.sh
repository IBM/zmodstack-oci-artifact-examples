#!/bin/sh

# Note: Please source the .env file which is available in $INSTALL_DIR before running this script.

# Check that JAVA_HOME is set by .env 
if [[ -z "$JAVA_HOME" ]]; then
  echo "ERROR: Missing environment variable JAVA_HOME"
  exit 1
else
  echo "Environment variable JAVA_HOME is: ${JAVA_HOME}"
fi

# A HelloWorld.class is included in the base directory of Java SDK for install verification test.
java -cp ${JAVA_HOME} HelloWorld

if [ $? -eq 0 ]; then
  echo "Test successful."
else
  echo "Test unsuccessful."
  exit 2
fi

exit 0
