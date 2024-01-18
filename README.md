# csound-vim

## Csound tools for Vim

**`csound-vim`** is a plugin that turns the powerful text editor [Vim](https://www.vim.org/) into a simple but productive
Csound development environment.

It provides several functionalities for editing Csound files (`.orc`, `.sco`, `.csd`, `.udo`), like syntax recognition and
highlighting, folding, autocompletion, on-line reference and templates, as well as macros for compiling the .csd file and listening to the results, without leaving the editor.

**`csound-vim`** can be combined with Steven Yi's [csound-repl](https://github.com/kunstmusik/csound-repl) for live coding.


## Installation

`csound-vim` follows the standard Vim plugin structure, and can be installed like any other plugin.

### where to install it

`csound-vim` should be installed in your usual plugin directory.

When using **Vim's native package management** (added in Vim 8), the path of Vim's local plugin directory is of the form:

    $HOME/.vim/pack/foo/start/

where `foo` is you whatever arbitrary name you chose. 

If you are using a **plugin manager** like [pathogen](https://github.com/tpope/vim-pathogen), your plugins should be located under:
 
    $HOME/.vim/bundle/

This should also work with other compatible plugin managers, like [Vundle](https://github.com/VundleVim/Vundle.vim), [NeoBundle](https://github.com/Shougo/neobundle.vim), or [vim-plug](https://github.com/junegunn/vim-plug).

### how to install it

In your Vim plugin directory you can either download and unpack the latest [release](https://github.com/luisjure/csound-vim/releases), or clone the `git` repository:

    git clone git://github.com/luisjure/csound-vim/

In this case, you can update the plugin simply running `git pull` in the `csound-vim` plugin directory.

### system-wide installation

Although it is generally recommended to install Vim plugins locally under users' homes, the plugin can also be installed system-wide following the methods described above, substituting `$HOME/.vim/` with `$VIM/vimfiles/`.

### Installation with a package manager

`vim-csound` has been packaged for some Linux distributions, and can be installed using the respective package managers:

- [Arch Linux](https://archlinux.org/packages/community/any/vim-csound/): `pacman -S vim-csound`
- [Gentoo](https://packages.gentoo.org/packages/app-vim/csound-syntax): `emerge app-vim/csound-syntax`


## Features

### syntax highlighting

The plugin provides highlighting of all (or most) Csound syntactic elements. 

The list of opcodes for highlighting is loaded from an external file. By default, the file **`syntax/opcodes`** will be used, containing a list of `opcodes` updated to Csound 6.14.

#### user-defined `opcodes` list

If the file **`syntax/mycsound_opcodes`** exists, it will be loaded instead of the default file.

It is recommended to generate this local file from the output of `csound -z`, to match the installed version of Csound. Two scripts are provided (Python and bash) that, in case they work, will do this automatically. They have had very limited testing and only on Linux, so try them at your own risk.

Running any of these two scripts, should generate the file `mycsound_opcodes` under `syntax/`:

    bash opcodelistfromcsound-z.sh

    python opcodelistfromcsound-z.py
   

### folding

The [folding](http://vimdoc.sourceforge.net/htmldoc/usr_28.html) function in Vim is used to fold orchestra and score sections, instruments and user defined opcodes, multi-line comments, etc.

By default, the folding method is set to `syntax` by the plugin. It has been reported that, on some systems, folding might impact the performance negatively for large files with many folds. If that is the case, syntax folding can be disabled by including this line in `.vimrc`:

    autocmd Syntax csound setlocal foldmethod=manual

To keep syntax folding, but having the folds open by default when creating or opening a file, this line should be included instead:

    autocmd Syntax csound normal zR

### macros

Function keys can be mapped to macros to perform operations like saving the `.csd` file, compile it and listen to the results, without leaving the editor.

The following default macros are defined in the file **`macros/csound_macros`**:

- **`F8`** - save current `.csd` to disk, compile it without extra command line flags (use options in CsOptions)
- **`F9`** - save current `.csd` to disk, compile it and output to audio card in real-time (`-o dac` flag)
- **`F10`** - write current `.csd` to disk, compile it and write it to file `./${csd_basename}.wav`, return to Vim
- **`F11`** - write current `.csd` to disk, compile it and write it to file `./${csd_basename}.wav`, stay in console (for debugging)
- **`F12`** - play (with the command `aplay`) last compiled file, return to Vim 

These macros were designed for GNU/Linux, they might need adjustments for other environments.

#### user-defined macros

User-defined macros can be put in the file **`macros/mycsound_macros`**. If this file exists, it will be loaded instead of the default file.

### template

When creating a new file with the `.csd` extension, the file `templates/template.csd` will be used as a template.

### autocompletion

A dictionary is included with all the valid `opcode` names in the language, to be used with the built-in autocompletion function in Vim.
In insert or replace mode, type a few letters and then press `Ctrl-n` or `Ctrl-p`; a menu will appear with all the possible completions.
See [`:he ins-completion`](http://vimdoc.sourceforge.net/htmldoc/insert.html#ins-completion) for more details.

### html manual

In normal mode, the **`F1`** key opens in the default web browser the manual page for the opcode under the cursor.

The global variable `g:csound_manual` can be defined in `.vimrc`, pointing to a local directory with the html manual:

    let g:csound_manual = "/path_to_manual/html/"

If this variable is not defined, the web version at [csound.github.io](https://csound.com/docs/manual/index.html) will be opened, if there is a working Internet connection.

### online help

(This feature is buggy and not maintained, it is recommended to use the html manual with **`F1`**, as described above.)

Online documentation for most Csound elements is available through the `:he[lp]` command, or typing **`K`** when the cursor is on the element in normal mode. See [`:he help`](http://vimdoc.sourceforge.net/htmldoc/helphelp.html) and [`:he K`](http://vimdoc.sourceforge.net/htmldoc/various.html#K) for more details. 

The help file is based on an abridged version of the Csound html manual, version 6.07.

### example `csd`

In normal mode, the **`F2`** key opens in a new tab the example `csd` for the opcode under the cursor, if it exists and its name is of the form `opcode.csd`.

This only works if the global variable `g:csound_manual` is defined and points to a local copy of the html manual.

### disable manual key bindings

If you want to disable the **`F1`** and **`F2`** key bindings you can do so by setting the
`g:csound_enable_manual_keys` variable to `0` in your Vim configuration file.

	let g:csound_enable_manual_keys = 0

## Contributing

You can contribute to the development of this plugin by reporting bugs or missing elements, and by suggesting improvements and new functionalities. 
Patches or at least ideas of how to implement the changes are most welcome.

### Acknowledgements

People who contributed with ideas, suggestions, patches, or simply encouragement include: Nicola Bernardini, Brett Cornwall, Jay Chernik, Pete Goodeve, Dave Phillips, and Steven Yi.

## License

Copyright © 2001-2020 Luis Jure, The MIT License.

See the [`LICENSE`](./LICENSE) file for more details.
