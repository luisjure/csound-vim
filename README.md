# csound-vim
### Csound tools for Vim

Set of tools for editing Csound files (`.orc`, `.sco`, `.csd`, `.udo`) with Vim: syntax recognition and highlighting, folding, macros, autocompletion, on-line reference, and templates.


### Installation
##### with a plugin manager

`csound-vim` is compatible with [pathogen] (https://github.com/tpope/vim-pathogen). If you have it installed, you can install the plugin the usual way:

    cd $HOME/.vim/bundle
    git clone git://github.com/luisjure/csound/

To update, simply run `git pull` in the `bundle/csound` directory:

    cd $HOME/.vim/bundle/csound
    git pull

You should be able install just as easily using other plugin managers, like Vundle, NeoBundle, or VimPlug.

##### manual installation

Download the plugin as a `.zip` file, and extract all the directories (`doc`, `ftdetect`, `macros`, `syntax` and `templates`) in `$HOME/.vim/` for a local installation, or in `$VIM/vimfiles` for a system installation.

After installation, run in Vim `:helptags` on the directory with the documentation to generate the local tags for Vim's online help system. In a system installation, the command must be run as `root`.

### Features
##### syntax highlighting
Highlighting of all (or most) Csound syntactic elements. List of `opcodes` updated to Csound 6.07.

##### folding
The [folding] (http://vimdoc.sourceforge.net/htmldoc/usr_28.html) function in Vim is used to fold orchestra and score sections, instruments and user defined opcodes, multiline comments, etc.

##### macros
Some function keys are mapped to macros to save the `.csd` file, compile it and listen to the results, without leaving the editor.

- ` F8` - write current `.csd` to disk, compile it without extra command line flags
- ` F9` - write current `.csd` to disk, compile it and send to audio card in realtime (`-o dac`)
- `F10` - write current `.csd` to disk, compile it and write it to file `./test.wav`, return to Vim
- `F11` - write current `.csd` to disk, compile it and write it to file `./test.wav`, stay in console (for debugging)
- `F12` - play (with the command `aplay`) last compiled file, return to Vim 

These macros were designed for GNU/Linux, they might need adjustments for other environments.

##### template
When creating a new file with the `.csd` extension, the `templates/template.csd` file will be used as a template.

##### autocompletion
A dictionary is included with all the valid `opcode` names in the language, to be used with the built-in autocompletion function in Vim.
In insert or replace mode, type a few letters and then press `Ctrl-n` or `Ctrl-p`; a menu will appear with all the possible completions.
See [`:he ins-completion`] (http://vimdoc.sourceforge.net/htmldoc/insert.html#ins-completion) for more details.

##### online help
Online documentation for most Csound elements is available through the `:he[lp]` command, or typing `K` when the cursor is on the element in normal mode. See [`:he help`] (http://vimdoc.sourceforge.net/htmldoc/helphelp.html) and [`:he K`] (http://vimdoc.sourceforge.net/htmldoc/various.html#K) for more details. 

The help file is based on an abridged version of the Csound html manual, updated to version 6.07.

##### html manual
In normal mode, the `F1` key opens in the default web browser the manual page for the opcode under the cursor.

The global variable `g:csound_manual` can be defined in `.vimrc`, pointing to a local directory with the html manual.

If this variable is not defined, the web version at `csound.github.io` will be opened.

##### example `csd`
In normal mode, the `F2` key opens in a new tab the example `csd` for the opcode under the cursor, if it exists and its name is of the form `opcode.csd`.

This only works if the global variable `g:csound_manual` is defined and points to a local copy of the html manual.

### Contributing
You can contribute to the development of this plugin by reporting bugs or missing elements, and by suggesting improvements and new functionalities. 
Patches or at least ideas of how to implement the changes are most welcome.

#### Acknowledgements
People who contributed with ideas, suggestions, patches, or simply encouragement include: Nicola Bernardini, Brett Cornwall, Jay Chernik, Dave Phillips, and Steven Yi.

### License
Copyright (c) 2001-2016 Luis Jure, The MIT License.

See the [`LICENSE`] (./LICENSE) file for more details.
