# only for windows 
# a script to setup MySQL
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

read -p "Install MYSQL? Enter [yes] to continue: " answer;

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
mkdir $installerFolder

# ********************** MySQL 5.6 **********************
cd ~/Desktop/$installerFolder;

file='mysql.zip';
savePath='c:/mysql';
downloadUrl="http://cdn.mysql.com//Downloads/MySQL-5.6/mysql-5.6.30-winx64.zip";

# required user agent
#curl -A 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3)' $downloadUrl -o $file
curl $downloadUrl --output $file;
unzip 'mysql.zip' -d "mysql-extract";

rm $file;
cp -r "mysql-extract\mysql-5.6.30-winx64" $savePath; 
sleep 2;
rm -rf "mysql-extract";

cd "$savePath/bin";
./mysqld --install

sleep 2

mysqladmin -u root password 1234

echo "finish!";
sleep 5;
exit;