my %RunJetty = (
    label       => "@PLUGIN_KEY@ - RunJetty",
    procedure   => "RunJetty",
    description => "Starts/Stops the jetty server",
    category    => "Application Server"
);

my %DeployApp = (
    label       => "@PLUGIN_KEY@ - DeployApp",
    procedure   => "DeployApp",
    description => "Deploys war files into the jetty server",
    category    => "Application Server"
);

@::createStepPickerSteps = (\%RunJetty, \%DeployApp);
