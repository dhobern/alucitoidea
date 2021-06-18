$versionid=get-date -UFormat "%y.%j (%d %b %Y)"
$releasedate=get-date -UFormat "%Y-%m-%d"
sed -i -e "s/^version: .*$/version: 1.0.$versionid\r/" -e "s/^released: .*$/released: $releasedate\r/" coldp/metadata.yaml

erase Alucitoidea.zip
cd coldp
7z a ../Alucitoidea.zip *
cd ..

copy Alucitoidea.zip ..\hobern.net\Alucitoidea

.\coldp.bat TOHTML -w 4 -t Alucitoidea -T ../hobern.net/Alucitoidea/catalogue.php -e Alucitoidea-catalogue.html coldp/data | sed -e 's/\/img\//img\//' -e 's/\/css\//css\//' > ../hobern.net/Alucitoidea-TEST.html

.\coldp.bat TOHTML -w 4 -t Alucitoidea -xo ../hobern.net/Alucitoidea/Alucitoidea-catalogue.html coldp/data