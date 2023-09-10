#Programs to install when setting up a new system

#remove brltty( in order for CH341 driver to work)
sudo apt-get autoremove brltty

#expect(used to automate terminal commands)
sudo apt install expect

#curl(used to download files from the internet)
sudo apt install curl

#micro(terminal text editor)
sudo apt install micro

#httpie(used to make http requests)
sudo apt install httpie

#htop(terminal system monitor)
sudo apt install htop

#bottom(terminal system monitor)
sudo apt install bottom

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

#tree(terminal directory tree)
sudo apt install tree

#portal(terminal file transfer)
curl -sL portal.spatiumportae.com | sudo bash

#ranger(terminal file manager)
sudo apt install ranger

#taskbook(terminal todo list)
sudo snap install taskbook
alias tb=taskbook

#ohmyposh(terminal theme)
curl -s https://ohmyposh.dev/install.sh | sudo bash -s
echo 'eval "$(oh-my-posh init bash)"' >> ~/.bashrc
exec bash

#fzf(terminal fuzzy finder)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#navi(terminal cheatsheet)
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)

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