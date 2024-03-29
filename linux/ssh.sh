# Secure Shell

# "ssh" is the client, "sshd" is the server.
# "ssh_config" is the client configuration file.
# "sshd_config" The server daemon configuration file.
# "ssh-agent" An authentication agent that can store private keys.

ssh-keygen -t ed25519 -C "username@email.com" # ID name ed25519 can be configurable. "-t" stands for type of the key and -C" stands for comment.
eval "$(ssh-agent -s)" # Evaluating ssh-agent by running this command.
ssh-add ~/.ssh/id_ed25519 # Adding generated key to ssh-agent. Use only "ssh-add" to all generated key to ssh-agent. Only if there is multiple keys generated manually named.
cat ~/.ssh/id_ed25519.pub # To check and copy the public key, then setting into the server.
ssh <user@ip/host> # to ssh into a system.
scp file_name host_ip:/path/file_name # secure copy files via ssh.


# ssh for desktop

openssh-server # install it on desktop machine to use that machine over ssh.
ssh -X <user@ip/host> # for X11 server based app use.
