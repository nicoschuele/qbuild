# Qbuild

[![Gem Version](https://badge.fury.io/rb/qbuild.svg)](https://badge.fury.io/rb/qbuild)

Qbuild is an easy build system (*bordering on naive, some could say*) for minifying JavaScript, transpiling [SCSS](http://sass-lang.com) into CSS, and minifying CSS into one stylesheet.  

## Installation

Qbuild is a Ruby gem. Make sure you have a recent version of Ruby installed (>=2.2.2) and simply issue the following command in your terminal:

`gem install qbuild`

**Note**: Qbuild has not been tested on Windows. It would likely not work.

## Usage

`cd` into the root of your web or [Electron](http://electron.atom.io) project. Create a default Qbuild config file with:

`qbuild --init` (or `qbuild -i`)

You can review the current options with `qbuild --options` (or `qbuild -o`). If you want to change some parameters, edit `.qbuild.json` located in the root of your project.

To build your project, use `qbuild run`

You will notice `pre_build` and `post_build` keys in the config file. They are arrays you can use to issue any command you wish to run before and after build.

**Note**: Make sure you add your `.css` and `.scss` files in the `stylesheet_filenames` array in the correct order they should be built.

**Note**: I'm currently writing a (really simple, really naive) tutorial on Qbuild.

## Contribute

Before submitting a pull request, please [get in touch](https://twitter.com/nicoschuele) first.

## Credits

Qbuild uses [Uglifier](https://github.com/lautis/uglifier) and [Sass](https://github.com/sass/sass) to work its magic.

## License

Copyright 2016 - Nico Schuele

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
