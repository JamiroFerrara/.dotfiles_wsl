FLYCTL_INSTALL := $(shell echo $$HOME)

init:
	mkdir -p ${HOME}/.config
	mkdir -p ${HOME}/.local
	mkdir -p ${HOME}/.local/share
	sudo ln -vsf ${PWD}/.alias ${HOME}/.alias
	sudo ln -vsf ${PWD}/.functions ${HOME}/.functions
	sudo ln -vsf ${PWD}/.env ${HOME}/.env
	sudo ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	sudo ln -vsf ${PWD}/.bashrc ${HOME}/.bashrc
	sudo ln -vsf ${PWD}/.scripts ${HOME}/.scripts
	sudo ln -vsf ${PWD}/.tmux ${HOME}/.tmux
	sudo ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	sudo ln -vsf ${PWD}/starship.toml ${HOME}/.config/starship.toml
	sudo ln -vsf ${PWD}/nvim ${HOME}/.config/nvim
	sudo ln -vsf ${PWD}/db_ui ${HOME}/.local/share/db_ui
	sudo ln -vsf ${PWD}/zsh ${HOME}/.local/share/zsh
	sudo ln -vsf ${PWD}/ranger ${HOME}/.local/share/ranger
	sudo ln -vsf ${PWD}/nvim_share ${HOME}/.local/share/nvim
	sudo ln -vsf ${PWD}/bin/git /usr/local/bin/
	sudo ln -vsf ${PWD}/bin/chisel /usr/local/bin/
	sudo ln -vsf ${PWD}/bin/proxychains /usr/local/bin/
	sudo ln -vsf ${PWD}/win_bin/xh.exe /usr/local/bin/
	sudo ln -vsf ${PWD}/win_bin/lftp/ /usr/local/

install:
	sudo apt update
	sudo apt upgrade
	sudo apt remove nano
	# make libssl
	make unzip
	make fly
	make wget
	make gum
	make tmux
	make zsh
	make neovim
	make cmatrix
	make lazygit
	make starship
	make gh
	make fzf
	make fzy
	make exa
	make ripgrep
	make nala
	make entr
	make ranger
	make nushell
	make gping 
	make xh
	make node
	make bun
	make surrealdb
	make gawk
	make rust
	make dotnet
	make fd
	make dog
	make gitflow
	make lf
	make php
	make lftp
	make openvpn
	make xclip
	make mysql
	make gitflow
	make inotify-tools
	make jqp
	make atuin
	make cloc

tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

atuin:
	curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

wsl-vpnkit:
	sudo apt update
	sudo apt upgrade
	sudo apt-get install iproute2 iptables iputils-ping dnsutils
	sudo mkdir /usr/local/wsl-vpnkit
	cd /usr/local/wsl-vpnkit && sudo wget https://github.com/sakai135/wsl-vpnkit/releases/download/v0.4.1/wsl-vpnkit.tar.gz
	cd /usr/local/wsl-vpnkit && sudo tar --strip-components=1 -xf wsl-vpnkit.tar.gz \
	app/wsl-vpnkit \
	app/wsl-gvproxy.exe \
	app/wsl-vm \
	app/wsl-vpnkit.service

mysql:
	sudo apt update
	sudo apt install gnupg
	cd /tmp && wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
	cd /tmp && sudo dpkg -i mysql-apt-config*
	sudo apt update
	sudo apt install mysql-server
	sudo systemctl status mysql

dotnet:
	rm -dfr ${HOME}/.dotnet
	make dotnet8
	make dotnet7
	make dotnet21

dotnet8_runtime:
	sudo apt-get install -y dotnet-sdk-8.0

dotnet8:
	make wget
	make rsync
	wget https://download.visualstudio.microsoft.com/download/pr/db901b0a-3144-4d07-b8ab-6e7a43e7a791/4d9d1b39b879ad969c6c0ceb6d052381/dotnet-sdk-8.0.401-linux-x64.tar.gz
	mkdir -p temp
	mv dotnet-sdk-8.0.401-linux-x64.tar.gz temp
	cd temp && tar -xzf dotnet-sdk-8.0.401-linux-x64.tar.gz
	rm -dfr temp/dotnet-sdk-8.0.401-linux-x64.tar.gz
	mkdir -p ${HOME}/.dotnet
	rsync -a temp/ ${HOME}/.dotnet
	rm -dfr temp

