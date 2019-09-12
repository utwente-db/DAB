#!/usr/bin/perl

# Conf
#n $aant=100;
$aant=1;

# Constants
$formatstr="di%02d";

sub addtable()
{
	foreach $db (@dbs) {
		print <<EORECREATE;
--- Database $db

\\c $db

CREATE SCHEMA semi;
ALTER SCHEMA semi OWNER TO $db;
SET search_path TO semi;

\\i voc.sql
ALTER TABLE semi.voc OWNER TO $db;

EORECREATE
	}
}

@dbs=();
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

addtable();
