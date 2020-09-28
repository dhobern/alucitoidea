java -cp ../CoLDPUtils/target/CoLDPUtils-1.0-SNAPSHOT-jar-with-dependencies.jar io.github.dhobern.coldp.CoLDPTool -i 4 -t Alucitoidea -T ../hobern.net/Alucitoidea/index.php -e Alucitoidea-catalogue.html coldp/data | sed -e 's/\/img\//img\//' -e 's/\/css\//css\//' > ../hobern.net/Alucitoidea-TEST.html

java -cp ../CoLDPUtils/target/CoLDPUtils-1.0-SNAPSHOT-jar-with-dependencies.jar io.github.dhobern.coldp.CoLDPTool -i 4 -t Alucitoidea -xo ../hobern.net/Alucitoidea/Alucitoidea-catalogue.html coldp/data

erase Alucitoidea.zip
cd coldp
7z a ../Alucitoidea.zip *
cd ..

copy Alucitoidea.zip ..\hobern.net\Alucitoidea
