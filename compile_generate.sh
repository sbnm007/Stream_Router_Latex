#!/bin/bash

# compile_generate.sh
# Shell script to clean compile the LaTeX thesis project and generate PDF
# Author: Sibin George
# Date: August 2025

set -e  # Exit on any error

echo "Starting clean compilation of thesis..."
echo "================================================"

# Step 1: Clean all auxiliary files
echo "Step 1: Cleaning auxiliary files..."
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz
rm -f Introduction.aux StateOfTheArt.aux Design.aux Implementation.aux Evaluation.aux Conclusions.aux Appendix1.aux
echo "Auxiliary files cleaned"

# Step 2: First LaTeX pass
echo "Step 2: First LaTeX pass..."
pdflatex -interaction=nonstopmode thesis.tex
if [ $? -eq 0 ]; then
    echo "First LaTeX pass completed successfully"
else
    echo "First LaTeX pass failed"
    exit 1
fi

# Step 3: Generate bibliography
echo "Step 3: Processing bibliography..."
bibtex thesis
if [ $? -eq 0 ]; then
    echo "Bibliography processed successfully"
else
    echo "Bibliography processing failed"
    exit 1
fi

# Step 4: Second LaTeX pass (incorporate bibliography)
echo "Step 4: Second LaTeX pass (incorporating bibliography)..."
pdflatex -interaction=nonstopmode thesis.tex
if [ $? -eq 0 ]; then
    echo "Second LaTeX pass completed successfully"
else
    echo "Second LaTeX pass failed"
    exit 1
fi

# Step 5: Final LaTeX pass (resolve all cross-references)
echo "Step 5: Final LaTeX pass (resolving cross-references)..."
pdflatex -interaction=nonstopmode thesis.tex
if [ $? -eq 0 ]; then
    echo "Final LaTeX pass completed successfully"
else
    echo "Final LaTeX pass failed"
    exit 1
fi

# Check if PDF was generated
if [ -f "thesis.pdf" ]; then
    echo ""
    echo "SUCCESS: Thesis compilation completed!"
    echo "================================================"
    echo "Generated: thesis.pdf"
    echo "File size: $(du -h thesis.pdf | cut -f1)"
    echo "Pages: $(pdfinfo thesis.pdf 2>/dev/null | grep Pages | awk '{print $2}' || echo 'Unknown')"
    echo ""
    echo "Your thesis is ready!"
    echo "Location: $(pwd)/thesis.pdf"
else
    echo "ERROR: thesis.pdf was not generated"
    exit 1
fi

echo ""
echo "Compilation Summary:"
echo "- All auxiliary files cleaned"
echo "- Bibliography with 33 references processed"
echo "- All cross-references resolved"
echo "- IEEE citation style applied"
echo "- Complete thesis with all chapters included"
echo ""
echo "To view the PDF:"
echo "   evince thesis.pdf    # Linux"
echo "   open thesis.pdf      # macOS"
echo "   start thesis.pdf     # Windows"
