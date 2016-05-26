# only for windows 
# a script to setup MySQL Workbench
# requirements: installed "Git Bash" on your operating system (windows)
#
# copy this file on your desktop. 
# open "Git Bash"
# write ./installer.sh and press enter
# ***********************************************************************
# author: Antic M.
# version: 0.0.1
# date: 25.05.2016

read -p "Install MYSQL WORKBENCH? Enter [yes] to continue: " answer;

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

file='mysql-workbench.zip';
savePath="$HOME/Desktop/mysql-workbench";
downloadUrl="http://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community-6.3.6-win32-noinstall.zip";

# required user agent
#curl -A 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3)' $downloadUrl -o $file
curl $downloadUrl --output $file;

unzip 'mysql-workbench.zip' -d "mysql-workbench-extract";

rm $file;

cp -r "mysql-workbench-extract/MySQL Workbench 6.3.6 CE (win32)" $savePath;

sleep 5;
cd ~/Desktop;
rm -rf $installerFolder;

echo "finish!";
sleep 2;
exit;