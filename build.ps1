$versionid=get-date -UFormat "1.1.%y.%j (%d %b %Y)"
$releasedate=get-date -UFormat "%Y-%m-%d"
$versionshort=get-date -UFormat "1.1.%y.%j"
sed -i -e "s/^version: .*$/version: $versionid\r/" -e "s/^released: .*$/released: $releasedate\r/" -e "s/Version .* includes updates/Version $versionshort includes updates/" coldp/metadata.yaml
sed -i -e "s/Version .* has been updated/Version $versionshort has been updated/" -e "s/<h2>Catalogue of the Alucitoidea of the World, .*</<h2>Catalogue of the Alucitoidea of the World, version $versionid</" index.php
sed -i -e "s/<h2>Catalogue of the Alucitoidea of the World, .*</<h2>Catalogue of the Alucitoidea of the World, version $versionid</" catalogue.php

erase Alucitoidea.zip
cd coldp
7z a ../Alucitoidea.zip *
cd ..

copy Alucitoidea.zip ..\hobern.net\Alucitoidea
copy index.php ..\hobern.net\Alucitoidea
copy catalogue.php ..\hobern.net\Alucitoidea

.\coldp.bat TOHTML -w 4 -t Alucitoidea -T ../hobern.net/Alucitoidea/catalogue.php -e Alucitoidea-catalogue.html coldp/data | sed -e 's/\/img\//img\//' -e 's/\/css\//css\//' > ../hobern.net/Alucitoidea-TEST.html

.\coldp.bat TOHTML -w 4 -t Alucitoidea -xo ../hobern.net/Alucitoidea/Alucitoidea-catalogue.html coldp/data