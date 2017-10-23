#!/bin/bash

source "/vagrant/scripts/common.sh"

function setupUtilities {
    # update the locate database
    updatedb
}

function setupSI {
	apt-get install -y sqlite3	
	apt-get install -y libsasl2-dev #sasl


	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	apt-get install -y nodejs
	npm install stylus -g


	
	pip install sphinx
	pip install sphinx sphinxcontrib-httpdomain
	pip install sphinx_rtd_theme

	#needed for spark 2.x series
	pip install py4j
	#sh /vagrant/resources/Anaconda2-5.0.0.1-Linux-x86_64.sh	-b -p $HOME/Anaconda2-5

	#phantomjs setup
	apt-get install -y build-essential chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1
	apt-get install -y imagemagick

	tar -xvjf /vagrant/resources/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /usr/local/share
	ln -sf /usr/local/share/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/local/bin

    pip install -r /vagrant/shareinsights/requirements.txt

}

echo "finalize ubuntu"
setupUtilities
echo "setup si"
setupSI
echo "setup finished"
