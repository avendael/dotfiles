#!/usr/bin/python
from __future__ import print_function

import os
from subprocess import call

defaults = {
    'com.microsoft.VSCode': {
        'name': 'ApplePressAndHoldEnabled',
        'opts': ['-bool'],
        'args': ['false']
    }
}


def write_defaults(defaults):
    if os.uname()[0] != 'Darwin':
        return

    for key, value in defaults.items():
        name = value['name']
        opts = value['opts']
        args = value['args']
        print(
            'Writing default {} {}: options "{}", args "{}'.format(key, name, opts, args)
        )
        call(['defaults', 'write', key, name] + opts + args)

write_defaults(defaults)
