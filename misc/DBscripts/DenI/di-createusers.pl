#!/usr/bin/perl

# Conf
$aant=200;

# Constants
$formatstr="di%03d";

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
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

createusers();
