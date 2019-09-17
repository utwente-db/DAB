#!/usr/bin/perl

# Conf
$aant=160;

# Constants
$formatstr="db%03d";

sub recreatedbs()
{
	foreach $db (@dbs) {
		print <<EORECREATE;
DROP DATABASE $db;
\\c postgres
DROP OWNED BY $db CASCADE;
\\c template1
DROP OWNED BY $db CASCADE;
DROP USER $db;

EORECREATE
	}
}

@dbs=();
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

recreatedbs();
