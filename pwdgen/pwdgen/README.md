# pwdgen

Password generator for the command line, written in swift

## What does it do?

Well... it generates passwords. There are currently 4 types: pin, password, crypt and aaa

### pin

Generates a pin with digits between 0 and 9 (0 1 2 3 4 5 6 7 8 9)

#### Charset

`0123456789`

### password

Generates a password. It doesn't include all special characters, only "!@#$%&*()_-+={[]}|:;<,>.?/"

#### Charset

`abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*()_-+={[]}|:;<,>.?/`

### crypt

contains numbers, ascii letters and punctuation

#### Charset

``abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!"#$&'()*+,-./:;<=>?@[\]^_{|}~``

### aaa

ÀâÃÀÅAÃÁÃAÆÀÅÃÀãāāÁâäáÀåäaÁÃāäÆÂaÅâååàåáåâāÀAàâÁÃà

#### Charset

`aäàáâæãåāAÄÀÁÂÆÃÅĀ`

## Build

This is a swift package, so you need to be able to compile swift projects.

1. Clone this repo
2. `cd pwdgen/pwdgen`
3. `swift build -c release`
4. Done 🎉

The executable is available under `.build/release/pwdgen`

If you want to copy the executable into `/usr/local/bin` (to run the program without needing to navigate to the folder), run `cp .build/release/pwdgen /usr/local/bin`

## Usage

`pwdgen --length <length> <type> [--charset <charset>] [--copy] [--dont-show]`

### Arguments

- `<type>`
    - "pwd", "pin", "crypt" or "aaa"

### Options

- `-l, --length <length>`
    - Length of the string
- `-s, --charset <charset>`
    - Custom charset
- `-c, --copy`
    - Copy the string (currently only works on macOS)
- `-d, --dont-show`
    - Don't show the password
- `-h, --help`
    - Show help information.

## License

This project is part of the "terminal-commands" repo and licensed under its license.
