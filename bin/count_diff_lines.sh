#!/bin/bash

for i in *.diff; do
  NONTEST_SWIFT_LINES_ADDED="`perl -ne 'if (/^File: /) {$last_file = $_; }; print if (/^\+ / && $last_file !~ /test/i)' $i | wc -l | awk '{print $NF}'`"
  NONTEST_SWIFT_LINES_REMOVED="`perl -ne 'if (/^File: /) {$last_file = $_; }; print if (/^\- / && $last_file !~ /test/i)' $i | wc -l | awk '{print $NF}'`"
  
  echo "$i +$NONTEST_SWIFT_LINES_ADDED/-$NONTEST_SWIFT_LINES_REMOVED"
done