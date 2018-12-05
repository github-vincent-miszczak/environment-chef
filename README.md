This repository contains sources for building Chefdk images.

It builds 2 images:

- `environment-chefdk-ci` that can be used by a CI system
- `environment-chefdk-desktop` that can be used by a user on his desktop

# Images

## environment-chefdk-ci

`chef`, `knife`, `rspec`, `kitchen`, `rubocop`, `berks`

## environment-chefdk-desktop

Inherits from `environment-chef-ci`.  
`vagrant`, `virtualbox`

# Usage

You can switch the version you want to use by setting `CHEFDK_VERSION` env variable.

- 3.5.13  
  => Chef 14

- 1.3.40  
  => Chef 12

- 0.15.16  
  => Chef 11

## CI

An easy way to use the CI container is to source `hooks.bash`.  
Those hooks delegate calls to classic Chef commands to the environment container.

## Desktop

You can source `hooks.zsh` or `hooks.bash` depending on your shell to delegate calls to `chef`, `knife` and `rubocop` to a container.

To use `kitchen` with `Vagrant` and `Virtualbox`, you can use `environment-chef-desktop` command. It will open a shell in a container. From there you can use `kichen` as usual.  
Note : delegating command from desktop is possible but the VM will be stopped after each invocation, so better get in the container first.
