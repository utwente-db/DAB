#!/usr/bin/perl

# Conf
$aant=15;

# Constants
$formatstr="pp%02d";

sub recreatedbs()
{
	foreach $db (@dbs) {
		print <<EORECREATE;
DROP DATABASE $db;
\\c template1
DROP OWNED BY $db;
\\c valentina
DROP OWNED BY $db;
DROP USER $db;

EORECREATE
	}
}

@dbs=();
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

recreatedbs();
