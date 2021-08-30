echo off
For /F "tokens=1* delims==" %%A IN (keystore.properties) DO (
    IF "%%A"=="storePassword" set storePassword=%%B
    IF "%%A"=="keyPassword" set keyPassword=%%B
    IF "%%A"=="keyAlias" set keyAlias=%%B
)
rm key.jks
call "%JAVA_HOME%\bin\keytool" -genkey -dname "cn=JetRabbits, ou=Development, o=jetrabbits.com, c=RU" -keypass %keyPassword% -keyAlg RSA -keysize 2048 -validity 10000 -alias %keyAlias% -keystore key.jks -storepass %storePassword%
call "%JAVA_HOME%\bin\keytool" -list -keystore key.jks -storepass %storePassword%