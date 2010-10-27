LoadPackage( "SCSCP_ForHomalg" );

HOMALG_IO.scscp := NewSCSCPconnection( "localhost", 26133 );
IN_SCSCP_BINARY_MODE := true;

LoadPackage( "Modules" );

runtime:=function(t1,t2) return 1000000*(t2.tv_sec-t1.tv_sec)+t2.tv_usec-t1.tv_usec; end;

curtime1:=IO_gettimeofday();

HOMALG_IO_Singular.LaunchCAS := LaunchCAS_ViaSCSCP;

Read( "Purity.g" );

curtime2:=IO_gettimeofday();
Print( runtime(curtime1,curtime2), "\n" );

#CloseSCSCPconnection( HOMALG_IO.scscp );
