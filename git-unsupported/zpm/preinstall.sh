#!/bin/sh

echo "Preinstall checking..."

uName=`echo \`uname -I\``

if [[ "${uName}" != "z/OS" ]]; then
  echo "Git is not supported on ${uName}"
  
  echo "Preinstall check has failed."
  exit 1;
fi

echo "Preinstall check has passed."

exit 0
