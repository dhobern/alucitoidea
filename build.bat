@ECHO OFF
erase Alucitoidea.zip
cd coldp
7z a ../Alucitoidea.zip *
cd ..

copy Alucitoidea.zip ..\hobern.net\Alucitoidea


.\coldp.bat TOHTML -w 4 -t Alucitoidea -T ../hobern.net/Alucitoidea/catalogue.php -e Alucitoidea-catalogue.html coldp/data | sed -e 's/\/img\//img\//' -e 's/\/css\//css\//' > ../hobern.net/Alucitoidea-TEST.html

.\coldp.bat TOHTML -w 4 -t Alucitoidea -xo ../hobern.net/Alucitoidea/Alucitoidea-catalogue.html coldp/data