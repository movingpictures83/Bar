# Bar
# Language: R
# Input: TXT
# Output: PREFIX
# Tested with: PluMA 1.1, R 4.0.0
# Dependencies: phyloseq 1.32.0, ape 5.4, psadd 0.1.2, ggplot2 3.3.1

PluMA plugin that takes generates a bar graph of OTU abundances per sample (can be absolute or relative).

The following are specified in the input TXT file, as tab-delimited keyword-value pairs:

otufile: OTU abundances (BIOM)
mapping: Mapping table (TXT)
tree: Phylogenetic tree (TRE)
column: (STRING)

The bar graph will then be generated using the provided prefix (prefix.pdf), with a supplemental prefix.csv file containing properties of the graph.

