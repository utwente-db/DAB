#!/usr/bin/perl

# Conf
$aant=160;

# Constants
$formatstr="db%03d";
$fileformatstr="castle-PCS-1819-%s.sql";

sub dumpdbs()
{
	foreach $db (@dbs) {
		$f=sprintf($fileformatstr,$db);
		print "echo $f\n";
		print "pg_dump --file=$f --clean $db\n";
	}
}

@dbs=();
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

dumpdbs();
