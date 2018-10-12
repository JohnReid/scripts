#!/usr/bin/env Rscript
#
# Format each file on the command line in-place
#
styler::style_file(commandArgs(trailingOnly = TRUE))
