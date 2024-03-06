# Description

MIRU-HERO takes a whole genome sequence assembly from *Mycobacterium tuberculosis* or *M. bovis* and predicts spoligotype, MIRU-type, and lineage information for that sequence.
The program will also identify *M. canettii*.

# Installation

MIRU-HERO has been developed on a Linux-based system.
It requires the following programs:

* Biopython
* NCBI blast+

To install, place the MiruHero executable in a directory on your PATH.
You can instead use it without installation by simply calling it from its downloaded location as described below.

# Example

To run MIRU-HERO, navigate to the program location using the terminal.
Call the program using ./MiruHero and specify the path to the fasta sequence you would like to obtain MIRU-HERO information for.
You can test with the example data provided.

	terminal:~$ cd [path_to_MiruHero]
	terminal:~[path_to_MiruHero]$ ./MiruHero testfiles/H37Rv.fasta

# Input

The program takes in different types of input fasta sequences:

* **Single fasta sequence**
:	If the file contains one fasta sequence, then MiruHero will find all MIRU regions within the sequence, as well as spoligo regions, and will return them along with the predicted lineage.

* **Multiple fasta-sequence file (contigs)**
:	If the file contains a multiple fasta sequences, then the program will search each fasta for the MIRU’s and spoligo’s, and will return a cumulative list of MIRU and spoligo regions, as well as the final lineage prediction.

# Output

**Run_Name.summary.tsv**
:	The first file which outputs is a tab-delimited file containing the file-path to the original fasta sequence, the user-defined run name, the flags specified for the run, the Spoligotype in octal format, the MIRU type (either 12 loci or 24 loci depending on user specifications), and the predicted lineage (from the seven major lineages).

**Run_Name.positions.tsv**
:	The positions file outputs the MIRU region, followed by the number of full copies of that particular MIRU, then the number of partial copies of the MIRU found sequential to the full copies, then the positions of each MIRU copy, specifying the fasta seq/contig which those positions were found in.  The partial copies have an additional percentage addendum to the positions which indicates the percentage of conservation among the base pairs of the partial copy to a full copy of the MIRU sequence.

# Notes

**MIRU region is within two lengths of the end of a fasta or contig**
:	If the MIRU region is within two lengths (a length being defined as the length of a single copy of the MIRU in question) of the end of the fasta sequence or contig, then the program will count all of the full copies that it can, and will append an ‘indeterminate’ label in the positions file.  It will also append a ‘?’ to that particular repeat in the final MIRU count output to signify that it cannot distinguish whether there are more copies or not.

**MIRU has a partial repeat at the beginning or end of the sequence (-p, --partial flag)**
:	If the MIRU loci has a partial copy (defined here as being between 50%-97%) either before the full repeat units or after the full repeat units, it appends the positions within the contig to the .positions.tsv file, along with the percent Identity, defined here as the number of base pairs which were the same between the MIRU unit and the reference, divided by the length of the reference.
  
**Special cases of loci MIRU2 and MIRU24 (-u, --unconventional flag)**
:	The MIRU loci at MIRU2 and MIRU24 have type III units and type I units respectively, which are not typically considered in the final MIRU12 or MIRU24 counts.  However, if the user would like these cases included as well in the final counts, then the –u, --unconventional flag may be specified.

As of right now, the spoligo information only outputs in octal code format, since that seems to be the standard way to visualize spoligo information, however, I can easily add in a flag which would output the binary code instead. Also, the lineage predictor right now only accounts for the seven major lineages, but future iterations of the program may be able to differentiate between sub-lineages.   
