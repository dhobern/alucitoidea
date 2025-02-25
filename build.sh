#!/bin/bash
sed -i -e "s/^version: .*$/version: 1.1.`date '+%y.%j'`\r/" -e "s/^issued: .*$/issued: `date '+%Y-%m-%d'`\r/" -e "s/Version .* includes updates/Version 1.1.`date '+%y.%j'` includes updates/" coldp/metadata.yaml
sed -i -e "s/Version .* has been updated/Version 1.1.`date '+%y.%j'` has been updated/" -e "s/<h2>Catalogue of the Alucitoidea of the World, .*</<h2>Catalogue of the Alucitoidea of the World, version 1.1.`date '+%y.%j'`</" index.php
sed -i -e "s/<h2>Catalogue of the Alucitoidea of the World, .*</<h2>Catalogue of the Alucitoidea of the World, version 1.1.`date '+%y.%j'`</" catalogue.php

rm -f Alucitoidea.zip
cd coldp
zip -r ../Alucitoidea.zip *
cd ..

cp Alucitoidea.zip ../../SyncProjects/hobern.net/Alucitoidea
cp index.php ../../SyncProjects/hobern.net/Alucitoidea
cp catalogue.php ../../SyncProjects/hobern.net/Alucitoidea

java -cp ../../SyncProjects/CoLDPUtils/target/COLDPUtils-1.0-SNAPSHOT-jar-with-dependencies.jar io.github.dhobern.coldp.COLDPTool TOHTML -w 4 -t Alucitoidea -T ../../SyncProjects/hobern.net/Alucitoidea/catalogue.php -e Alucitoidea-catalogue.html coldp/data | sed -e 's/\/img\//img\//' -e 's/\/css\//css\//' > ../../SyncProjects/hobern.net/Alucitoidea-TEST.html

java -cp ../../SyncProjects/CoLDPUtils/target/COLDPUtils-1.0-SNAPSHOT-jar-with-dependencies.jar io.github.dhobern.coldp.COLDPTool TOHTML -w 4 -t Alucitoidea -xo ../../SyncProjects/hobern.net/Alucitoidea/Alucitoidea-catalogue.html coldp/data
