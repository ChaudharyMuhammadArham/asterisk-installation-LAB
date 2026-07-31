## install/compile-from-source.md

#Add:
#- Download source
#- Extract
#- Configure
#- Build
#- Install

#Example:
# Compile Asterisk From Source
## Download Source

cd /usr/src
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20.latest.tar.gz
tar -xzf asterisk-20.latest.tar.gz
#configur
./configure
#compile
make -j$(nproc)
#install
sudo make install
sudo make samples
sudo make config
