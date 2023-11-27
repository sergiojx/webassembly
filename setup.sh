#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y git vim curl
sudo apt-get install -y build-essential
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y | su vagrant
# echo 'curl https://sh.rustup.rs -sSf | sh -s -- -y;' | su vagrant
# echo 'curl https://sh.rustup.rs -sSf | sh -s -- -y;'
source "/home/vagrant/.cargo/env"
PATH="/home/vagrant/.cargo/bin:${PATH}"
# source "/root/.cargo/env"
# PATH="/root/.cargo/bin:${PATH}"
rustup update
# echo 'curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh -s -- -y;' | su vagrant
# echo 'curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh -s -- -y;'
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh -s -- -y
# nodejs
sudo apt-get install -y nodejs 
sudo apt-get install -y npm
# emscripten
# Get the emsdk repo
git clone https://github.com/emscripten-core/emsdk.git
# Enter that directory
cd emsdk
# Fetch the latest version of the emsdk (not needed the first time you clone)
git pull
# Download and install the latest SDK tools.
./emsdk install latest
# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
./emsdk activate latest
# Activate PATH and other environment variables in the current terminal
source ./emsdk_env.sh

