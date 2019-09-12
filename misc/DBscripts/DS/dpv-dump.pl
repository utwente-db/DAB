#!/usr/bin/perl

# Conf
$aant=140;

# Constants
$formatstr="dpv2a%03d";
$fileformatstr="castle-DS-DPV-18192A-%s.sql";

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
