#!/usr/bin/env fish

function f_run_dry
    pdflatex -draftmode -halt-on-error master.tex
end

function f_run_bibtex
    bibtex master
end

function f_run_create
    pdflatex -halt-on-error master.tex
end

function f_open
    open ./master.pdf
end

argparse 'q/quick' -- $argv

if test -z "$_flag_quick" -a -f src.bib
    f_run_dry
    f_run_bibtex
end
f_run_dry
f_run_create
f_open
