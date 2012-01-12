# -------------------------------------------------------------------------
# Package
#    DeployAppDriver.pl
#
# Dependencies
#    none
#
# Purpose
#    Create a command line for the EC-Jetty command line utility
#
# Date
#    01/06/2012
#
# Engineer
#    Carlos Rojas
#
# Copyright (c) 2011 Electric Cloud, Inc.
# All rights reserved
# -------------------------------------------------------------------------
package DeployAppDriver;


# -------------------------------------------------------------------------
# Includes
# -------------------------------------------------------------------------
use strict;
use warnings;
use ElectricCommander;
$|=1;

sub main {
    my $ec = ElectricCommander->new();
    $ec->abortOnError(0);
    
    # -------------------------------------------------------------------------
    # Parameters
    # -------------------------------------------------------------------------
    my $WarFileLocation     = ($ec->getProperty( "WarFileLocation" ))->findvalue('//value')->string_value;
    my $WarFileDestination  = ($ec->getProperty( "WarFileDestination" ))->findvalue('//value')->string_value;
    my $copy = ($^O eq "linux") ? "cp" : "copy";
    
    my $commandLine = $copy . qq{ "$WarFileLocation" } . qq{"$WarFileDestination"};
    
    $ec->setProperty("/myCall/deploycommandLine", $commandLine);
   
}
  
main();
