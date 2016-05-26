# only for windows 
# a script to setup Apache
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

# requirements: c++ 2012 !!!

read -p "Install APACHE? Enter [yes] to continue: " answer;

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

# ********************** Apache version 2.4 **********************
file='apache.zip';
savePath='c:/apache24';
# VC10 for win7
downloadUrl='https://www.apachelounge.com/download/VC10/binaries/httpd-2.4.20-win64.zip';

cd ~/Desktop/$installerFolder;

# required user agent
curl -A 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3)' $downloadUrl -o $file

unzip 'apache.zip' -d 'apache-extract';
rm 'apache.zip';

cp -r 'apache-extract/Apache24' $savePath; 

rm -r 'apache-extract';

NEWLINE="\r\n";
configAddingApache=$NEWLINE;
configAddingApache+="# For PHP 5 do something like this:";
configAddingApache+=$NEWLINE;
configAddingApache+='LoadModule php5_module "c:/php/php5apache2_4.dll"';
configAddingApache+=$NEWLINE;
configAddingApache+="AddType application/x-httpd-php .php"
configAddingApache+=$NEWLINE;
configAddingApache+=$NEWLINE;
configAddingApache+='# configure the path to php.ini'
configAddingApache+=$NEWLINE;
configAddingApache+='PHPIniDir "C:/php"';

cd $savePath;
cd conf;
echo -e $configAddingApache>>'httpd.conf';
cd "$savePath/bin";

# install apache as service
./httpd.exe -k install -n "APACHE24";

# delete service => cntrl+r>cmd>sc delete "SERVICE-NAME";

#optional:
#cd ~/Desktop;
#batchFile="@echo off";
#batchFile+=$NEWLINEexit;
#batchFile+="show-services.msc";
#echo -e $batchFile +  > show-services.cmd

cd ~/Desktop;
rm -r $installerFolder;

echo "installation was successfull";
exit;