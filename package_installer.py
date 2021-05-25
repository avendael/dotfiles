import os

sysname = os.uname()[0]
is_known_system = True

if sysname == 'Darwin':
    from platforms.macos import install_dependencies, install_packages
else:
    print('Unknown system. No packages will be installed')
    is_known_system = False

if is_known_system:
    install_dependencies()
    install_packages()
