##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/SCSCP_ForHomalg.bib" );
WriteBibXMLextFile( "doc/SCSCP_ForHomalgBib.xml", bib );

Read( "ListOfDocFiles.g" );

PrintTo( "VERSION", PackageInfo( "SCSCP_ForHomalg" )[1].Version );

MakeGAPDocDoc( "doc", "SCSCP_ForHomalg", list, "SCSCP_ForHomalg" );

GAPDocManualLab( "SCSCP_ForHomalg" );

QUIT;
