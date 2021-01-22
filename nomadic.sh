###
#
# NOMADIC INSTALLER
#
###

echo "[nomadic][installer] START"

source /etc/os-release
if [ "$ID" == "debian" ] || [ "$ID" == "ubuntu" ]; then
    export USE='deb'
    export PM='apt -y'; 
    export PKGS='ruby-full redis mosquitto ircd-hybrid build-essential';
elif [ "$ID" == "fedora" ]; then
    export USE='rpm'
    export PM='yum -y'; 
    export PKGS='ruby redis mosquitto ircd-ratbox'
else
    echo "no release ID." && exit
fi

sudo $PM update 2>&1> /dev/null
sudo $PM upgrade
sudo $PM install $PKGS

if [ "$1" == "node" ] || [ "$1" == "dev" ]; then
  if [ "$USE" == "rpm" ]; then
    sudo dnf group install lxde-desktop
  else
    sudo $PM install lxde arduino gdk3  
  fi
fi

if [ "$1" == "dev" ]; then
  PKGS='arduino emacs vim nmap'
  if [ "$USE" == "rpm" ]; then
    export PKGS=$PKGS + " nmap-ncat"
  else
    export PKGS=$PKGS + " netcat" 
  fi
  sudo $PM install $PKGS
end

echo "[nomadic][installer] DONE!"
