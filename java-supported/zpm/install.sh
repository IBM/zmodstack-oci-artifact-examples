#!/bin/sh

# Check that INSTALL_DIR is set by IBM z/OS Package Manager.
if [[ -z "$INSTALL_DIR" ]]; then
  echo "ERROR: Missing environment variable INSTALL_DIR."
  exit 1
fi

echo "Configuring Java in ${INSTALL_DIR}."

# Define $JAVA_HOME to reference installation directory, and append the Java SDK's 'bin' directory to $PATH.
cat <<EOF > ${INSTALL_DIR}/.env
export JAVA_HOME=$INSTALL_DIR/J8.0_64
export PATH=\$JAVA_HOME/bin:\$PATH
EOF

if [ ! -f "${INSTALL_DIR}/.env" ]; then
  echo "ERROR: The .env file was not created successfully. Please validate the write access permissions for user ID: ${USER} to directory: ${INSTALL_DIR}."
  exit 2
fi

echo "Sucessfully configured Java in ${INSTALL_DIR}."

exit 0
