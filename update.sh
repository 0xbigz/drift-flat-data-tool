export GITHUB_USER="0xbigz"

cd drift-flat-data-1-full
git pull
git log --pretty=oneline | cut -c1-8 > shortsha_update.txt
while read -r line;  do if [ -f "$line.zip" ]; then :; else wget wget https://github.com/$GITHUB_USER/drift-flat-data/archive/$line.zip; unzip $line.zip; fi; done < shortsha_update.txt
cd ..