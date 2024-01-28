#!/bin/bash

# Clone and install nwg-look
#git clone https://github.com/nwg-piotr/nwg-look.git
#cd nwg-look
#make build
#sudo make install
sudo dnf copr enable -y tofik/nwg-shell 
sudo dnf install -y nwg-look
cd ..
