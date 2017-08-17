#!/bin/bash

REPO="$1"

if [ -z "$REPO" ] ; then
  echo "Usage: $0 <org/repo>"
fi

REPO_FILE="`echo $REPO | sed -e 's,/,_,g'`"
  
curl -s --head -i -u ${GITHUB_USER}:${GITHUB_API_TOKEN} "https://api.github.com/search/issues?q=NOT+update+NOT+readme+NOT+typo+NOT+xcode+NOT+implement+in:title+type:pr+state:closed+is:merged+merged:>=2016-01-01+repo:${REPO}&sort=created&order=asc" > $REPO_FILE.headers

LASTPAGE="`grep '^Link: ' $REPO_FILE.headers | sed -e 's/^.*page=//' -e 's/>.*$//'`"

if [ -z "$LASTPAGE" ] ; then
  LASTPAGE=1
fi

for ((PAGE=1;PAGE<=$LASTPAGE;PAGE++)); do
  curl -s  -u ${GITHUB_USER}:${GITHUB_API_TOKEN} "https://api.github.com/search/issues?q=NOT+update+NOT+readme+NOT+typo+NOT+xcode+NOT+implement+in:title+type:pr+state:closed+is:merged+merged:>=2016-01-01+repo:${REPO}&sort=created&order=asc&page=${PAGE}" > ${REPO_FILE}_page_${PAGE}.json 

  for PULL_URL in `jq -r '.items[].html_url' ${REPO_FILE}_page_${PAGE}.json`; do
    echo $PULL_URL
    #This is a hack
    TITLE="`jq -r '.items[]| .html_url+\":_:_:_:\"+.title' ${REPO_FILE}_page_${PAGE}.json | grep \"^$PULL_URL:\" | sed -e 's/^.*:_:_:_://'`"
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'add '`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'added '`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'adding '`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'support '`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'project '`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'dependenc'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'submodule'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'package.swift'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'podspec'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'cocoapod'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'carthage'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'deprecate'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'snapshot'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'migrat'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'refactor'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'rename'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'clean.*up'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'coverag'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'build'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'travis'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'jenkins'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i ' ci '`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'readme'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'comment'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'docs'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'documentation'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'spelling'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'typo'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'grammar'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'grammat'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i '^feature'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'move.*files'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'reorg'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'license'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'compatib'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'xcode'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'swift *2'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'swift *3'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'swift *4'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'beta *[0-9]'`" ] ; then
      continue
    fi
    if [ ! -z "`echo \"$TITLE\" | egrep -i 'warning'`" ] ; then
      continue
    fi
    echo $TITLE
    
    curl -s "${PULL_URL}/files?diff=split" > ${REPO_FILE}_${PULL_URL##*/}.html
    
    if [ -z "`grep data-path ${REPO_FILE}_${PULL_URL##*/}.html | grep '[^\"]\.swift' | grep -v 'Package\.swift'`" ] ; then
      # mv ${REPO_FILE}_${PULL_URL##*/}.html not_swift_${REPO_FILE}_${PULL_URL##*/}.html
      rm ${REPO_FILE}_${PULL_URL##*/}.html
    else
      egrep 'blob-code-inner|class="file-header" data-path' ${REPO_FILE}_${PULL_URL##*/}.html  | sed -e 's/^ *//g' | sed -e 's/^.*class="file-header" data-path="/File: /' -e 's/" data-short-path.*$//' -e 's,</*span[^>]*>,,g' -e 's,</*t[dr][^>]*>,,g' -e 's/\&quot;/"/g' -e 's/\&lt;/</g' -e 's/\&gt;/>/g' | sed '$!N; /^\(.*\)\n\1$/!P; D' |perl -ne 'if (/^File: /) {$last_file = $_; }; print if ($last_file =~ /[^ ]\.swift/ && $last_file !~ /ackage\.swift/)' > ${REPO_FILE}_${PULL_URL##*/}.diff
      if [ ! -z "`perl -ne 'if (/^File: /) {$last_file = $_; }; print if (/^@@ -/ && $last_file !~ /test/i)' ${REPO_FILE}_${PULL_URL##*/}.diff  | grep '^@@ -0,0 +1,'`" ] ; then
        #New non-test file - too complicated - don't care
        rm ${REPO_FILE}_${PULL_URL##*/}.*
      elif [ ! -z "`perl -ne 'if (/^File: /) {$last_file = $_; }; print if (/^@@ -/ && $last_file !~ /test/i)' ${REPO_FILE}_${PULL_URL##*/}.diff  | grep ' +0,0 @@$'`" ] ; then
        #Files removed - don't care
        rm ${REPO_FILE}_${PULL_URL##*/}.*
      else
        NONTEST_SWIFT_LINES_ADDED="`perl -ne 'if (/^File: /) {$last_file = $_; }; print if (/^\+ / && $last_file !~ /test/i)' ${REPO_FILE}_${PULL_URL##*/}.diff | wc -l | awk '{print $NF}'`"
        NONTEST_SWIFT_LINES_REMOVED="`perl -ne 'if (/^File: /) {$last_file = $_; }; print if (/^\- / && $last_file !~ /test/i)' ${REPO_FILE}_${PULL_URL##*/}.diff | wc -l | awk '{print $NF}'`"
        if [ $NONTEST_SWIFT_LINES_ADDED -eq 0 ] ; then
          #No lines added - don't care
          rm ${REPO_FILE}_${PULL_URL##*/}.*
        elif [ $NONTEST_SWIFT_LINES_ADDED -gt 100 ] ; then
          #Too many lines added - don't care
          rm ${REPO_FILE}_${PULL_URL##*/}.*
        elif [ $NONTEST_SWIFT_LINES_REMOVED -gt 100 ] ; then
          #Too many lines added - don't care
          rm ${REPO_FILE}_${PULL_URL##*/}.*
        fi
      fi
    fi
  done
done
