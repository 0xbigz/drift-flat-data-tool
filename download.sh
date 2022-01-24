export GITHUB_USER="0xbigz"

git clone https://github.com/$GITHUB_USER/drift-flat-data/ drift-flat-data-1-full
cd drift-flat-data-1-full/
git log --pretty=oneline | cut -c1-8 > shortsha.txt
while read -r line; do wget wget https://github.com/$GITHUB_USER/drift-flat-data/archive/$line.zip; done < shortsha.txt
unzip *
for i in *zip; do unzip $i; done
for i in drift-flat-data*; do tail -n +2 $i/data/trade_history.csv >> concatenated.csv; done
cat $i/data/trade_history.csv | head -n 1 > final.csv
cat concatenated.csv >> final.csv
cp final.csv ../
