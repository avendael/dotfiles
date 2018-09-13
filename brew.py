#!/usr/bin/python
from __future__ import print_function

import os
from subprocess import call, check_output

brews = set([
    'chkrootkit',
    'clamav',
    'fasd',
    'fzf',
    'git',
    'go',
    'neovim',
    'reattach-to-user-namespace',
    'rkhunter',
    'the_silver_searcher',
    'tmux',
    'unrar',
    'zplug',
    'zsh',
])
taps = set([
    'homebrew/cask-drivers',
    'homebrew/cask-fonts',
])
casks = set([
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
pips = set([
    'tmuxp',
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
installed_taps = set(check_output(['brew', 'tap']).strip().split('\n'))
installed_casks = set(check_output(['brew', 'cask', 'list']).strip().split('\n'))
installed_pips = set([pip.split('==')[0] for pip in check_output(['pip', 'freeze']).strip().split('\n')])
brews_to_install = brews - installed_brews
taps_to_install = taps - installed_taps
casks_to_install = casks - installed_casks
pips_to_install = pips - installed_pips

if taps_to_install:
    print('Taps to install: {}'.format(', '.join(taps_to_install)))
else:
    print('No taps to install')

if brews_to_install:
    print('Brews to install: {}'.format(', '.join(brews_to_install)))
else:
    print('No brews to install')

if casks_to_install:
    print('Casks to install: {}'.format(', '.join(casks_to_install)))
else:
    print('No casks to install')

if pips_to_install:
    print('Pips to install: {}'.format(', '.join(pips_to_install)))
else:
    print('No pips to install')

for tap in taps_to_install:
    call(['brew', 'tap', tap])

for brew in brews_to_install:
    call(['brew', 'install', brew])

for cask in casks_to_install:
    call(['brew', 'cask', 'install', cask])

for pip in pips_to_install:
    call(['pip', 'install', '--user', pip])

devnull.close()
