# -------------------------------------------------------------------------
# Package
#    RunJettyDriver.pl
#
# Dependencies
#    none
#
# Purpose
#    Create a command line to start/stop the jetty server
#
# Date
#    01/11/2012
#
# Engineer
#    Carlos Rojas
#
# Copyright (c) 2012 Electric Cloud, Inc.
# All rights reserved
# -------------------------------------------------------------------------
package RunJettyDriver;


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
    my $JettyHome           = ($ec->getProperty( "JettyHome" ))->findvalue('//value')->string_value;
    my $Action              = ($ec->getProperty( "Action" ))->findvalue('//value')->string_value;
    my $AdditionalCommands  = ($ec->getProperty( "AdditionalCommands" ))->findvalue('//value')->string_value;
    my $Debug               = ($ec->getProperty( "Debug" ))->findvalue('//value')->string_value;
    my $Script   = "jetty.sh";
    if($^O ne "linux"){
        $Script = "jetty-cygwin.sh";
    }
    
    my @cmd = ();
    
    if($JettyHome && $JettyHome ne ""){
        push(@cmd, qq{"$JettyHome/bin/$Script"});
    }
    
    #debug option is only available in linux
    if($Debug && $Debug eq "1" && $^O eq "linux"){
        push(@cmd, "-d");
    }
    
    if($Action && $Action ne ""){
        push(@cmd, $Action);
    }
    
    if($AdditionalCommands && $AdditionalCommands ne ""){
        push(@cmd, qq{$AdditionalCommands});
    }
    
    my $commandLine = join(" ", @cmd);
    
    $ec->setProperty("/myCall/commandLine", $commandLine);
   
}
  
main();
