# Resizing VM Hard Disk

This should work for VMs from AWS and GCP

1. Check list of hard disk/volumes attached to the machine. e.g

```bash
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda       8:0    0   200G  0 disk 
├─sda1    8:1    0 199.9G  0 part /
├─sda14   8:14   0     4M  0 part 
└─sda15   8:15   0   106M  0 part /boot/efi
```
Usually, the main hard disk is `sda1` and mounted to `/`.


2. Resize the machine hard disk from AWS or GCP console. This won't automatically change the hard disk size in the machine _yet_. We have to extend the filesystem.
3. SSH into the machine.

4. Run `sudo growpart /dev/sdb 1` to extend the partition.
5. Run `sudo resize2fs /dev/sdb1` to resize the filesystem.
6. Run `lsblk` to verfiy the new volume.
7. This **does not require** to restart the machine.
