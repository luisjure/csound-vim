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

After installation, run in Vim `:helptags` on the directory with the documentation (or just `:Helptags` if pathogen is installed) to generate the local tags for Vim's online help system. In a system installation, the command must be run as `root`.

### Features
##### syntax highlighting
Highlighting of all (or most) Csound syntactic elements. List of `opcodes` updated to Csound 6.07.

##### folding
The [folding] (http://vimdoc.sourceforge.net/htmldoc/usr_28.html) function in Vim is used to fold orchestra and score sections, instruments and user defined opcodes, multiline comments, etc.


##### macros
Some function keys are mapped to macros to save the `.csd` file, compile it and listen to the results, without leaving the editor.

- `F8 ` - write current .csd to disk, compile it without extra command line flags
- `F9 ` - write current .csd to disk, compile it and send to audio card in realtime (`-o dac`)
- `F10` - write current .csd to disk, compile it and write it to file ./test.wav, return to Vim
- `F11` - write current .csd to disk, compile it and write it to file ./test.wav, stay in console (for debugging)
- `F12` - play (with the command `aplay`) last compiled file, return to Vim 

These macros were designed for GNU/Linux, they might need adjustments for other environments.

##### online help
Online documentation for most Csound elements is available through the `:he[lp]` command, or typing `K` when the cursor is on the element in normal mode.

##### template
When creating a new file with the `.csd` extension, the `templates/template.csd` file will be used as a template.
