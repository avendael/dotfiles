import os

sysname = os.uname()[0]
is_known_system = True

if sysname == 'Linux':
    import platforms.ubuntu
elif sysname == 'Darwin':
    import platformns.macos
else:
    print('Unknown system. No packages will be installed')
    is_known_system = False

if is_known_system:
    install_dependencies()
    install_packages()