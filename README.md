# Minimal Kotlin and Nix Flake Example (with Gradle 8 support)

This work is based on the following sources:

* https://github.com/tmcl/minimal-android-nix-example
* https://gist.github.com/tadfisher/17000caf8653019a9a98fd9b9b921d93

The difference is that it isn't an Android project, and that it supports Gradle 8. Furthermore, it's a Nix flake.

## Development

If you use direnv, you can enter the dev shell easily:

```bash
direnv allow
```

Otherwise, use `nix develop`.

From here, you can use regular Gradle commands when working on your project, or launch whatever editor/IDE you're using. The kotlin-language-server is included in the shell.

If you modify dependencies, run:

```bash
update-locks
```

## Build

To build with Nix, run:

```bash
nix build
```

You'll now have the built distribution in `./result`:

```bash
ls result
minimal-kotlin-nix-example-1.0-SNAPSHOT.tar  minimal-kotlin-nix-example-1.0-SNAPSHOT.zip
```

## License

The original work is unlicensed, unfortunately. My changes are licensed under the MIT License:

Copyright 2024 Oskar Wickström

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
