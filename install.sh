#!/bin/bash

DEV='emacs emacs-goodies-el vim ruby-full build-essential'
SYS='inotify-tools screen redis-server openssh-server '
SEC='nmap netcat sudo'
GEMS="pry sinatra redis-objects cinch thin"

USERNAME=$1
DEBS="$DEV $SYS $SEC"
SKEL=/etc/skel
DEFAULTS=/etc/defaults


if [[ $1 == '' ]]; then
    echo "usage: [sudo] ./nomadic.sh <username> [--gui]"
    exit
fi

i=/etc/issue
echo -e "   .#@@@@@@@@@@@@@@@@@@@@@@@@#." > $i
echo -e "     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $i
echo -e "      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $i
echo -e "      .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@." >> $i
echo -e "      #@@@@@@@@@@@ NOMADIC @@@@@@@@@@@@#" >> $i
echo -e "      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $i
echo -e "      @@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@" >> $i
echo -e "      @@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@" >> $i
echo -e "      @@@@@@@@    @@@@@@@@  +@@@@@@@@@@@" >> $i
echo -e "      @@@@@@@@@  @@  @@@@    @@@@@@@@@@@" >> $i
echo -e "      @@@@@@@@@@   ; +@@@    @@@@@@@@@@@" >> $i
echo -e "      @@@@@@@@@+   .  @@@@  ;@  @@@@@@@@" >> $i
echo -e "      @@@@@@@@@     + +@@@@      @@@@@@@" >> $i
echo -e "      @@@@@@@@@        @@@@      @@@@@@@" >> $i
echo -e "      @@@@@@@@@      @@@@@;    # ;@@@@@@" >> $i
echo -e "      @@@@@@@:  +     @@@@       @@@@@@@" >> $i
echo -e "      @@@@@@   #@     @@@  +    @@@@@@@@" >> $i
echo -e "      @@@@@  @@@@,    @.  @@:   ;@@@@@@@" >> $i
echo -e "      @@@@@@; @@@    @@  @@@+   @@@@@@@@" >> $i
echo -e "      @@@@@@@ @@;    @@@ +@@    @@@@@@@@" >> $i
echo -e "      @@@@@@@# @      @@@ @@    @@@@@@@@" >> $i
echo -e "      @@@@@@@@    :   @@@.;.     @@@@@@@" >> $i
echo -e "      @@@@@@@@@   @@  #@@@   @   @@@@@@@" >> $i
echo -e "      @@@@@@@@@   @@,  @@@: .@@  @@@@@@@" >> $i
echo -e "      @@@@@@@@@  #@@@  @@@.  @@, ;@@@@@@" >> $i
echo -e "      @@@@@@@@@   @@@, +@@   @@@  @@@@@@" >> $i
echo -e "      @@@@@@@@: . :@@@  @@   #@@: @@@@@@" >> $i
echo -e "      @@@@@@@@@  @ @@@: @@ .# @@@  @@@@@" >> $i
echo -e "      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $i
echo -e "      #@@@@@@@@@@@@@ LINUX @@@@@@@@@@@@#" >> $i
echo -e "      .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@." >> $i
echo -e "        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $i
echo -e "           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >> $i
echo -e "    	       .#@@@@@@@@@@@@@@@@@@@@@@@@#." >> $i

cat << EOF > $SKEL/.screenrc 
shell -${SHELL}
caption always "[ %t(%n) ] %w"
defscrollback 1024
startup_message off
hardstatus on
hardstatus alwayslastline
screen -t emacs 9 emacs -nw --funcall erc
# screen -t '>' 0 gluon --client
EOF


#############################
#apt-get -y install $DEBS $G
#gem install $GEMS
#############################
if [[ $2 == '--gui' ]]; then
    echo 'startx' >> $SKEL/.profile
    #    git clone git://git.suckless.org/dwm
    mkdir dwm
    cp lib/dwm.config.h dwm/config.h
    cp lib/gui.sh dwm/
    cp lib/nomadic_wallpaper.jpg dwm/
    cd dwm
    ./gui.sh
fi

userdel $USERNAME
rm -fR /home/$USERNAME
useradd --shell /bin/bash -m $USERNAME
usermod -a -G sudo $USERNAME
echo "$USERNAME ALL = (ALL) ALL" >> /etc/sudoers
echo "**** SET YOUR NEW PASSWORD FOR $USERNAME ***"
passwd $USERNAME
