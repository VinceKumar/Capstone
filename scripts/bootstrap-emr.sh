#!/bin/bash

# Record starting time
touch $HOME/.bootstrap-begin

sudo yum -y update
sudo yum -y install tmux

# set -e
wget -S -T 10 -t 5 https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh -O $HOME/anaconda.sh
sudo bash $HOME/anaconda.sh -b -p $HOME/anaconda
sudo rm $HOME/anaconda.sh
sudo chown -R hadoop:hadoop $HOME/anaconda
export PATH=$HOME/anaconda/bin:$PATH

# Add Anaconda to path
echo -e "\n\n# Anaconda2" >> $HOME/.bashrc
echo "export PATH=$HOME/anaconda/bin:$PATH" >> $HOME/.bashrc



# Record ending time
touch $HOME/.bootstrap-end
