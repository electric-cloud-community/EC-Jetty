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
    my $Action              = ($ec->getProperty( "Action" ))->findvalue('//value')->string_value;
    my $JavaPath            = ($ec->getProperty( "JavaPath" ))->findvalue('//value')->string_value;
    my $JettyHome           = ($ec->getProperty( "JettyHome" ))->findvalue('//value')->string_value;
    my $StopPort            = ($ec->getProperty( "StopPort" ))->findvalue('//value')->string_value;
    my $StopKey             = ($ec->getProperty( "StopKey" ))->findvalue('//value')->string_value;
    my $AdditionalCommands  = ($ec->getProperty( "AdditionalCommands" ))->findvalue('//value')->string_value;
    my $separator   = "\\";
    if($^O eq "linux"){
        $separator = "/";
    }
    
    my @cmd = ();
    
    if($JavaPath && $JavaPath ne ""){
        push(@cmd, qq{"$JavaPath" -jar});
    }else{
        push(@cmd, "java -jar");
    }
    
    if($JettyHome && $JettyHome ne ""){
        push(@cmd, qq{"$JettyHome} . $separator . qq{start.jar"});
    }
    
    if($AdditionalCommands && $AdditionalCommands ne ""){
        push(@cmd, qq{$AdditionalCommands});
    }
    
    if($StopPort && $StopPort ne ""){
        push(@cmd, "STOP.PORT=$StopPort");
    }
    
    if($StopKey && $StopKey ne ""){
        push(@cmd, "STOP.KEY=$StopKey");
    }
    
    if($Action && $Action eq "stop"){
        push(@cmd, "--stop");
    }
    
    my $commandLine = join(" ", @cmd);
    
    $ec->setProperty("/myCall/commandLine", $commandLine);
    $ec->setProperty("/myCall/workingdir", $JettyHome);
   
}
  
main();
