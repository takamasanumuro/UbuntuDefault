#Programs to install when setting up a new system


###################################3||ZSH install and configuration||###############################################

#zsh(terminal shell)
sudo apt install zsh
#Make it default shell
chsh -s $(which zsh)
#logout and login again, then open the terminal and select option 2 to populate configuration files.
#########################################################################################################################################################################

#oh-my-zsh(terminal framework)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##zsh packages

#zplug(package manager)
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh


#improved syntax highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

#autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#warhol(command colorizer)
sudo apt install grc #dependency to colorize commands, warhol wraps around it
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/unixorn/warhol.plugin.zsh.git warhol
source ~/.zshrc


#fzf(terminal fuzzy finder) MAKE SURE ZSH IS INSTALLED BEFORE RUNNING THIS
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
source ~/.zshrc


####||ZSHRC CONFIGURATIONS||
ZSH_THEME="gnzh" 
ENABLE_CORRECTION="true"
#add plugins to .zshrc
plugins=( 
    # other plugins...
	git #version control
    autojump #jump to most used directories easily
    zsh-autosuggestions #command autocompletions
    web-search # google command inside shell
    dirhistory #Navigate directories using alt arrow
    # fast-syntax-highlighting # Highlights command syntax inside shell
	mosh #Tab completion for mosh hostnames
    zsh-interactive-cd #Fzf tab completion for cd
    tmux #Aliases for tmux
    warhol #command colorizer
    colored-man-pages # adds color to man pages
)


alias repup='git add . && git commit --amend --no-edit && git push origin --force-with-lease'
alias gpt='tgpt'
alias cdio='cd ~/Documents/PlatformIO'
alias piodl='pio device list'
alias piodm='pio device monitor'
alias piocl='pio run -t clean'
alias reloadzsh='source ~/.zshrc'
alias reloadbash='source ~/.bashrc'
alias zrc='micro ~/.zshrc'
alias brc='micro ~/.bashrc'
# # alias zrcode='code ~/.zshrc'
alias brcode='code ~/.bashrc'
alias ls='eza' # eza is a better ls
alias cat='batcat' # batcat is a better cat
alias huss='husarnet status' # Get status of Husarnet VPN
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin'
alias ipconfig='ifconfig'
alias CD='cd'
alias LS='ls'
alias CP='cp'
alias move='mv'
alias copy='cp'
alias phone='scrcpy -S --tcpip=$(hostname -I | awk '{print $1}')'

export warhol_ignore_ls=1 # Exclude ls from warhol as it is already colored by eza's alias to ls

# Function to wrap ntfy.sh curl request
function ntfy(){
    # $1 is the message to be sent
    # $2 is the topic name to which send the message
    if [ -z "$2" ]; then
        topic="alertas-adriano"
    else
        topic="$2"
    fi
    curl -d "$1" ntfy.sh/$topic
}

if [ -n "SSH_CLIENT" ]; then
    curl -d "SSH login from $(whoami) on $(hostname) at $(date)" ntfy.sh/alertas-emobil
fi

#########################################################################################################################

#chrome(browser, only works on AMD64 processor architectures)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#expect(used to automate terminal commands, which can be used to expect "y" for installing the next programs in the list)
sudo apt install expect

#remove brltty( in order for CH341 driver to work)
sudo apt-get autoremove brltty

#curl(used to download files from the internet)
sudo apt install curl

#micro(terminal text editor)
sudo apt install micro

#httpie(used to make http requests)
sudo apt install httpie

#htop(terminal system monitor)
sudo apt install htop

#bottom(terminal system monitor)
sudo snap install bottom

#neofetch(system info)
sudo apt install neofetch

#autojump(terminal directory navigation)
sudo apt install autojump
echo ". /usr/share/autojump/autojump.sh" >> ~/.bashrc

#tgpt(terminal ChatGPT)
curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | bash -s /usr/local/bin

#eza(improved ls)
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo tee /etc/apt/trusted.gpg.d/gierens.asc
echo "deb http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

#bat(improved cat)
sudo apt install bat

# # # # #tree(terminal directory tree)
sudo apt install tree

#mosh(terminal ssh that allows roaming connections without losing ssh session)
sudo apt install mosh
#https://mosh.org/#usage  Access this link to see how to use mosh
#If hosting mosh on an AWS Lightsail instance, you must allow UDP traffic on port 60000-61000 on the instance firewall

#https://tmuxcheatsheet.com/ Useful tmux cheatsheet
#tmux(terminal multiplexer and session manager, works very well with mosh)
sudo apt install tmux
#tmux packet manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
touch ~/.tmux.conf
echo " \
###################################
# List of plugins for ~/.tmux.conf 
set -g @plugin 'tmux-plugins/tpm' #plugin manager
set -g @plugin 'tmux-plugins/tmux-sensible' #improves tmux defaults
set -g @plugin 'catppuccin/tmux' #catppuccin status bar
set -g mouse on #enable mouse support
set -g @plugin 'tmux-plugins/tmux-yank' #copy to clipboard
set -g @plugin 'tmux-plugins/tmux-resurrect' #save tmux sessions across restarts
set -g @plugin 'tmux-plugins/tmux-continuum' #auto save tmux sessions

#Stats windows and panes at 1, not 0, to improve ease of layout
set -g base-index 1
setw -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on
set-option -sa terminal-overrides ",xterm*:Tc" #fixes tmux colors

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
" >> ~/.tmux.conf

#tmux source ~/.tmux.conf
#Then press prefix + I (capital i, as in Install) to fetch the plugins
#####################################


