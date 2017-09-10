A simple vagrant setup for a ubuntu xenial machine with some ctf tools :)

# Tools included

* [angr](https://github.com/angr/angr)
* [binwalk](https://github.com/devttys0/binwalk)
* [fish](https://fishshell.com/)
* [foremost](http://foremost.sourceforge.net/)
* [nmap](https://nmap.org/)
* [pwntools](https://github.com/Gallopsled/pwntools)
* [radare2](https://github.com/radare/radare2)
* [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)
* [rekall](https://github.com/google/rekall)
* [tmux](https://github.com/tmux/tmux/wiki)

# Requirements
* [Vagrant](https://www.vagrantup.com/)
* [Virtualbox](https://www.virtualbox.org/)

# Initial setup

    git clone https://github.com/Raeyra/ctf_machine
    cd ctf_machine
    mkdir vm_share
    vagrant up
    *** wait for the initial setup script to install ***
    vagrant ssh

your box is now configured! :)
see below for iterm profile configuration

# Iterm profile config
to enable auto load/ssh on terminal creation with iterm2, add the following line to your "send text at login" section of your profile in iterm
```cd ~/vagrant/ctf_machine; ./startup_check.sh```

## Configurations
angr/rekall are in their own virtualenv. use ```source ~/tools/<name>/bin/activate``` before using these tools

My personal dot files include the following
### ~/.vimrc
    :sy on
    :set nu et ai nocp sw=4 ts=4
    :imap kj <Esc> 

## ~/.radare2rc
    eco focus
    e scr.utf8 = true
    e cmd.stack = true
    e asm.pseudo = true
    
# TODO
add volatility support
