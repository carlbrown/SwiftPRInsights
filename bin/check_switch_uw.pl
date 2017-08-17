#!/usr/bin/env perl -w

$lastline="";

while (<>) {
  if (($_ =~ /weak/ && $lastline =~ /unowned/) || ($lastline =~ /weak/ && $_ =~ /unowned/)){
    if (($_ =~ /^\+/ && $lastline =~ /^-/) || ($lastline =~ /^\+/ && $_ =~ /^-/)){
      print $lastline;
      print $_;
    }
  }
  $lastline=$_;
}