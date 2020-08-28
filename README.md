# README

This is my personal [archiso](https://wiki.archlinux.org/index.php/Archiso) modification. It includes the following pre-configured items:

-   `pacman` packages
-   `pacman` configuration
-   `hostname`
-   `display-manager` set to `lightdm`
-   `ssh` enabled by default
-   [dotfiles](https://github.com/benmezger/dotfiles)

This image installs all required dependencies and applies my dotfiles configuration to my home user.

## User and groups
The default user is `seds` and the default password is `root`. Make sure this is changed after the installation.

## Building the iso
1.  Clone the repository
``` shell
git clone https://github.com/benmezger/archiso.git
```

2. Create the arch iso
``` shell
sudo mkarchiso -v -w archiso-out -o out ./archiso
```

This will create an `archiso-dir` with working directory and store the iso in the `out` directory.

**Warning**: If `mkarchiso` is interrupted, run `findmnt(8)` to make sure there are no mount binds before deleting it - otherwise, you may lose data (e.g. an external device mounted at `/run/media/user/label` gets bound within `work/x86_64/airootfs/run/media/user/label` during the build process).

## Testing with Qemu
``` shell
run_archiso -i ./out/archlinux-yyyy.mm.dd-x86_64.iso
```


## Customizing

Customizing the build is easy, modify [`customize_airootfs.sh`](./airootfs/root/customize_airootfs.sh) with your personal preferences, but keep in mind that it automatically created a user `seds` with some predefined groups and passwords, so make sure you change the following files in case you want a different user:

- [`passwd`](./airootfs/etc/passwd)
- [`gshadow`](./airootfs/etc/gshadow)
- [`shadow`](./airootfs/etc/shadow)
- [`group`](./airootfs/etc/group)
