cd ~/dotfiles

cp scripts/saml_login ~/.local/bin/
./scripts/saml2aws.sh
./restore_shell.sh
