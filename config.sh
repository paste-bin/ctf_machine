
HOMEDIR=/home/ubuntu
sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en.UTF-8

# install 32 bit architecture support

sudo dpkg --add-architecture i386
sudo apt-get -y update 
sudo apt-get install -y libc6:i386 
sudo apt-get install -y libncurses5:i386 
sudo apt-get install -y libstdc++6:i386

# tools through apt get
sudo apt-get -y update 
sudo apt-get install -y build-essential 
sudo apt-get install -y binwalk 
sudo apt-get install -y nmap 
sudo apt-get install -y python-pip 
sudo apt-get install -y python3-pip 
sudo apt-get install -y virtualenv 
sudo apt-get install -y libssl-dev # used for volatility
sudo apt-get install -y libncurses5-dev # used for volatility
sudo apt-get install -y libncursesw5-dev # used for volatility
sudo apt-get install -y libffi-dev # used for volatility
sudo apt-get install -y foremost 
sudo apt-get install -y tmux 
sudo apt-get install -y fish 
sudo apt-get install -y unzip


sudo pip install --upgrade pip

# install python modules
cd $HOMEDIR
mkdir tools

TOOLS=$HOMEDIR/tools

# Install Radare2
cd $TOOLS
git clone https://github.com/radare/radare2.git
cd $TOOLS/radare2
./sys/install.sh


# Install ROPGadget
cd $TOOLS
git clone https://github.com/JonathanSalwan/ROPgadget
cd $TOOLS/ROPgadget
sudo bash -c 'python setup.py install'

# ----- virtual -----

# angr
virtualenv $TOOLS/angr
source $TOOLS/angr/bin/activate
pip install angr
deactivate

# volatility
#cd $TOOLS
#git clone https://github.com/volatilityfoundation/volatility.git
##virtualenv volatility
#source $TOOLS/volatility/bin/activate
#pip install distorm3 yara PyCrypto OpenPyxl ujson pytz
#export PATH=$PATH:/usr/local/lib/python2.7/dist-packages/usr/lib/libyara.so
##deactivate

# rekall
virtualenv $TOOLS/rekall
source $TOOLS/rekall/bin/activate
pip install --upgrade setuptools pip wheel rekall-agent rekall 
echo "profile_path:$HOMEDIR/.rekallrc" >> $HOMEDIR/.rekallrc
echo "https://raw.githubusercontent.com/google/rekall-profiles" >> $HOMEDIR/.rekallrc
deactivate

# pwndbg
# cd $HOMEDIR/tools
# git clone https://github.com/pwndbg/pwndbg
# $HOMEDIR/tools/pwndbg
# ./setup.sh


# ---- maybe? -----

# sqlalchemy? - flask?

# ----- global -----

pip install --upgrade pwntools requests scapy r2pipe

# dot files

touch $HOMEDIR/.radare2rc
echo 'eco focus' > $HOMEDIR/.radare2rc
echo 'e scr.utf8 = true' >> $HOMEDIR/.radare2rc
echo 'e cmd.stack = true' >> $HOMEDIR/.radare2rc
echo 'e asm.pseudo = true' >> $HOMEDIR/.radare2rc

touch $HOMEDIR/.vimrc
echo ':sy on' > $HOMEDIR/.vimrc
echo ':set nu et ai nocp sw=4 ts=4' >> $HOMEDIR/.vimrc
echo ':imap kj <Esc>' >> $HOMEDIR/.vimrc


# clone git repos
