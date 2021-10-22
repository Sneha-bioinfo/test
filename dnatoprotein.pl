#perl program to convert a nucleotide sequence into protein sequence
#!/usr/bin/perl -w
print "Enter the nucleotide sequence containing filename with extension: \n";
$filename=<STDIN>;
chomp ($filename);
unless (open(FILE,$filename))
	{print "cannot open file\"$filename\"\n\n";
	}
@DNAseq=<FILE>;
close FILE;
$DNA=join('',@DNAseq);


my $protein='';
my $codon;
for(my $i=0;$i<(length($DNA)-2);$i+=3)
{
$codon=substr($DNA,$i,3);
$protein.=&codon2aa($codon);
}
print "The translated protein is :\n$protein\n";
<STDIN>;

sub codon2aa{
my($codon)=@_;
$codon=uc $codon;
my(%geneticcode)=
('TTT'=>'F','TTC'=>'F','TTA'=>'L','TTG'=>'L','TCT'=>'S','TCC'=>'S','TCA'=>'S','TCG'=>'S','TAT'=>'Y','TAC'=>'Y','TAA'=>'_','TAG'=>'_','TGT'=>'C','TGC'=>'C','TGA'=>'_','TGG'=>'W','CTT'=>'L',
'CTC'=>'L','CTA'=>'L','CTA'=>'L','CTG'=>'L','CCT'=>'P','CCC'=>'P','CCA'=>'P','CCG'=>'P','CAT'=>'H','CAC'=>'H','CAA'=>'Q','CAG'=>'Q','CGT'=>'R','CGC'=>'R','CGA'=>'R','CGG'=>'R',
'ATT'=>'I','ATC'=>'I','ATA'=>'I','ATG'=>'M','ACT'=>'T','ACC'=>'T','ACA'=>'T','ACG'=>'T','AAT'=>'N','AAC'=>'N','AAA'=>'K','AAG'=>'K','AGT'=>'S','AGC'=>'S','AGA'=>'R','AGG'=>'R',
'GTT'=>'V','GTC'=>'V','GTA'=>'V','GTG'=>'V','GCT'=>'A','GCC'=>'A','GCA'=>'A','GCA'=>'A','GCG'=>'A','GAT'=>'D','GAC'=>'D','GAA'=>'E','GAG'=>'E','GGT'=>'G','GGC'=>'G','GGA'=>'G','GGG'=>'G');
if(exists $geneticcode{$codon})
{
return $geneticcode{$codon};
}
else
{
print STDERR "wrong codon \"$codon\"!!\n";
exit;
}
}

