#!/usr/bin/python3
import os
from subprocess import call, check_output

packages = set([
    b'chkrootkit',
    b'exuberant-ctags',
    b'fasd',
    b'fzf',
    b'git',
    b'jq',
    b'neovim',
    b'rkhunter',
    b'telnet',
    b'silversearcher-ag',
    b'tmux',
    b'unrar',
    b'zplug',
    b'zsh'
])

def install_dependencies():
    return


def install_packages():
    installed_packages = set(
        [
            line.split(b'/')[0]
            for line in check_output(
                ['apt', 'list', '--installed']
            ).strip().split(b'\n')
            if line != b'Listing...'
        ]
    )
    packages_to_install = packages - installed_packages
    if packages_to_install:
        print('Packages to install:\n{}'.format(
            '\n'.join(
                ['  ' + str(package) for package in packages_to_install]
            ))
        )
    else:
        print('No packages to install')
    for package in packages_to_install:
        call(['apt', 'install', package, '-y'])
