my %RunJetty = (
    label       => "Jetty - Run Jetty",
    procedure   => "RunJetty",
    description => "Start/Stop the Jetty server",
    category    => "Application Server"
);

my %DeployApp = (
    label       => "Jetty - Deploy Application",
    procedure   => "DeployApp",
    description => "Deploy war files into the Jetty server",
    category    => "Application Server"
);

$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Jetty - RunJetty");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Jetty - DeployApp");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Jetty - Run Jetty");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Jetty - Deploy Application");

@::createStepPickerSteps = (\%RunJetty, \%DeployApp);
