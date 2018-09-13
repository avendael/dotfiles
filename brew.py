#!/usr/bin/python
from __future__ import print_function

import os
from collections import OrderedSet
from subprocess import call, check_output

brews = OrderedSet([
    'chkrootkit',
    'clamav',
    'fasd',
    'fzf',
    'git',
    'go',
    'nvim',
    'reattach-to-user-namespace',
    'rkhunter',
    'the_silver_searcher',
    'tmux',
    'unrar',
    'zplug',
    'zsh',
])
casks = OrderedSet([
    'alfred',
    'anki',
    'authy',
    'bartender',
    'discord',
    'docker',
    'dropbox',
    'google-backup-and-sync',
    'google-chrome',
    'gpg-suite',
    'imageoptim',
    'iterm2',
    'java',
    'jetbrains-toolbox',
    'keepingyouawake',
    'keybase',
    'kindle',
    'licecap',
    'little-snitch',
    'logitech-options',
    'miniconda',
    'notion',
    'slack',
    'skype',
    'steam',
    'telegram',
    'transmission',
    'viscosity',
    'visual-studio-code',
    'vlc',
])
# Disk usage goes up to 40GB from a fresh install just from the apps themselves
devnull = open(os.devnull, 'w')
has_brew = call('brew help', shell=True, stdout=devnull) == 0

if not has_brew:
    print('Installing homebrew...')
    os.system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
else:
    print('Homebrew found. Ready to brew!')

installed_brews = set(check_output(['brew', 'list']).strip().split('\n'))
installed_casks = set(check_output(['brew', 'cask', 'list']).strip().split('\n'))
brews_to_install = brews - installed_brews
casks_to_install = casks - installed_casks

if brews_to_install:
    print('Brews to install: {}'.format(', '.join(brews_to_install)))
else:
    print('No brews to install')

if casks_to_install:
    print('Casks to install: {}'.format(', '.join(casks_to_install)))
else:
    print('No casks to install')

for brew in brews_to_install:
    call(['brew', 'install', brew])

for cask in casks_to_install:
    call(['brew', 'cask', 'install', cask])

devnull.close()
