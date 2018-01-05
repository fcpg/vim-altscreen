Vim-altscreen
==============
Altscreen automatically toggles alternate screen features on you terminal.

No more `:!` output in the wrong place!

If you are using Vim in a terminal, you have probably noticed that the output
of external commmands doesn't go in the same "virtual screen" as Vim; Eg. if
you type `:!ls`, it looks as though you pressed `<C-z>`, ran `ls` in the
shell, then resumed Vim once you pressed a key. And when you quit Vim, you
can see the output of all external commands you ran in Vim, which is 
generally not what you want.

This plugin ensures that the output of external commands run in Vim stays in
Vim's "virtual screen", and doesn't pollute your main "shell screen".

[![asciicast](https://asciinema.org/a/R7Dno07kILcTaOY704dFjnlDz.png)](https://asciinema.org/a/R7Dno07kILcTaOY704dFjnlDz)

Installation
-------------
Use your favorite method:
*  [Pathogen][1] - git clone https://github.com/fcpg/vim-altscreen ~/.vim/bundle/vim-altscreen
*  [NeoBundle][2] - NeoBundle 'fcpg/vim-altscreen'
*  [Vundle][3] - Plugin 'fcpg/vim-altscreen'
*  [Plug][4] - Plug 'fcpg/vim-altscreen'
*  manual - copy all of the files into your ~/.vim directory

Help
-----
Run :helptags (or :Helptags with Pathogen), then :help altscreen

Pluginophobia
--------------

If you don't like plugins, feel free to steal the code into your vimrc.

License
--------
[Attribution-ShareAlike 4.0 Int.](https://creativecommons.org/licenses/by-sa/4.0/)

[1]: https://github.com/tpope/vim-pathogen
[2]: https://github.com/Shougo/neobundle.vim
[3]: https://github.com/gmarik/vundle
[4]: https://github.com/junegunn/vim-plug
