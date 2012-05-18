LoadPackage( "LibSingularForHomalg" );

LoadPackage( "Modules" );

runtime:=function(t1,t2) return Int( (1000000*(t2.tv_sec-t1.tv_sec)+t2.tv_usec-t1.tv_usec) / 1000 ); end;

curtime1:=IO_gettimeofday();

Read( "Purity.g" );

curtime2:=IO_gettimeofday();

Print( TimeToString( runtime(curtime1,curtime2) ), "\n" );
