cd ~/dotfiles

helm plugin install https://github.com/jkroepke/helm-secrets --version v4.5.1
cp scripts/saml_login ~/.local/bin/
./scripts/saml2aws.sh
./restore_shell.sh
