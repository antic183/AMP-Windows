# only for windows 
# a script to setup Sakila db
# requirements: installed "Git Bash" on your operating system (windows)
#
# copy this file on your desktop. 
# open "Git Bash"
# write ./installer.sh and press enter
# ***********************************************************************
# author: Antic M.
# version: 0.0.1
# date: 28.05.2016

read -p "Download and add Sakila db? Enter [yes] to continue: " answer;

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

# ********************** Sakila db **********************
cd ~/Desktop/$installerFolder;

file='sakila-db.zip';
savePath="$HOME/Desktop/sakila-db";
downloadUrl="http://downloads.mysql.com/docs/sakila-db.zip";

curl $downloadUrl --output $file;

unzip 'sakila-db.zip' -d "sakila-db-extract";
cp -r "sakila-db-extract/sakila-db" $savePath;

sleep 5;
cd ~/Desktop;
rm -rf $installerFolder;

echo "finish!";
sleep 2;

Msg \* "
add sakila db:
1. mysql -u -root -p
2. mysql> SOURCE c:/Users/.../Desktop/sakila-db/sakila-schema.sql;
3. mysql> SOURCE c:/Users/.../Desktop/sakila-db/sakila-data.sql;
";

exit;