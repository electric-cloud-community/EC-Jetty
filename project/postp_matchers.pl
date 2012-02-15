@::gMatchers = (
  {
   id =>        "alreadyrunning",
   pattern =>          q{Starting Jetty: Already Running},
   action =>           q{&addSimpleError("alreadyrunning", "Jetty is already running");setProperty("outcome", "error" );updateSummary();},
  },
  {
    id =>       "stop",
    pattern =>         q{Stopping Jetty: OK},
    action =>           q{&addSimpleError("stop", "Jetty is now stopped");updateSummary();},
  },
  {
    id =>       "start",
    pattern =>         q{Starting Jetty: STARTED},
    action =>           q{&addSimpleError("start", "Jetty has been started");updateSummary();},
  },
);

sub addSimpleError {
    my ($name, $customError) = @_;
    if(!defined $::gProperties{$name}){
        setProperty ($name, $customError);
    }
}

sub updateSummary() {
 
    my $summary = (defined $::gProperties{"alreadyrunning"}) ? $::gProperties{"alreadyrunning"} . "\n" : "";
    $summary .= (defined $::gProperties{"stop"}) ? $::gProperties{"stop"} . "\n" : "";
    $summary .= (defined $::gProperties{"start"}) ? $::gProperties{"start"} . "\n" : "";

    setProperty ("summary", $summary);
}