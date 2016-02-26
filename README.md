# csound-vim
### Csound tools for Vim

Set of tools for editing Csound files (.orc, .sco, .csd, .udo) with Vim: syntax recognition and highlighting, folding, macros, on-line reference and templates.


### Installation
##### with a plugin manager

`csound-vim` is compatible with [pathogen] (https://github.com/tpope/vim-pathogen). If you have it installed, you can install the plugin the usual way:

    cd $HOME/.vim/bundle
    git clone git://github.com/luisjure/csound/

You should be able install just as easily using other plugin managers, like Vundle, NeoBundle, or VimPlug.

##### manual installation

Download the plugin as a `.zip` file, and extract all the directories (`doc`, `ftdetect`, `macros`, `syntax` and `templates`) in `$HOME/.vim/` for a local installation, or in `$VIM/vimfiles` for a system installation.

After installation, run in Vim `:helptags` on the directory with the documentation (or just `:Helptags` if you have pathogen installed.)
