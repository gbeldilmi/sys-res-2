# Systèmes et réseaux

## Installation du routeur

### Installation de Debian

Installation de Debian en mode UEFI.

#### Localisation

- Langue : En-US
- Pays : France
- Keymap : french

#### Partitionnement

Point de montage | Taille  | Type | Description     
---------------- | ------- | ---- | ----------------
/boot/efi        | 1 GB    | ESP  | EFI System
/                | 140 GB  | ext4 | Linux Filesystem
/home            | 30 GB   | ext4 | Linux Filesystem
/var             | 10 GB   | ext4 | Linux Filesystem
/database        | 30 GB   | ext4 | Linux Filesystem
/resources       | 20 GB   | ext4 | Linux Filesystem
/public          | 20 GB   | ext4 | Linux Filesystem
swap             | 4 GB    | swap | Linux Swap

#### Utilisateurs

- root
- u

### Configuration

- Installer les paquets suivants : `git`
- Cloner ce dépot
- Lancer le script d'installation et de configuration : [server/setup.sh](server/setup.sh)

## Configuration du client

- Installer les paquets suivants : `git`
- Cloner ce dépot
- Lancer le script d'installation et de configuration : [client/setup.sh](client/setup.sh)
