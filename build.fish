#!/usr/bin/env fish

function f_run_dry
    pdflatex -draftmode -halt-on-error main.tex
end

function f_run_bibtex
    bibtex main
end

function f_run_create
    pdflatex -halt-on-error main.tex
end

function f_open
    open ./main.pdf
end

argparse 'q/quick' -- $argv

f_run_dry
if test $status != 0
    exit $status
end
if test -z "$_flag_quick" -a -f src.bib
    f_run_bibtex
    and f_run_dry
end
f_run_create
and f_open
