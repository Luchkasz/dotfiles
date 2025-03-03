export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
source $ZSH/oh-my-zsh.sh

### Aliases ###

alias update='sudo pacman -Syuu --noconfirm && yay -Syyu --noconfirm && flatpak update -y && sudo sed -i '/^GenericName/d' /usr/share/applications/*.desktop'

alias clean='yay -Yc && sudo pacman -Sc && sudo pacman -Scc'

alias wboomee='
  bspc monitor -d I II III IV V VI VII;
  bspc desktop -f III;
  code -n /home/luchkasz/Dev/Workspaces/boomee-web.code-workspace;
  code -n /home/luchkasz/Dev/Workspaces/boomee-server.code-workspace;
'
alias whelpusz='
  bspc monitor -d I II III IV V VI VII;
  bspc desktop -f III;
  code -n /home/luchkasz/Dev/Workspaces/helpusz-mobile.code-workspace;
  code -n /home/luchkasz/Dev/Workspaces/helpusz-back.code-workspace;
'

export TERMINAL=kitty

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
#
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

PATH=~/.console-ninja/.bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### AutoStart ###
fastfetch
