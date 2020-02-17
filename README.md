# csound-vim

## Csound tools for Vim

Set of tools for editing Csound files (`.orc`, `.sco`, `.csd`, `.udo`) with Vim: syntax recognition and highlighting, folding, macros, autocompletion, on-line reference, and templates.


## Installation

#### with a plugin manager (recommended)

`csound-vim` is compatible with [pathogen](https://github.com/tpope/vim-pathogen). If you have it installed, you can install the plugin the usual way:

    cd $HOME/.vim/bundle
    git clone git://github.com/luisjure/csound-vim/

To update, simply run `git pull` in the `bundle/csound-vim` directory:

    cd $HOME/.vim/bundle/csound-vim
    git pull

You should be able install just as easily using other plugin managers, like Vundle, NeoBundle, or VimPlug.

#### manual installation

The plugin was designed to be patogen-compatible, and the recommended method of installation is the one described above.

Manual installation is possible, but might not work as well.

Download the plugin as a `.zip` file, and extract all the directories in `$HOME/.vim/` for a local installation, or in `$VIM/vimfiles` for a system installation.

After installation, run in Vim `:helptags` on the directory with the documentation to generate the local tags for Vim's online help system. In a system installation, the command must be run as `root`.

## Features

### syntax highlighting

The plugin provides highlighting of all (or most) Csound syntactic elements. 

The list of opcodes for highlighting is loaded from an external file. By default, the file **`syntax/opcodes`** will be used, containing a list of `opcodes` updated to Csound 6.14.

##### user-defined `opcodes` list

If the file **`syntax/mycsound_opcodes`** exists, it will be loaded instead of the default file.

It is recommended to generate this local file from the output of `csound -z`, to match the installed version of Csound. Two scripts are provided (Python and bash) that, in case they work, will do this automatically. They have had very limited testing and only on Linux, so try them at your own risk.


### folding

The [folding](http://vimdoc.sourceforge.net/htmldoc/usr_28.html) function in Vim is used to fold orchestra and score sections, instruments and user defined opcodes, multi-line comments, etc.

### macros

Function keys can be mapped to macros to perform operations like saving the `.csd` file, compile it and listen to the results, without leaving the editor.

The following default macros are defined in the file **`macros/csound_macros`**:

- **`F8`** - save current `.csd` to disk, compile it without extra command line flags (use options in CsOptions)
- **`F9`** - save current `.csd` to disk, compile it and output to audio card in real-time (`-o dac` flag)
- **`F10`** - write current `.csd` to disk, compile it and write it to file `./${csd_basename}.wav`, return to Vim
- **`F11`** - write current `.csd` to disk, compile it and write it to file `./${csd_basename}.wav`, stay in console (for debugging)
- **`F12`** - play (with the command `aplay`) last compiled file, return to Vim 

These macros were designed for GNU/Linux, they might need adjustments for other environments.

##### user-defined macros
User-defined macros can be put in the file **`macros/mycsound_macros`**. If this file exists, it will be loaded instead of the default file.

### template

When creating a new file with the `.csd` extension, the `templates/template.csd` file will be used as a template.

### autocompletion

A dictionary is included with all the valid `opcode` names in the language, to be used with the built-in autocompletion function in Vim.
In insert or replace mode, type a few letters and then press `Ctrl-n` or `Ctrl-p`; a menu will appear with all the possible completions.
See [`:he ins-completion`](http://vimdoc.sourceforge.net/htmldoc/insert.html#ins-completion) for more details.

### html manual

In normal mode, the **`F1`** key opens in the default web browser the manual page for the opcode under the cursor.

The global variable `g:csound_manual` can be defined in `.vimrc`, pointing to a local directory with the html manual.

    let g:csound_manual = "~/csound/manual/html/"

If this variable is not defined, the web version at `csound.github.io` will be opened, if there is a working Internet connection.

### online help

(This feature is buggy and not maintained, it is recommended to use **`F1`** feature described above.)

Online documentation for most Csound elements is available through the `:he[lp]` command, or typing **`K`** when the cursor is on the element in normal mode. See [`:he help`](http://vimdoc.sourceforge.net/htmldoc/helphelp.html) and [`:he K`](http://vimdoc.sourceforge.net/htmldoc/various.html#K) for more details. 

The help file is based on an abridged version of the Csound html manual, version 6.07.

### example `csd`

In normal mode, the **`F2`** key opens in a new tab the example `csd` for the opcode under the cursor, if it exists and its name is of the form `opcode.csd`.

This only works if the global variable `g:csound_manual` is defined and points to a local copy of the html manual.

## Contributing

You can contribute to the development of this plugin by reporting bugs or missing elements, and by suggesting improvements and new functionalities. 
Patches or at least ideas of how to implement the changes are most welcome.

### Acknowledgements

People who contributed with ideas, suggestions, patches, or simply encouragement include: Nicola Bernardini, Brett Cornwall, Jay Chernik, Dave Phillips, and Steven Yi.

## License

Copyright © 2001-2020 Luis Jure, The MIT License.

See the [`LICENSE`](./LICENSE) file for more details.
