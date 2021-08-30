#/bin/sh

file="./keystore.properties"

if [ -f "$file" ]
then
  echo "$file found."
  while IFS='=' read -r key value
  do
    key=$(echo $key | tr '.' '_')
    eval ${key}=\${value}
  done < "$file"
  rm -f key.jks
  keytool -genkey -dname "cn=JetRabbits, ou=Development, o=jetrabbits.com, c=RU" -keypass $1 -keyAlg rsa -keysize 2048 -validity 10000 -alias $keyAlias -keystore key.jks -storepass $1
  keytool -list -keystore key.jks -storepass $1

  # NOTE: please encode key store file using base64 tool before import binary file variable in gitlab: base64 -i key.jks -o key64.jks
else
  echo "$file not found."
fi