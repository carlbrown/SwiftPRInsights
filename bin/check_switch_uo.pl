#!/usr/bin/env perl -w

$lastline="";

while (<>) {
  $thisline=$_;
  if (($thisline =~ /\?/ && $lastline =~ /!/) || ($lastline =~ /\?/ && $thisline =~ /!/)){
    if (($thisline =~ /^\+/ && $lastline =~ /^-/) || ($lastline =~ /^\+/ && $thisline =~ /^-/)){
      
      for(1 .. length($thisline)) {
        my $char1 = substr($thisline, $_, 1);
        my $char2 = substr($lastline, $_, 1);
        if ($char1 ne $char2) {
          if (($char1 eq "?" && $char2 eq "!" ) || ($char1 eq "!" && $char2 eq "?" )) {
            print $lastline;
            print $thisline;
            last;
          } else {
            last;
          }
        }
      }
    }
  }
  $lastline=$thisline;
}