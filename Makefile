FLYCTL_INSTALL := $(shell echo $$HOME)

init:
	mkdir -p ${HOME}/.config
	mkdir -p ${HOME}/.config/lazygit
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
	sudo ln -vsf ${PWD}/lazygit/config.yml ${HOME}/.config/lazygit/config.yml

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
	wget https://github.com/ankitpokhrel/jira-cli/releases/download/v1.6.0/jira_1.6.0_linux_x86_64.tar.gz
	mkdir -p temp
	mv jira_1.6.0_linux_x86_64.tar.gz temp
	cd temp && tar -xzf jira_1.6.0_linux_x86_64.tar.gz
	sudo cp temp/jira_1.6.0_linux_x86_64/bin/jira /usr/local/bin/
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

posting:
	curl -LsSf https://astral.sh/uv/install.sh | sh
	uv tool install --python 3.12 posting

atac:
	make wget
	wget https://github.com/Julien-cpsn/ATAC/releases/download/v0.18.1/atac-v0.18.1-x86_64-unknown-linux-gnu.tar.gz
	mkdir -p temp
	mv atac-v0.18.1-x86_64-unknown-linux-gnu.tar.gz temp
	cd temp && tar -xzf atac-v0.18.1-x86_64-unknown-linux-gnu.tar.gz
	sudo cp temp/atac /usr/local/bin/
	rm -dfr temp

odin:
	make wget
	wget https://github.com/odin-lang/Odin/releases/download/dev-2025-02/odin-linux-amd64-dev-2025-02.zip
	mkdir -p temp
	mv odin-linux-amd64-dev-2025-02.zip temp
	cd temp && unzip odin-linux-amd64-dev-2025-02.zip
	mv temp/odin-linux-amd64-dev-2025-02 temp/odin
	sudo cp -r temp/odin /usr/local/lib/
	ln -vsf /usr/local/lib/odin/odin /usr/local/bin/
	sudo apt install llvm clang
	rm -dfr temp

java:
	sudo apt install default-jdk

java-jdk-18:
	make wget
	sudo apt install libc6-x32
	wget https://download.oracle.com/java/18/archive/jdk-18.0.2.1_linux-x64_bin.deb
	mkdir -p temp
	mv jdk-18.0.2.1_linux-x64_bin.deb temp
	cd temp && sudo dpkg -i jdk-18.0.2.1_linux-x64_bin.deb
	sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-18/bin/jar 1712
	sudo update-alternatives --install /usr/bin/jarsigner jarsigner /usr/lib/jvm/jdk-18/bin/jarsigner 1712
	sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-18/bin/java 1712
	sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-18/bin/javac 1712
	sudo update-alternatives --install /usr/bin/javadoc javadoc /usr/lib/jvm/jdk-18/bin/javadoc 1712
	sudo update-alternatives --install /usr/bin/javap javap /usr/lib/jvm/jdk-18/bin/javap 1712
	sudo update-alternatives --install /usr/bin/jcmd jcmd /usr/lib/jvm/jdk-18/bin/jcmd 1712
	sudo update-alternatives --install /usr/bin/jconsole jconsole /usr/lib/jvm/jdk-18/bin/jconsole 1712
	sudo update-alternatives --install /usr/bin/jdb jdb /usr/lib/jvm/jdk-18/bin/jdb 1712
	sudo update-alternatives --install /usr/bin/jdeprscan jdeprscan /usr/lib/jvm/jdk-18/bin/jdeprscan 1712
	sudo update-alternatives --install /usr/bin/jdeps jdeps /usr/lib/jvm/jdk-18/bin/jdeps 1712
	sudo update-alternatives --install /usr/bin/jfr jfr /usr/lib/jvm/jdk-18/bin/jfr 1712
	sudo update-alternatives --install /usr/bin/jhsdb jhsdb /usr/lib/jvm/jdk-18/bin/jhsdb 1712
	sudo update-alternatives --install /usr/bin/jimage jimage /usr/lib/jvm/jdk-18/bin/jimage 1712
	sudo update-alternatives --install /usr/bin/jinfo jinfo /usr/lib/jvm/jdk-18/bin/jinfo 1712
	sudo update-alternatives --install /usr/bin/jlink jlink /usr/lib/jvm/jdk-18/bin/jlink 1712
	sudo update-alternatives --install /usr/bin/jmap jmap /usr/lib/jvm/jdk-18/bin/jmap 1712
	sudo update-alternatives --install /usr/bin/jmod jmod /usr/lib/jvm/jdk-18/bin/jmod 1712
	sudo update-alternatives --install /usr/bin/jpackage jpackage /usr/lib/jvm/jdk-18/bin/jpackage 1712
	sudo update-alternatives --install /usr/bin/jps jps /usr/lib/jvm/jdk-18/bin/jps 1712
	sudo update-alternatives --install /usr/bin/jrunscript jrunscript /usr/lib/jvm/jdk-18/bin/jrunscript 1712
	sudo update-alternatives --install /usr/bin/jshell jshell /usr/lib/jvm/jdk-18/bin/jshell 1712
	sudo update-alternatives --install /usr/bin/jstack jstack /usr/lib/jvm/jdk-18/bin/jstack 1712
	sudo update-alternatives --install /usr/bin/jstat jstat /usr/lib/jvm/jdk-18/bin/jstat 1712
	sudo update-alternatives --install /usr/bin/jstatd jstatd /usr/lib/jvm/jdk-18/bin/jstatd 1712
	sudo update-alternatives --install /usr/bin/jwebserver jwebserver /usr/lib/jvm/jdk-18/bin/jwebserver 1712
	sudo update-alternatives --install /usr/bin/keytool keytool /usr/lib/jvm/jdk-18/bin/keytool 1712
	sudo update-alternatives --install /usr/bin/rmiregistry rmiregistry /usr/lib/jvm/jdk-18/bin/rmiregistry 1712
	sudo update-alternatives --install /usr/bin/serialver serialver /usr/lib/jvm/jdk-18/bin/serialver 1712
	rm -dfr temp

