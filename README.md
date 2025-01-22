# homebrew-xfce

Provides formulae for Xfce components.

## Installation and usage

In order to use this tap, you need to install Homebrew.

Then, to run a default installation, run:

```bash
brew tap andreldm/xfce
```

After that you'll be able to install Xfce formulae, for example:

```bash
brew install thunar
```

You probably may need to execute dbus manually:
```bash
dbus-daemon --session --nofork --address "$DBUS_SESSION_BUS_ADDRESS"
```

And add to your `.bashrc` or `.zshrc` (or whatever shell you use rc file):
```bash
mkdir -p /tmp/dbus
export DBUS_SESSION_BUS_ADDRESS="unix:path=/tmp/dbus/$USER.session.usock,guid=d0af79a44c000ce7985797ba649dbc05"
export GTK_THEME=Greybird
```

### Reporting bugs

Do not report bugs to Xfce developers unless you are able to reproduce the issue on a Linux system.

This project highly experimental, missing features and crashes are expected.
