
import glob
import os

svg_figures = glob.glob( '*.svg')
png_figures = [ 'png/' + os.path.basename(f).replace('.svg','.png')  for f in svg_figures]
pdf_figures = [ 'pdf/' + os.path.basename(f).replace('.svg','.pdf')  for f in svg_figures]


rule all:
    input:
        png_figures,
        pdf_figures


#Copies the png to the png folder
rule png:
    output:
        "{ext}/{name}.{ext}"
    input:
        "{name}.svg"
    shell:
        "inkscape {input} --export-{wildcards.ext}={output} -w 2000 --export-background-opacity=0.0"






