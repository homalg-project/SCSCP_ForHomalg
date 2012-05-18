#############################################################################
#
# This is the SCSCP server configuration file.
# The service provider can start the server just by the command 
# $ gap myserver.g
#
# $Id: myserver.g 3120 2009-05-31 20:10:54Z alexk $
#
#############################################################################

#############################################################################
#
# Load necessary packages and read external files. 
# Put here and other commands if needed.
#
#############################################################################

LogTo(); # to close log file if it was opened from .gaprc
LoadPackage("scscp");

LoadPackage("RingsForHomalg");
LoadPackage("IO_ForHomalg");

#############################################################################
#
# Procedures and functions available for the SCSCP server
# (you can also install procedures contained in other files,
# including standard GAP procedures and functions) by adding
# appropriate calls to InstallSCSCPprocedure below.
#
#############################################################################


#############################################################################
#
# ChangeInfoLevel( <n> )
#
# Changes InfoSCSCP level on the server without restarting it.
#
ChangeInfoLevel:=function( n )
SetInfoLevel( InfoSCSCP, n );
return true;
end;

InstallSCSCPprocedure( "ChangeInfoLevel", ChangeInfoLevel, 
        "To change InfoSCSCP level on the server without restarting", 1, 1 );

#############################################################################
#
# Installation of procedures to make them available for WS 
# (you can also install procedures contained in other files,
# including standard GAP procedures and functions)
#
#############################################################################

# Simple procedures for tests and demos
InstallSCSCPprocedure( "Identity", x -> x, "Identity procedure for tests", 1, 1 );

# HomalgToCAS procedures
InstallSCSCPprocedure( "scscp_LaunchCAS", LaunchCAS );

InstallSCSCPprocedure( "scscp_SendBlockingToCAS", function( stream, L ) SendBlockingToCAS( stream, L ); return [ stream.lines, stream.errors ]; end );

#############################################################################
#
# procedure to test pickling/unpickling from the IO package for data encoding
# 
IO_UnpickleStringAndPickleItBack:=function( picklestr )
return( IO_PickleToString( IO_UnpickleFromString( picklestr ) ) );
end;

InstallSCSCPprocedure( "IO_UnpickleStringAndPickleItBack", IO_UnpickleStringAndPickleItBack, 
	"To test how pickling format from IO package may be used for data transmitting (see ?IO_Pickle, ?IO_Unpickle)", 1, 1 );


#############################################################################
#
# Finally, we start the SCSCP server. 
#
#############################################################################

RunSCSCPserver( SCSCPserverAddress, SCSCPserverPort );
