#!/usr/bin/env bash

cd $HOME

echo "Configuring Git user information"
git config --global user.name 'Tim Miller'
git config --global user.email 'broadcaststorm@users.noreply.github.com'

echo "Installing rbenv Git repo"
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
source $HOME/.bashrc

echo "Installing ruby-build plugin"
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> $HOME/.bashrc
source $HOME/.bashrc

echo "Installing Ruby 2.7.3"
rbenv install 2.7.3
rbenv global 2.7.3

echo "Installing bundler"
gem install bundler
rbenv rehash
