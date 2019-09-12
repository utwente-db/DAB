#!/usr/bin/perl

# Conf
$aant=100;

# Constants
$formatstr="dda%03d";

sub recreatedbs()
{
	foreach $db (@dbs) {
		print <<EORECREATE;
\\c postgres
DROP OWNED BY $db CASCADE;
\\c template1
DROP OWNED BY $db CASCADE;
DROP DATABASE $db;
DROP USER $db;

EORECREATE
	}
}

@dbs=();
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

recreatedbs();
