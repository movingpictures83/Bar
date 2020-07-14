library(ggplot2)
library(phyloseq)
library(ape)
library(psadd)

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1]; 
   # Need to get the three files
   otu.path <- parameters["otufile", 2]
   tree.path <- parameters["tree", 2]
   map.path <- parameters["mapping", 2]
   diffcol <<- parameters["column", 2]
   HMP <<- import_qiime(otu.path, map.path, tree.path, parseFunction = parse_taxonomy_qiime)
}
run <- function() {
   samples.to.keep <<- sample_sums(HMP) >= 1000
   HMP <<- prune_samples(samples.to.keep, HMP)
   HMP <<- filter_taxa(HMP, function(x) sum(x >3) > (0.01*length(x)), TRUE)
}
output <- function(outputfile) {
  pdf(paste(outputfile,"pdf",sep="."))#,  width = 10*300,        # 5 x 300 pixels
  #height = 10*300); #,)
  y <- plot_bar(HMP, x="Description", fill=diffcol)
  #print(str(y))
  #print(str(y$data))
  write.csv(y$data, paste(outputfile,"csv",sep="."))
  print(y)#plot_bar(HMP, x="Description", fill=diffcol))
  dev.off()
}
#input("plugins/Bar/example/parameters.txt")
#run()
#output("plugins/Bar/example/yes.pdf")

