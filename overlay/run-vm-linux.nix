/*
 * NixNG
 * Copyright (c) 2021  GPL Magic_RB <magic_rb@redalder.org>   
 *  
 *  This file is free software: you may copy, redistribute and/or modify it  
 *  under the terms of the GNU General Public License as published by the  
 *  Free Software Foundation, either version 3 of the License, or (at your  
 *  option) any later version.  
 *  
 *  This file is distributed in the hope that it will be useful, but  
 *  WITHOUT ANY WARRANTY; without even the implied warranty of  
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU  
 *  General Public License for more details.  
 *  
 *  You should have received a copy of the GNU General Public License  
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.  
 */

{ callPackage
, lib
, tinyLinux
}:
tinyLinux.override {
  extraConfig = {
    CONFIG_NET_9P="y";
    CONFIG_NET_9P_VIRTIO="y";
    CONFIG_NET_9P_DEBUG="y"; # perhaps?
    CONFIG_9P_FS="y";
    CONFIG_9P_FS_POSIX_ACL="y";

    CONFIG_NETWORK_FILESYSTEMS="y";
    CONFIG_INET="y";
    CONFIG_NET="y";
    CONFIG_9P="y";

    CONFIG_VIRTIO="y";

    CONFIG_PCI="y";
    CONFIG_VIRTIO_PCI="y";
    CONFIG_VIRTIO_MENU="y";
    CONFIG_PCI_HOST_GENERIC="y"; # (only needed for the QEMU Arm 'virt' board) from wikipedia

    # TTY stuff
    CONFIG_TTY="y";
    CONFIG_VT="y";
    CONFIG_VT_CONSOLE="y";
    CONFIG_UNIX98_PTYS="y"; 
    CONFIG_LEGACY_PTYS="y";
    CONFIG_LEGACY_PTY_COUNT="256";
    CONFIG_LDISC_AUTOLOAD="y";

    # Serial console, makes it work in QEMU
    CONFIG_SERIAL_8250="y";
    CONFIG_SERIAL_8250_CONSOLE="y";

    # Debug logs during boot are always handy
    CONFIG_PRINTK="y";
    
    # Initrd things, perhaps make the compression configurable?
    CONFIG_BLK_DEV_INITRD="y";
    CONFIG_RD_GZIP="y";
    CONFIG_RD_BZIP2="n";
    CONFIG_RD_LZMA="n";
    CONFIG_RD_XZ="n";
    CONFIG_RD_LZO="n";
    CONFIG_RD_LZ4="n";

    # Required for shebangs
    CONFIG_BINFMT_ELF="y"; # general execution
    CONFIG_BINFMT_SCRIPT="y"; # bash shebang

    # Required for runit
    CONFIG_FILE_LOCKING="y";

    # futex
    CONFIG_FUTEX="y";

    ## Filesystems
    # proc
    CONFIG_PROC_FS="y";
    CONFIG_PROC_SYSCTL="y";
    CONFIG_PROC_PAGE_MONITOR="n";
    # sys
    CONFIG_SYSFS="y";
    # devtmpfs
    CONFIG_DEVTMPFS="y";

    # overlayfs
    CONFIG_EXPORTFS="y";
    CONFIG_OVERLAY_FS="y";
    CONFIG_OVERLAY_FS_INDEX="y";
    CONFIG_OVERLAY_FS_METACOPY="y";

    # loop devices
    CONFIG_BLK_DEV="y";
    CONFIG_BLK_DEV_LOOP="y";
    CONFIG_BLK_DEV_LOOP_MIN_COUNT="4";

    # filesystems
    CONFIG_BLOCK="y";
    CONFIG_EXT4_FS="y";
    CONFIG_EXT4_FS_POSIX_ACL="y";

    CONFIG_VFAT_FS="y";
    CONFIG_NLS_CODEPAGE_437="y"; # why? cause "FAT-fs (loop0p1): codepage cp437 not found"
    CONFIG_NLS_ISO8859_1="y"; # same here, "FAT-fs (loop0p1): IO charset iso8859-1 not found"
    CONFIG_FAT_FS="y";
  };
}
