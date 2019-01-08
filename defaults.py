#!/usr/bin/python
from __future__ import print_function

from subprocess import call

defaults = {
    'com.microsoft.VSCode': {
        'name': 'ApplePressAndHoldEnabled',
        'opts': ['-bool'],
        'args': ['false']
    }
}


def write_defaults(defaults):
    for key, value in defaults.items():
        name = value['name']
        opts = value['opts']
        args = value['args']
        print(
            'Writing default {} {}: options "{}", args "{}'.format(key, name, opts, args)
        )
        call(['defaults', 'write', key, name] + opts + args)

write_defaults(defaults)
