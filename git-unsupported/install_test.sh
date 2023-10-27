#!/bin/sh

# Note: Please source the .env file which is available in $INSTALL_DIR before running this script.

# Check that $GIT_HOME is set by .env
if [[ -z "$GIT_HOME" ]]; then
  echo "ERROR: Missing environment variable GIT_HOME."
  exit 1
fi

# Display location of git
typeGit=`echo \`type git\``
echo $typeGit

version=$(git --version | cut -f3 -d' ')

if [ "$version" = "2.41.0" ]; then
  echo "Test is successful."
	exit 0
fi

echo "Git version $version is incorrect. Check installation."

echo "Test is unsuccessful."

exit 2
