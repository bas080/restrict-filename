# restrict-filename

A command line tool for creating a restricted filename string. Spaces are
replaced with and `_` and special characters are removed.

# Usage

```bash

restrict-filename Some\ !Weird;file+name.ext
Some_Weirdfilename.ext

# If you also want to lowercase the name then use the -l flag

restrict-filename -l Some\ !Weird;file+name.ext
some_weirdfilename.ext

# We use the mv command to perform a rename
mv Some\ !Weird;file+name.ext $(restrict-filename -l Some\ !Weird;file+name.ext)

# My preference goes to using xargs command
restrict-filename Some\ \!Weird\;file+name.ext | xargs mv Some\ !Weird;file+name.ext

```

# Installation

The following installation strategy requires stack to be installed and the
`~/.local/bin/` to be in the `$PATH` variable. Please let me know if there is
a better way to install a haskell project that uses stack.

```bash
git clone https://github.com/bas080/restrict-filename
cd restrict-filename
stack install
```

You should be able to run the `restrict-filename` command from the prompt.

# Options

Type `restrict-filename --help` to see see command options

```
The restrictfilenameargs program

restrictfilenameargs [OPTIONS] [STRING]

Common flags:
  -w --whitespace        disable whitespace replacement
  -r --replacement=ITEM  change replacement character
  -s --specialcharacter  disable special characters removal
  -l --lowercase         enable lowercasing
  -? --help              Display help message
  -V --version           Print version information
```
