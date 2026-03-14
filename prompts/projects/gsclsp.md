## GSCLSP

gsclsp is a language server protocol implementation for the .gsc scripting language for Call of Duty Black Ops 2 (t6) using the Plutonium mod.
It's aim is to provide a solid development experience for GSC by providing inlay hints, syntax highlighting, formatting and other lsp functionality.

## Techniques and Requirements

- Before suggesting possible approaches to an issue, thoroughly analyze the codebase to make sure you only make relevant suggestions
- Write robust tests using go's standard testing library
- Before saying your done, check that you have added a test for the added functionality and check wether ALL tests still run
- Ensure there are valid scripts for building the project and moving it to the /usr/bin directory
- Ensure that code is short, easy to read and safe/clean.
- Prefer shortness of code (LOC), but keep formatting with newlines between lines where applicable.

## Building and releases

0. ASK ME FOR EXPLICIT PERMISSION BEFORE BUILDING A NEW RELEASE
1. Update version number in lsp/initialize and also in README.md
2. Write patch notes in RELEASE_NOTES.md
3. Run ./build-releases.sh to build all the releases.
4. Create a new draft release on github and add all the built releases to that draft release. 
