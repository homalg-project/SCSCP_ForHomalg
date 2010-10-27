#############################################################################
##
##  SCSCP_ForHomalg.gi     SCSCP_ForHomalg package           Mohamed Barakat
##                                                       Alexander Konovalov
##
##  Copyright 2010, Mohamed Barakat, University of Kaiserslautern
##                  Alexander Konovalov, University St Andrews
##
##  Implementations for SCSCP_ForHomalg.
##
#############################################################################

####################################
#
# global variables:
#
####################################

InstallValue( HOMALG_SCSCP,
        rec(
            
            )
);

####################################
#
# initialization
#
####################################

####################################
#
# install global functions:
#
####################################

InstallGlobalFunction( LaunchCAS_ViaSCSCP,
  function( arg )
    local scscp, r, remote_stream, pid, s;
    
    r := EvaluateBySCSCP( "scscp_LaunchCAS", arg, HOMALG_IO.scscp : output := "cookie" );
    
    remote_stream := r.object;
    
    pid := HOMALG_IO.scscp![2];
    
    s := rec(
             remote_stream := remote_stream,
             pid := pid,
             SendBlockingToCAS := SendBlockingToCAS_ViaSCSCP,
             TerminateCAS := TerminateCAS_ViaSCSCP,
             );
    
    return s;
    
end );

InstallGlobalFunction( SendBlockingToCAS_ViaSCSCP,
  function( stream, L )
    local r;
    
    r := EvaluateBySCSCP( "scscp_SendBlockingToCAS", [ stream.remote_stream, L ], HOMALG_IO.scscp ).object;
    stream.lines := r[1];
    stream.errors := r[2];
    
end );

InstallGlobalFunction( TerminateCAS_ViaSCSCP,
  function( arg )
end );

