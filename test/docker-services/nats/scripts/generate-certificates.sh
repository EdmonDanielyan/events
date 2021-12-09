#brew install mkcert
#brew install nss

# shellcheck disable=SC2096
#/Applications/Python\ 3.9/Install\ Certificates.command -- pip install --upgrade certifi

mkcert -install
mkcert -cert-file server-cert.pem -key-file server-key.pem 192.168.0.13 192.168.0.13
#mkcert -uninstall