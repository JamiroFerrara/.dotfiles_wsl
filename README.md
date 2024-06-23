# Jamiro Ferrara Txt Novigo - Dotfiles
This repository is my specific configuration for work using better tools for the
CHADS.

To syncronize all dotfiles just run the command:

```bash
make
```

This will automatically create symlinks in the expected directories and will
handle all of the dotfile configurations.

To install all of the programs needed just run: 

```bash
make install
```

or you can install each program on its own simply by executing make and the
program name (Makefile as reference)

This will proceed to install tools like -> 
	wget -> http downloader
	gum -> CLI prompt helper
	tmux -> Terminal multiplexer
	zsh -> A nicer shell
	neovim -> Chad editor
	nano -> DELETED HAHAHAHAH
	cmatrix -> Matrix simulator
	lazygit -> Chad git helper
	starship -> Customize the terminal prompt
	gh -> Github cli 
	xh -> CURL but better
	fzf -> Fuzzy finder 
	fzy -> Fuzzy finder
	exa -> Better ls 
	ripgrep -> The quickest grep
	fd -> Awesome file finder
	gawk -> awk
	nala -> better apt
	entr -> Execute arbitry commands on file changes
	ranger -> File browser
	nushell -> A shell for the 21 century (kinda like powershell)
	gping -> Ping but with a GUI
	node -> Nodejs
	bun -> Blazing fast NodeJs
	lftp -> FTP client
	rust -> A language for the fierce
	dotnet -> Dotnet SDK 2.1 + 7.0
	libssl + dog -> Better dig
	
## Keybinds

### Tmux
<leader> -> <C-a>
<A-s> -> Split Vertically
<A-S> -> Split Horizontally
<leader>- -> Split Horizontally
<leader>p -> Search z history and open neovim
<leader>o -> Search z history and open shell
<leader>y -> Postman script (requires script directory in CWD)
<leader>l -> Switch session left
<leader>h -> Switch session right
<leader>k -> Switch session up
<leader>j -> Switch session down
<leader>g -> Lazygit

### Neovim
Astro nvim default keybinds +
<A-s> -> Split Vertically
<A-S> -> Split Horizontally
<C-p> -> Search Files
<C-h> -> Switch pane left
<C-l> -> Switch pane right
<C-k> -> Switch pane up
<C-j> -> Switch pane down
<leader>e -> Open file explorer
<leader>fw -> Grep search
<leader>hg -> Git helpers
