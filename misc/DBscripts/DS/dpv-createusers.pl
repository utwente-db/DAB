#!/usr/bin/perl

# Conf
$startfrom=0;
$aant=100;

# Constants
$formatstr="dpv1a%03d";

sub createusers()
{
	print "\n--- Create users\n\n";
	foreach $db (@dbs) {
		$pwd=`openssl rand -base64 8`;
		$pwd=substr $pwd,1,8;
		print "CREATE USER $db WITH PASSWORD '$pwd';\n\n";
	}

}

@dbs=();
for ($i=$startfrom; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

createusers();
