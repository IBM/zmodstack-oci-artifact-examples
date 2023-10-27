#!/bin/sh

# Check that $INSTALL_DIR is set by IBM z/OS Package Manager.
if [[ -z "$INSTALL_DIR" ]]; then
  echo "ERROR: Missing environment variable INSTALL_DIR."
  exit 1
fi

# Check that $_CEE_RUNOPTS is set by IBM z/OS Package Manager.
if [[ -z "$_CEE_RUNOPTS" ]]; then
  echo "ERROR: Missing environment variable _CEE_RUNOPTS."
  exit 1
fi

echo "Configuring the git in ${INSTALL_DIR}."

cat <<EOF > ${INSTALL_DIR}/.env

echo "Setting up git..."

# Set GIT_HOME variable to PATH variable.
export GIT_HOME=${INSTALL_DIR}/git-2.41.0

# Set _CEE_RUNOPTS which is set by IBM z/OS Package Manager.
export _CEE_RUNOPTS='${_CEE_RUNOPTS}'

# Add Git to PATH variable.
export PATH=\${GIT_HOME}/bin:\$PATH

# Set MANPATH variable.
export MANPATH=\${GIT_HOME}/share/man:\$MANPATH

unset GIT_MAN_PATH
unset GIT_ROOT
unset GIT_SHELL

export GIT_TEMPLATE_DIR=\${GIT_HOME}/share/git-core/templates
export GIT_EXEC_PATH=\${GIT_HOME}/libexec/git-core/

git_config_sslCAinfo=\$(git config --global --get http.sslCAinfo)
git_config_sslVerify=\$(git config --global --get http.sslVerify)

if [ "\${git_config_sslVerify}" = "false" ] || [ "\${GIT_SSL_NO_VERIFY}x" != "x" ]; then
  echo "Warning: you are using git in an insecure way, consider unsetting GIT_SSL_NO_VERIFY or setting http.sslVerify to true." >&2
elif [ "\${GIT_SSL_CAINFO}x" = "x" ] && [ "\${git_config_sslCAinfo}x" = "x" ]; then
  if [ -f "\${GIT_HOME}/cacert.pem" ]; then
    export GIT_SSL_CAINFO="\${GIT_HOME}/cacert.pem"
  else
    echo "Warning: you need to set GIT_SSL_CAINFO or git config http.sslVerify to a pem file if you want to use git with SSH." >&2
  fi
fi

# Run setup.sh if it hasn't been run yet
#if [ ! -f "\${GIT_HOME}/.installed" ] && [ ! -f "\${GIT_HOME}/.installing" ] && [ -x "\${GIT_HOME}/setup.sh" ]; then
#  . \${GIT_HOME}/setup.sh
#fi

echo "Setup completed."

EOF

if [ ! -f "${INSTALL_DIR}/.env" ]; then
  echo "ERROR: The .env file was not created successfully. Please validate the write access permissions for user ID: ${USER} to directory: ${INSTALL_DIR}."
  exit 2
fi

echo "Sucessfully configuring the git in ${INSTALL_DIR}."

exit 0