java-spring:
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk install springboot

# broken
java-oracle-sqlplus:
	make wget
	wget https://download.oracle.com/otn_software/linux/instantclient/2370000/oracle-instantclient-basic-23.7.0.25.01-1.el9.x86_64.rpm
	wget https://download.oracle.com/otn_software/linux/instantclient/2370000/oracle-instantclient-sqlplus-23.7.0.25.01-1.el9.x86_64.rpm
	wget https://download.oracle.com/otn_software/linux/instantclient/2370000/oracle-instantclient-devel-23.7.0.25.01-1.el9.x86_64.rpm
	mkdir -p temp
	mv oracle-instantclient-basic-23.7.0.25.01-1.el9.x86_64.rpm temp
	mv oracle-instantclient-sqlplus-23.7.0.25.01-1.el9.x86_64.rpm temp
	mv oracle-instantclient-devel-23.7.0.25.01-1.el9.x86_64.rpm temp
	sudo apt-get install alien
	cd temp && sudo alien -i oracle-instantclient-basic-23.7.0.25.01-1.el9.x86_64.rpm
	cd temp && sudo alien -i oracle-instantclient-sqlplus-23.7.0.25.01-1.el9.x86_64.rpm
	cd temp && sudo alien -i oracle-instantclient-devel-23.7.0.25.01-1.el9.x86_64.rpm
	sudo touch /etc/ld.so.conf.d/oracle.conf
	sudo sh -c 'echo "/usr/lib/oracle/23/client64/lib/" > /etc/ld.so.conf.d/oracle.conf'
	sudo ldconfig
	rm -dfr temp

java-maven:
	make wget
	wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
	mkdir -p temp
	mv apache-maven-3.9.9-bin.tar.gz temp
	cd temp && tar -xzf apache-maven-3.9.9-bin.tar.gz
	sudo cp -r temp/apache-maven-3.9.9 /usr/local/lib/
	ln -vsf /usr/local/lib/apache-maven-3.9.9/bin/mvn /usr/local/bin/
	rm -dfr temp

bunster:
	curl -f https://bunster.netlify.app/install.sh | bash

zenity:
	sudo apt-get install zenity

himalaya:
	cargo install himalaya

sqlpackage:
	dotnet tool install -g microsoft.sqlpackage --version 162.3.563

keychain:
	sudo apt install keychain

ffmpeg:
	sudo apt-get install ffmpeg

audiowaveform:
	sudo apt update
	sudo apt install software-properties-common python3-launchpadlib
	sudo add-apt-repository ppa:chris-needham/ppa
	sudo apt-get update
	sudo apt-get install audiowaveform

7z:
	sudo apt install p7zip-full

rundeck:
	make wget
	make rsync
	wget https://github.com/rundeck/rundeck-cli/releases/download/v2.0.9/rd-2.0.9.zip
	mkdir -p temp
	mv rd-2.0.9.zip temp
	cd temp && unzip rd-2.0.9.zip
	mv temp/rd-2.0.9/bin/rd /usr/local/bin/
	rsync -a temp/rd-2.0.9/lib/ /usr/local/lib
	rm -dfr temp

opencode:
	curl -fsSL https://raw.githubusercontent.com/opencode-ai/opencode/refs/heads/main/install | bash

nvr:
	pip3 install -U neovim-remote

jtbl:
	make wget
	wget https://github.com/kellyjonbrazil/jtbl/releases/download/v1.6.0/jtbl-1.6.0-linux-x86_64.tar.gz
	mkdir -p temp
	mv jtbl-1.6.0-linux-x86_64.tar.gz temp
	cd temp && tar -xzf jtbl-1.6.0-linux-x86_64.tar.gz
	mv temp/jtbl /usr/local/bin
	rm -dfr temp
