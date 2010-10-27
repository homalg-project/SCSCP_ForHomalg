#############################################################################
##
##  SCSCP_ForHomalg.gd     SCSCP_ForHomalg package           Mohamed Barakat
##                                                       Alexander Konovalov
##
##  Copyright 2010, Mohamed Barakat, University of Kaiserslautern
##                  Alexander Konovalov, University St Andrews
##
##  Declarations for SCSCP_ForHomalg.
##
#############################################################################


# our info class:
DeclareInfoClass( "InfoSCSCP_ForHomalg" );
SetInfoLevel( InfoSCSCP_ForHomalg, 1 );

# a central place for configurations:
DeclareGlobalVariable( "HOMALG_SCSCP" );

####################################
#
# global functions and methods:
#
####################################

DeclareGlobalFunction( "LaunchCAS_ViaSCSCP" );

DeclareGlobalFunction( "SendBlockingToCAS_ViaSCSCP" );

DeclareGlobalFunction( "TerminateCAS_ViaSCSCP" );

# basic operations:

