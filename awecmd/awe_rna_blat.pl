#!/usr/bin/env perl 

use strict;
use warnings;
no warnings('once');

use PipelineAWE;
use Getopt::Long;
umask 000;

# options
my $fasta   = "";
my $output  = "";
my $rna_nr  = "md5rna";
my $help    = 0;
my $options = GetOptions (
		"input=s"  => \$fasta,
        "output:s" => \$output,
		"rna_nr=s" => \$rna_nr,
		"help!"    => \$help
);

if ($help){
    print get_usage();
    exit 0;
}elsif (length($fasta)==0){
    print STDERR "ERROR: An input file was not specified.\n";
    print STDERR get_usage();
    exit __LINE__;
}elsif (length($output)==0){
    print STDERR "ERROR: An output file was not specified.\n";
    print STDERR get_usage();
    exit __LINE__;
}elsif (! -e $fasta){
    print STDERR "ERROR: The input sequence file [$fasta] does not exist.\n";
    print STDERR get_usage();
    exit __LINE__;
}

my $refdb_dir = ".";
if ($ENV{'REFDBPATH'}) {
  $refdb_dir = "$ENV{'REFDBPATH'}";
}
my $rna_nr_path = $refdb_dir."/".$rna_nr;
unless (-s $rna_nr_path) {
    print STDERR "ERROR: rna_nr not exist: $rna_nr_path\n";
    print STDERR print_usage();
    exit __LINE__;
}

print "blat -out=blast8 -t=dna -q=dna -fastMap $rna_nr_path $fasta stdout | bleachsims -s - -o $output -r 0";
system("blat -out=blast8 -t=dna -q=dna -fastMap $rna_nr_path $fasta stdout | bleachsims -s - -o $output -r 0 > blat.out 2>&1") == 0 or exit __LINE__;

exit(0);

sub get_usage {
    return "USAGE: awe_rna_blat.pl -input=<input fasta> -output=<output sims> [-rna_nr=<rna nr file, default: md5rna>] \n";
}
