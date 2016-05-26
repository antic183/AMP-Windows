# only for windows 
# a script to setup PHP
# requirements: installed "Git Bash" on your operating system (windows)
# important:
# copy this file on your desktop. 
# open "Git Bash" with admin privilliges
# write ./installer.sh and press enter
# this script must be run as admin for access to create windows services.
# ***********************************************************************
# author: Antic M.
# version: 0.0.1
# date: 16.05.2016

read -p "Install PHP? Enter [yes] to continue: " answer;

yes="yes"
if [ "$answer" = "$yes" ]; then
   echo "ok. please wait.."
else
   echo "bye.."
   sleep 2
   exit
fi

cd ~/Desktop;
installerFolder="installer_$(date -d "today" +"%Y%m%d%H%M%S")";
mkdir $installerFolder;

# ********************** PHP version 5.6.20 **********************
file='php.zip';
downloadUrl='http://windows.php.net/downloads/releases/php-5.6.21-Win32-VC11-x64.zip';
savePath="c:/php";

cd ~/Desktop/$installerFolder;

curl $downloadUrl --output $file;
unzip $file -d $savePath;
rm $file;

cd $savePath;
cp php.ini-development php.ini

#setting up php.ini:
sed -i 's/; extension_dir = "ext"/extension_dir = "ext"/g' php.ini
sed -i 's/;extension=php_mbstring.dll/extension=php_mbstring.dll/g' php.ini
sed -i 's/;extension=php_exif.dll/extension=php_exif.dll/g' php.ini
sed -i 's/;extension=php_mysql.dll/extension=php_mysql.dll/g' php.ini
sed -i 's/;extension=php_mysqli.dll/extension=php_mysqli.dll/g' php.ini
sed -i 's/;extension=php_openssl.dll/extension=php_openssl.dll/g' php.ini
sed -i 's/;extension=php_curl.dll/extension=php_curl.dll/g' php.ini

cd ~/Desktop;
rm -r $installerFolder;

echo "installation was successfull";
exit;