dotnet7:
	make wget
	make rsync
	wget https://download.visualstudio.microsoft.com/download/pr/61f29db0-10a5-4816-8fd8-ca2f71beaea3/e15fb7288eb5bc0053b91ea7b0bfd580/dotnet-sdk-7.0.401-linux-x64.tar.gz
	mkdir -p temp
	mv dotnet-sdk-7.0.401-linux-x64.tar.gz temp
	cd temp && tar -xzf dotnet-sdk-7.0.401-linux-x64.tar.gz
	rm -dfr temp/dotnet-sdk-7.0.401-linux-x64.tar.gz
	mkdir -p ${HOME}/.dotnet
	rsync -a temp/ ${HOME}/.dotnet
	rm -dfr temp

dotnet21:
	make wget
	make rsync
	wget https://download.visualstudio.microsoft.com/download/pr/5797d98a-8faf-472d-925c-931ac542d3c8/e48942da88f4d9d653a7b5c0790e7724/dotnet-sdk-2.1.818-linux-x64.tar.gz
	mkdir -p temp
	mv dotnet-sdk-2.1.818-linux-x64.tar.gz temp
	cd temp && tar -xzf dotnet-sdk-2.1.818-linux-x64.tar.gz
	rm -dfr temp/dotnet-sdk-2.1.818-linux-x64.tar.gz
	mkdir -p ${HOME}/.dotnet
	rsync -a temp/ ${HOME}/.dotnet
	rm -dfr temp

dotnet31:
	make wget
	make rsync
	wget https://download.visualstudio.microsoft.com/download/pr/e89c4f00-5cbb-4810-897d-f5300165ee60/027ace0fdcfb834ae0a13469f0b1a4c8/dotnet-sdk-3.1.426-linux-x64.tar.gz
	mkdir -p temp
	mv dotnet-sdk-3.1.426-linux-x64.tar.gz temp
	cd temp && tar -xzf dotnet-sdk-3.1.426-linux-x64.tar.gz
	rm -dfr temp/dotnet-sdk-3.1.426-linux-x64.tar.gz
	mkdir -p ${HOME}/.dotnet
	rsync -a temp/ ${HOME}/.dotnet
	rm -dfr temp

go:
	make wget
	wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
	mkdir -p temp
	mv go1.21.1.linux-amd64.tar.gz temp
	cd temp && tar -xzf go1.21.1.linux-amd64.tar.gz
	mv temp/go /usr/local/
	rm -dfr temp

gum:
	make wget
	wget https://github.com/charmbracelet/gum/releases/download/v0.10.0/gum_0.10.0_Linux_x86_64.tar.gz
	mkdir -p temp
	mv gum_0.10.0_Linux_x86_64.tar.gz temp
	cd temp && tar -xzf gum_0.10.0_Linux_x86_64.tar.gz
	sudo cp temp/gum /usr/local/bin/
	rm -dfr temp

dog:
	make wget
	wget https://github.com/ogham/dog/releases/download/v0.1.0/dog-v0.1.0-x86_64-unknown-linux-gnu.zip
	mkdir -p temp
	mv dog-v0.1.0-x86_64-unknown-linux-gnu.zip temp
	cd temp && unzip dog-v0.1.0-x86_64-unknown-linux-gnu.zip
	cp temp/bin/dog /usr/local/bin
	rm -dfr temp

fd:
	make wget
	wget https://github.com/sharkdp/fd/releases/download/v8.7.0/fd-v8.7.0-x86_64-unknown-linux-musl.tar.gz
	mkdir -p temp
	mv fd-v8.7.0-x86_64-unknown-linux-musl.tar.gz temp
	cd temp && tar -xzf fd-v8.7.0-x86_64-unknown-linux-musl.tar.gz
	sudo cp temp/fd-v8.7.0-x86_64-unknown-linux-musl/fd /usr/local/bin/
	rm -dfr temp

neovim:
	make wget
	wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz
	mkdir -p temp
	mv nvim-linux64.tar.gz temp
	cd temp && tar -xzf nvim-linux64.tar.gz
	rsync -a temp/nvim-linux64/ /usr/local/
	rm -dfr temp

neovim10:
	make wget
	wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
	mkdir -p temp
	mv nvim-linux64.tar.gz temp
	cd temp && tar -xzf nvim-linux64.tar.gz
	rsync -a temp/nvim-linux64/ /usr/local/
	rm -dfr temp

xh:
	make wget
	wget https://raw.githubusercontent.com/ducaale/xh/master/install.sh
	mkdir -p temp
	mv install.sh temp
	chmod +x temp/install.sh
	./temp/install.sh
	rm -dfr temp

lazygit:
	make wget
	wget https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz
	mkdir -p temp
	mv lazygit_0.40.2_Linux_x86_64.tar.gz temp
	cd temp && tar -xzf lazygit_0.40.2_Linux_x86_64.tar.gz
	sudo cp temp/lazygit /usr/local/bin/
	rm -dfr temp

