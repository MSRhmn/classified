#!/usr/bin/env bash

# A shell is a command interpreter that exposes to the user an interface to work with the underlying operating system/kernel.


# System information

lsb_release -a # shows information about your distribution.
uname -r # to check the kernel info.
whoami # checking the user.
hostname # checking the host you are logged in.
who # check users who are currently logged in.
lastlog -u username # to check last login for security purpose.
uptime # checking the systems uptime.
date # Checking the date on the system.
df # Checking the current amount of free space on disk drives.


# Tree Navigation

. # means current directory.
.. # means parent directory.
../.. # backwarding directories.
* #to mark all the files or directories.
pwd # Prints current working directory
cd | <path> # Changing directory paths in the Tree. "cd" self changes path into users home.
ls -lahit # "-i" stands for inode, which is metadata about the data. "t" option sorts the result by file modification time. "h" ddisplays file sizes in human readable format rather than in bytes.
pushd <dir_name>  # login into new session without exiting previous session.
popd  # exiting out from a newly created session.
Ctrl - Alt - F1 | F6 # Checking virtual terminals or virtual consoles.
Alt - F7 # Return to graphical desktop env.


# File/Directory Manipulation

touch <file_name>
touch <file-name-{1..20}.ext> # Creating multiple files in a single command.
echo <string> > <file_name> # Adding echo output to a new file. ">>" can be use to append echo in the existing file.
mv
cp
cp -r
rm
rm -r # Removing files and directories recursively.
mkdir
mkdir -p <dir/subdir> # Creating nested directories.
rmdir
ln </file_location> <location/file_name> # Hard links are only available for files not directories and doesn't support over "not identical" storage device. It creates a copy of the file.
ln -s </file/dir_location> <location/file_name> # creating symbolic links for files or directory. Use absolute paths to create links to avoid broken links. Can be moved symlinks to any storage device.


# Reading/Editing Files

cat > <file_name>  # creating files from the command line.
cat <file_name> <file_name2> | less  # reading multiple files together.
less
tail -f <file_name> # reads file with any current update with in the file.

  # The find command

  find . # finds all of the files and folders of current directory.
  find . -type df -(i)name 'directory name | filename* | *.ext' # reads all the directories and files, specific with name or extension name, (i) is for case insensitive option.
  find . -type f -mmin +1 -mmin -5 # find files that modified more than 1 minute ago and less the 5 minute.
  find . -type f -mtime -7 # refers files that are modified by in day.
  find . -size +5MGk # returns size of the files.
  find . -empty # to check what files are empty.


# Users and Groups

sudo # super users do, sudoers permission.
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
ctrl + r  # to serach recent commands.


# Debian Package manger

sudo apt search  <package_name> # Searching a specific package in the apt repository.
