#!/usr/bin/env bash
rm qbuild-0.1.3.gem
gem uninstall qbuild

gem build qbuild.gemspec
gem install qbuild-0.1.3.gem
