##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "SCSCP_ForHomalg" );

HOMALG_IO.show_banners := false;

LoadPackage( "GAPDoc" );

Read( "ListOfDocFiles.g" );

size := SizeScreen( );
SizeScreen([80]);

TestManualExamples( DirectoriesPackageLibrary( "SCSCP_ForHomalg", "doc" )[1]![1], "SCSCP_ForHomalg.xml", list );

GAPDocManualLab( "SCSCP_ForHomalg" );

SizeScreen( size );

quit;