starship:
	make wget
	wget https://starship.rs/install.sh
	mkdir -p temp
	mv install.sh temp
	chmod +x temp/install.sh
	./temp/install.sh
	rm -dfr temp

jira:
	make wget
	wget https://github.com/ankitpokhrel/jira-cli/releases/download/v1.4.0/jira_1.4.0_linux_x86_64.tar.gz
	mkdir -p temp
	mv jira_1.4.0_linux_x86_64.tar.gz temp
	cd temp && tar -xzf jira_1.4.0_linux_x86_64.tar.gz
	sudo cp temp/jira_1.4.0_linux_x86_64/bin/jira /usr/local/bin/
	rm -dfr temp

nushell:
	make wget
	wget https://github.com/nushell/nushell/releases/download/0.84.0/nu-0.84.0-x86_64-unknown-linux-gnu.tar.gz
	mkdir -p temp
	mv nu-0.84.0-x86_64-unknown-linux-gnu.tar.gz temp
	cd temp && tar -xzf nu-0.84.0-x86_64-unknown-linux-gnu.tar.gz
	sudo cp temp/nu-0.84.0-x86_64-unknown-linux-gnu/nu /usr/local/bin/
	rm -dfr temp

gping:
	make wget
	wget https://github.com/orf/gping/releases/download/gping-v1.14.0/gping-Linux-x86_64.tar.gz 
	mkdir -p temp
	mv gping-Linux-x86_64.tar.gz temp
	cd temp && tar -xzf gping-Linux-x86_64.tar.gz
	sudo cp temp/gping /usr/local/bin/
	rm -dfr temp

bun: 
	make wget
	sudo wget https://bun.sh/install
	mkdir -p temp
	mv install temp
	sudo chmod +x temp/install
	./temp/install
	rm -dfr temp

surrealdb: 
	make wget
	sudo wget https://install.surrealdb.com
	mkdir -p temp
	mv index.html temp
	sudo chmod +x temp/index.html
	./temp/index.html
	rm -dfr temp

rust:
	make wget
	sudo wget https://sh.rustup.rs
	mkdir -p temp
	mv index.html temp
	sudo chmod +x temp/index.html
	./temp/index.html
	rm -dfr temp

libssl:
	make wget
	wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb 
	mkdir -p temp
	mv libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb temp
	sudo dpkg -i temp/libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb

lf:
	make wget
	wget https://github.com/gokcehan/lf/releases/download/r31/lf-linux-amd64.tar.gz
	mkdir -p temp
	mv lf-linux-amd64.tar.gz temp
	cd temp && tar -xzf lf-linux-amd64.tar.gz
	sudo cp temp/lf /usr/local/bin/
	rm -dfr temp

php:
	make wget
	sudo apt-get install php php-curl
	mkdir -p temp
	curl -sS https://getcomposer.org/installer -o composer-setup.php
	mv composer-setup.php temp
	cd temp && sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
	rm -dfr temp
	sudo composer self-update

tmux:
	sudo apt install tmux -y

zsh:
	sudo apt install zsh -y

cmatrix:
	sudo apt install cmatrix -y

gh: 
	sudo apt install gh -y

fzf: 
	sudo apt install fzf -y

fzy: 
	sudo apt install fzy -y

gawk: 
	sudo apt install gawk -y

ripgrep:
	sudo apt install ripgrep -y

exa:
	sudo apt install exa -y

entr:
	sudo apt install entr -y

nala:
	sudo apt install nala -y

ranger:
	sudo apt install ranger -y

wget:
	sudo apt install wget -y

node:
	sudo apt install nodejs npm -y

lftp:
	sudo apt install lftp -y

unzip:
	sudo apt install unzip -y

rsync:
	sudo apt install rsync -y

openvpn:
	sudo apt install openvpn -y

gitflow:
	sudo apt install git-flow -y

xclip:
	sudo apt install xclip

inotify-tools:
	sudo apt install inotify-tools

tokei:
	cargo install tokei

fly:
	curl -L https://fly.io/install.sh | sh

psql:
	sudo apt install postgresql-client -y

cloc:
	sudo apt install cloc

sqlc:
	make wget
	wget https://github.com/sqlc-dev/sqlc/releases/download/v1.27.0/sqlc_1.27.0_linux_amd64.tar.gz
	mkdir -p temp
	mv sqlc_1.27.0_linux_amd64.tar.gz temp
	cd temp && tar -xzf sqlc_1.27.0_linux_amd64.tar.gz
	sudo cp temp/sqlc /usr/local/bin/
	rm -dfr temp
