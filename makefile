all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g ListOfDocFiles.g \
		PackageInfo.g \
		doc/SCSCP_ForHomalg.bib doc/*.xml \
		gap/*.gd gap/*.gi examples/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/SCSCP_ForHomalg.tar.gz --exclude ".DS_Store" --exclude "*~" SCSCP_ForHomalg/doc/*.* SCSCP_ForHomalg/doc/clean SCSCP_ForHomalg/gap/*.{gi,gd} SCSCP_ForHomalg/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g,ListOfDocFiles.g} SCSCP_ForHomalg/examples/*.g)

WEBPOS=public_html
WEBPOS_FINAL=~/Sites/homalg-project/SCSCP_ForHomalg

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.SCSCP_ForHomalg
	cp doc/manual.pdf ${WEBPOS}/SCSCP_ForHomalg.pdf
	cp doc/*.{css,html} ${WEBPOS}
	rm -f ${WEBPOS}/*.tar.gz
	mv ../tar/SCSCP_ForHomalg.tar.gz ${WEBPOS}/SCSCP_ForHomalg-`cat VERSION`.tar.gz
	rm -f ${WEBPOS_FINAL}/*.tar.gz
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	ln -s SCSCP_ForHomalg-`cat VERSION`.tar.gz ${WEBPOS_FINAL}/SCSCP_ForHomalg.tar.gz
