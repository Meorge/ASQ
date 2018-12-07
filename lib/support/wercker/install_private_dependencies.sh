#!/bin/bash
# MAINTAINER: Vincenzo Ferme <info@vincenzoferme.it>
# SETUP ASQ PRIVATE DEPENDENCIES
set -ex

# Configure ENV variables
export slide2htmlDir=slide2html
export slide2htmlBranch=master
export slide2htmlCommit=7e572868ebbd1b96b04f53a40c0bfebe9e34a16e

export uiDir=public/ui
export uiBranch=master
export uiCommit=b9a8eb6fc3dd5b25d522682ee46cc3b21299c5f9

export cockpitDir=public/cockpit
export cockpitBranch=master
export cockpitCommit=e5b342d0c1a06c5c7ad7e541117f971d324c77ad

# Execute the pipeline
current_folder=$(pwd)
# cd ${WERCKER_SOURCE_DIR}
CI_USER_TOKEN=${CI_USER_TOKEN} npm run install-private-dependencies
cd $current_folder

# Clean up folders if in CI (so we cache only the needed files)
if [ "$CI" = true ]; then
	rm -Rf $slide2htmlDir/.git $uiDir/.git $cockpitDir/.git
fi
