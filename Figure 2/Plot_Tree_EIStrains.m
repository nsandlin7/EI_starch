clear

%% Seqs	

Seqs.Name = {
    'SI-B2 Stenotrophomonas lactitubi strain M15'
    'SI-B3 Stenotrophomonas cyclobalanopsidis strain TPQG1-4'
    'SI-B4 Stenotrophomonas pavanii strain LMG 25348'
    'SI-B9 Klebsiella aerogenes strain NBRC 13534'
    'SI-B10 Klebsiella aerogenes KCTC 2190'
    'SI-C2 Enterobacter asburiae strain JCM6051'
    'SI-C3 Citrobacter cronae strain Tue2_1'
    'SI-C4 Stenotrophomonas maltophilia strain ATCC 13637 '
    'SI-C5 Pseudomonas fulva strain NBRC 16637'
    'SI-C6 Comamonas sediminis strain S3'
    'SI-C8 Pseudomonas urethralis strain BML-PP042'
    'SI-D4 Pseudomonas faucium strain BML-PP048'
    'SI-D6 Pseudoxanthomonas putridarboris strain WD12'
    'SI-E10 Acinetobacter oleivorans strain DR1'
    'SI-G9 Acinetobacter geminorum strain J00019'
    'GI-1 Pseudomonas oryzihabitans strain IAM 1568'
    'GI-5 Staphylococcus epidermidis strain Fussel'
    'GI-6 Priestia flexa strain NBRC 15715'
    'GI-9 Pseudomonas baltica strain MBT-2'
    'GI-14 Pseudomonas glycinis strain PI111'
    'GI-16 Bacillus clarus strain ATCC 21929'
    'GI-17 Bacillus aerius strain 24K'
    'GI-25 Pantoea cypripedii strain ATCC 29267'
    'GI-33 Bacillus sanguinis strain BML-BC004'
    'GI-37 Pantoea agglomerans strain DSM 3493'
    'GI-38 Rhodococcus erythropolis strain N11'
    'GI-50 Pseudomonas umsongensis strain Ps 3-10'
    'GI-51 Pseudomonas mandelii strain NBRC 103147'
    'GI-55 Bacillus xiamenensis strain MCCC 1A00008'
    'GI-56 Bacillus altitudinis 41KF2b'
    };

Seqs.genbank = {
    getgenbank('NR_179509', 'SequenceOnly',true)
    getgenbank('NR_180613', 'SequenceOnly',true)
    getgenbank('NR_118008', 'SequenceOnly',true)
    getgenbank('NR_113614', 'SequenceOnly',true)
    getgenbank('NR_102493', 'SequenceOnly',true)
    getgenbank('NR_024640', 'SequenceOnly',true)
    getgenbank('NR_170426', 'SequenceOnly',true)
    getgenbank('NR_112030', 'SequenceOnly',true)
    getgenbank('NR_113857', 'SequenceOnly',true)
    getgenbank('NR_149789', 'SequenceOnly',true)
    getgenbank('NR_181197', 'SequenceOnly',true)
    getgenbank('NR_179339', 'SequenceOnly',true)
    getgenbank('NR_157000', 'SequenceOnly',true)
    getgenbank('NR_102814', 'SequenceOnly',true)
    getgenbank('NR_181169', 'SequenceOnly',true)
    getgenbank('NR_115005', 'SequenceOnly',true)
    getgenbank('NR_036904', 'SequenceOnly',true)
    getgenbank('NR_113800', 'SequenceOnly',true)
    getgenbank('NR_181571', 'SequenceOnly',true)
    getgenbank('NR_181729', 'SequenceOnly',true)
    getgenbank('NR_180213', 'SequenceOnly',true)
    getgenbank('NR_118439', 'SequenceOnly',true)
    getgenbank('NR_118857', 'SequenceOnly',true)
    getgenbank('NR_175555', 'SequenceOnly',true)
    getgenbank('NR_041978', 'SequenceOnly',true)
    getgenbank('NR_037024', 'SequenceOnly',true)
    getgenbank('NR_025227', 'SequenceOnly',true)
    getgenbank('NR_114216', 'SequenceOnly',true)
    getgenbank('NR_148244', 'SequenceOnly',true)
    getgenbank('NR_042337', 'SequenceOnly',true)
    };

%% Make phylogenetic tree
% Read or make a multiple sequence alignment file.
% Sequences = multialignread('aagag.aln');
Sequences = multialign(Seqs.genbank);

% Calculate the distance between each pair of sequences.
distances = seqpdist(Sequences);

% Construct a phylogenetic tree object from the pairwise distances calculated previously.
tree = seqlinkage(distances,'average',Seqs.Name);

% View the phylogenetic tree.
phytreeviewer(tree)