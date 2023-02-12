#!/usr/bin/env bash

# A shell is a command interpreter that exposes to the user an interface to work with the underlying operating system.
# Marking anything in terminal window with mouse and then clicking middle button will paste.

# System information

lsb_release -a # shows information about your distribution.
uname -r # to check the kernel info.
whoami # checking the user.
hostname # checking the host you are logged in.


# Tree Navigation

. # means current directory.
.. # means parent directory.
../.. # backwarding directories.
* #to mark all the files or directories.
pwd
cd
~
cd /
cd ..
ls
ls -lahi # "-i" stands for inode, which is metadata about the data.


# File/Directory Manipulation

touch
mv
cp
cp -r
rm
rm -r
mkdir
rmdir
ln </file_location> <link_location> # Hard links are only available for files not directories and doesn't support over "not identical" storage device. It creates a copy of the file.
ln -s </file/dir_location> <link_location> # creating symbolic links for files or directory. Use absolute paths to create links to avoid broken links. Can be moved symlinks to any storage device.


# Reading/Editing Files

cat
nano
vim
less
more
tail -f <file_name> # reads file with any current update with in the file.

# The find command

  find . # finds all of the files and folders of current directory.
  find . -type df -(i)name 'directory name | filename* | *.ext' # reads all the directories and files, specific with name or extension name, (i) is for case insensitive option.
  find . -type f -mmin +1 -mmin -5 # find files that modified more than 1 minute ago and less the 5 minute.
  find . -type f -mtime -7 # refers files that are modified by in day.
  find . -size +5MGk # returns size of the files.
  find . -empty # to check what files are empty.


# Users and Groups

sudo # suer users do, sudoers permission.
sudo -s # to become root. "-s" stands for set.
sudo su # god mode, switching users without loging out from current session.
useradd -m <user_name> # to add a new user and creating home directory. It also creates a new group for the user.
passwd <user> # to give the user a password.
usermod -s /bin/bash <user> # giving the user permission in bash.
su <user_name> # to switch user.
passwd <user> # to change user password from the root account.
passwd # to change current user password.
passwd -l <user> # locking a user from login.
passwd -u <user> # unlocking the user to set free.
userdel <username> # to delete an user.
groupadd <group_name> # adding a new group.
groudel <group_name> # deleting a group.
usermod -a -G <group_name> # adding existing user to a new group "-a" for append, "-G" for secondary group name.

# Checking the system users groups and credentials status.
  
  cat /etc/sudoers # checking sudoers.
  visudo /etc/sudoers # **important** must be edited with "visudo" or it might break the sudoers file and system can be locked.
  cat /etc/passwd | grep -E "(root|user)"
  cat /etc/group | grep -E "(root|user)"
  cat /etc/shadow | grep -E "(root|user)"


# Permissions

chown username: <file/directory_name>
chmod 444 <file_name>
user, group, everybody
rwx, rwx, rwx
421, 421, 421
7, 7, 7


# Miscellaneous

clear
reset
exit
poweroff
reboot
man
history
history -c # clears history only for the current session.
history | less
ls -al > lsout.txt  # to put all the directory information in a file. ***


# Secure Shell

# "ssh" is the client, "sshd" is the server.
# "ssh_config" is the client configuration file
# "sshd_config" The daemon configuration file
# "ssh-agent" An authentication agent that can store private keys.

ssh-keygen -t ed25519 -C "username@email.com" # ID name ed25519 can be configurable. "-t" stands for type of the key and -C" stands for comment.
eval "$(ssh-agent -s)" # Evaluating ssh-agent by running this command.
ssh-add ~/.ssh/id_ed25519 # Adding generated key to ssh-agent. Use only "ssh-add" to all generated key to ssh-agent. Only if there is multiple keys generated manually named.
cat ~/.ssh/id_ed25519.pub # To check the public key and set into the server.
openssh-server # install it on machine to use that machine over ssh.
ssh <user@ip/host> # to ssh into a system.
ssh -X <user@ip/host> # for X11 server based app use.
scp file_name host_ip:/path/file_name # secure copy files via ssh.

lastlog -u username # to check last login for security purpose.
who # check users who are currently logged in.


# Z Shell

cd ...  # as much as dot to go backward.
command and hit tab twice #using arrow keys to navigate specific directory.
take <dir_name> # create a directory and jump inside it.
command hit up arrow # to get specific command that already typed.
ctrl + r  # to serach recent commands.
