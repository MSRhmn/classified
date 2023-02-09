# Linux File System Hierarchy: FSH


/bin # os basic binary programs.

/sbin # binaries for sysadmin.

/boot # reserves boot loader, should not be touched.

/dev # this is where hardware lives. Linux know them as a file.

/etc # systemwide software settings and configuration.

/lib # libraries for software and required by binaries.

/media # is for os to handle external devices.

/mnt # for accessing devices in manually.

/opt # software that are installed from vendors.

/proc # all kind of sudo processing files.

/root # root users home directory, doesn't have typicall users directory.

/run # tempfs system runs on ram, everything is gone on system boot.

/srv # service directory, where service data is stored. files that are accessed by external usres will be here.

/sys # system folder way to interact with the kernel, doesn't write to the hard drives.

/tmp # temporary files for application during a session.