#ranger(terminal file manager)
sudo apt install ranger

#taskbook(terminal todo list)
sudo snap install taskbook
alias tb=taskbook

#ohmyposh(terminal theme)
curl -s https://ohmyposh.dev/install.sh | sudo bash -s
echo 'eval "$(oh-my-posh init bash)"' >> ~/.bashrc
exec bash

#navi(terminal cheatsheet)
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)
source ~/.bashrc

#ngrok(terminal tunneling)
sudo snap install ngrok

#barrier(terminal mouse and keyboard sharing)
sudo apt install barrier
#Disable SSL on configs tab
sudo micro /etc/gdm3/custom.conf
#Uncomment #WaylandEnable=false
sudo systemctl restart gdm3

#avahi((network discovery via .local)
sudo apt-get install avahi-daemon
# Firewall (here uncomplicated firewall on ubuntu)
ufw allow mdns

#ncdu(terminal disk usage)
sudo apt install ncdu

#portal(terminal file transfer)
curl -sL portal.spatiumportae.com | sudo bash

#nmap(terminal network scanner)
sudo apt install nmap

#Gnome extensions
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
https://extensions.gnome.org/extension/4642/mouse-follows-focus/ #Moves mouse to the center of the window when open
https://extensions.gnome.org/extension/5410/grand-theft-focus/ #Removes window is ready notification and goes straight to the window
https://extensions.gnome.org/extension/3724/net-speed-simplified/ # Network upload and download speed 
https://extensions.gnome.org/extension/1723/wintile-windows-10-window-tiling-for-gnome/ ##Better window tiling
https://extensions.gnome.org/extension/2986/runcat/ # Tells CPU usage
https://extensions.gnome.org/extension/517/caffeine/ # Prevents lock screen

#pip
sudo apt update
sudo apt install python3-pip

#pipx(python package manager that installs packages in isolated environments, but accessible from the terminal)
#pipx enables you to:
#Expose CLI entrypoints of packages ("apps") installed to isolated environments with the install command. This guarantees no dependency conflicts and clean uninstalls!
#Easily list, upgrade, and uninstall packages that were installed with pipx
#Run the latest version of a Python application in a temporary environment with the run command
python3 -m pip install --user pipx
python3 -m pipx ensurepath

#mavproxy
sudo apt-get install python3-dev python3-opencv python3-wxgtk4.0 python3-pip python3-matplotlib python3-lxml python3-pygame
pip3 install PyYAML mavproxy --user
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.zshrc

#QGroundControl(ground control station for drones)
sudo usermod -a -G dialout $USER
sudo apt-get remove modemmanager -y
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y
sudo apt install libqt5gui5 -y
sudo apt install libfuse2 -y

mkdir ~/Documents/DroneTools
wget https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage
chmod +x ./QGroundControl.AppImage
mv ./QGroundControl.AppImage ./QGroundControl # rename
#create symbolic link
sudo ln -s ~/Documents/DroneTools/QGroundControl /usr/local/bin/QGroundControl
sudo ln -s ~/Documents/DroneTools/QGroundControl /usr/local/bin/QGC
sudo ln -s ~/Documents/DroneTools/QGroundControl /usr/local/bin/qgc
cd ~ # go back to home directory

#Install FlightGear for 3d Visualization of SITL simulation
#Inside the program make sure to download environment and aircrafts
sudo apt-get install flightgear
sudo ln -s ~/Documents/DroneTools/ardupilot/Tools/autotest/sim_vehicle.py /usr/local/bin/sitl
sudo ln -s ~/Documents/DroneTools/ardupilot/Tools/autotest/fg_quad_view.sh /usr/local/bin/flightgear



#Create PlatformIO symbolic links for global access on terminal
mkdir -p /usr/local/bin
#You might need to create the platformio, pio and piodebuggdb files on /usr/local/bin before creating the symbolic links using touch command
ln -s ~/.platformio/penv/bin/platformio /usr/local/bin/platformio
ln -s ~/.platformio/penv/bin/pio /usr/local/bin/pio
ln -s ~/.platformio/penv/bin/piodebuggdb /usr/local/bin/piodebuggdb


##Commands that expect something else than "y" or "n" as input below

https://github.com/broccoli5/catppuccin-gnome-terminal

#docker

##Install Docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Remove sudo requirement for Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#Install docker-compose
sudo apt install docker-compose

#Download and install deb package
curl https://desktop.docker.com/linux/main/amd64/docker-desktop-4.23.0-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64
$ sudo apt-get update
$ sudo apt-get install ./docker-desktop-4.23.0-amd64.deb

systemctl --user start docker-desktop

#Generate your key
gpg --generate-key
pass init <your_generated_gpg-id_public_key>

##################NodeJS#############
#Download and import the Nodesource GPG key
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

#Create deb repository
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
#Run update and install Node.js
sudo apt-get update
sudo apt-get install -y nodejs

#Install tldr (terminal cheatsheet for man pages)
sudo npm install -g tldr


#-------------------------OpenVPN------------
sudo apt install apt-transport-https
curl -fsSL https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub | sudo gpg --dearmor > /etc/apt/trusted.gpg.d/openvpn-repo-pkg-keyring.gpg
curl -fsSL https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-jammy.list >/etc/apt/sources.list.d/openvpn3.list
sudo apt update
sudo apt install openvpn3

#Download OpenVPN configuration file
unzip <file_name>.zip
openvpn3 session-start --config <file_name>.ovpn