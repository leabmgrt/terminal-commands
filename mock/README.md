# mock

cOnVeRtS tHe PrOvIdEd TeXt InTo SoMeThInG lIkE tHiS

## Build

This is a swift package, so you need to be able to compile swift projects.

1. Clone this repo
2. `cd mock`
3. `swift build -c release`
4. Done 🎉

The executable is available under `.build/release/mock`

If you want to copy the executable into `/usr/local/bin` (to run the program without needing to navigate to the folder), run `cp .build/release/mock /usr/local/bin`

## Usage

`mock --text <text> [--copy]`

### Options:

- `-t, --text <text>`
    - Text to mock
- `-c, --copy`
    - Copy the string (currently only works on macOS)
`-h, --help`
    - Show help information.

## License

This project is part of the "terminal-commands" repo and licensed under its license.
