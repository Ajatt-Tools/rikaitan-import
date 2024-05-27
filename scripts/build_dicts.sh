#!/bin/bash

go get github.com/Ajatt-Tools/rikaitan-import/tree/master/rikaitan

mkdir -p src
mkdir -p dst

function refresh_source () {
    NOW=$(date '+%s')
    YESTERDAY=$((NOW - 86400)) # 86,400 seconds in 24 hours
    if [ ! -f "src/$1" ]; then
        wget "ftp.edrdg.org/pub/Nihongo/$1.gz"
        gunzip -c "$1.gz" > "src/$1"
    elif [[ $YESTERDAY -gt $(date -r "src/$1" '+%s') ]]; then
        rsync "ftp.edrdg.org::nihongo/$1" "src/$1"
    fi
}

refresh_source "JMdict_e_examp"
rikaitan -language="english_extra" -title="JMdict" src/JMdict_e_examp dst/jmdict_english_extra_with_examples.zip

refresh_source "JMdict"
rikaitan -language="english_extra" -title="JMdict"         src/JMdict dst/jmdict_english_extra.zip
rikaitan -language="english"   -title="JMdict (English)"   src/JMdict dst/jmdict_english.zip
rikaitan -language="dutch"     -title="JMdict (Dutch)"     src/JMdict dst/jmdict_dutch.zip
rikaitan -language="french"    -title="JMdict (French)"    src/JMdict dst/jmdict_french.zip
rikaitan -language="german"    -title="JMdict (German)"    src/JMdict dst/jmdict_german.zip
rikaitan -language="hungarian" -title="JMdict (Hungarian)" src/JMdict dst/jmdict_hungarian.zip
rikaitan -language="russian"   -title="JMdict (Russian)"   src/JMdict dst/jmdict_russian.zip
rikaitan -language="slovenian" -title="JMdict (Slovenian)" src/JMdict dst/jmdict_slovenian.zip
rikaitan -language="spanish"   -title="JMdict (Spanish)"   src/JMdict dst/jmdict_spanish.zip
rikaitan -language="swedish"   -title="JMdict (Swedish)"   src/JMdict dst/jmdict_swedish.zip

rikaitan -format="forms"       -title="JMdict Forms"       src/JMdict dst/jmdict_forms.zip

refresh_source "JMnedict.xml"
rikaitan src/JMnedict.xml dst/jmnedict.zip

refresh_source "kanjidic2.xml"
rikaitan -language="english"    -title="KANJIDIC"              src/kanjidic2.xml dst/kanjidic_english.zip
rikaitan -language="french"     -title="KANJIDIC (French)"     src/kanjidic2.xml dst/kanjidic_french.zip
rikaitan -language="portuguese" -title="KANJIDIC (Portuguese)" src/kanjidic2.xml dst/kanjidic_portuguese.zip
rikaitan -language="spanish"    -title="KANJIDIC (Spanish)"    src/kanjidic2.xml dst/kanjidic_spanish.zip
