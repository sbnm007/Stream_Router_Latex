# Stream-Level Routing over QUIC: A WebTransport Proxy Architecture for Kubernetes

A Master's thesis exploring WebTransport-aware proxy architecture for Kubernetes environments, enabling stream-level routing of QUIC connections.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Compilation](#compilation)
- [Project Structure](#project-structure)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🔧 Prerequisites

### System Requirements
- **Operating System**: Ubuntu 18.04 LTS or later
- **LaTeX Distribution**: TeX Live (Full installation recommended)
- **Git**: For version control

### Required Packages
This thesis requires a full LaTeX installation with the following packages:
- `texlive-full` (recommended) or individual packages listed below
- `bibtex` for bibliography processing
- Standard LaTeX packages: `natbib`, `hyperref`, `graphicx`, `tikz`, etc.

## 📦 Installation

### Option 1: Full TeX Live Installation (Recommended)

```bash
# Update package list
sudo apt update

# Install full TeX Live distribution (includes all packages)
sudo apt install texlive-full

# Verify installation
pdflatex --version
bibtex --version
```

### Option 2: Minimal Installation

```bash
# Install basic TeX Live
sudo apt install texlive-latex-base texlive-latex-recommended

# Install additional required packages
sudo apt install texlive-latex-extra texlive-fonts-recommended
sudo apt install texlive-bibtex-extra biber
sudo apt install texlive-science texlive-pictures

# Install specific packages if needed
sudo apt install texlive-publishers
```

### Clone the Repository

```bash
# Clone this repository
git clone <your-repository-url>
cd Stream_Router_Latex

# Verify files are present
ls -la
```

## 🏗️ Compilation

### Quick Compilation

```bash
# Single command compilation (handles bibliography automatically)
make all
```

### Manual Compilation Steps

If you prefer manual control or don't have a Makefile:

```bash
# Step 1: Initial LaTeX compilation
pdflatex thesis.tex

# Step 2: Process bibliography
bibtex thesis

# Step 3: Second LaTeX pass (resolves citations)
pdflatex thesis.tex

# Step 4: Final LaTeX pass (resolves all cross-references)
pdflatex thesis.tex
```

### Clean Build

```bash
# Remove all auxiliary files and rebuild
make clean
make all

# Or manually:
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot
rm -f Introduction.aux StateOfTheArt.aux Design.aux Implementation.aux Evaluation.aux Conclusions.aux
pdflatex thesis.tex && bibtex thesis && pdflatex thesis.tex && pdflatex thesis.tex
```

## 📁 Project Structure

```
Stream_Router_Latex/
├── thesis.tex              # Main thesis document
├── refs.bib                 # Bibliography references
├── Introduction.tex         # Chapter 1: Introduction
├── StateOfTheArt.tex       # Chapter 2: State of the Art
├── Design.tex              # Chapter 3: Design
├── Implementation.tex      # Chapter 4: Implementation
├── Evaluation.tex          # Chapter 5: Evaluation
├── Conclusions.tex         # Chapter 6: Conclusions
├── Appendix1.tex           # Appendices
├── tcdthesis.sty          # TCD thesis style file
├── .gitignore             # Git ignore rules
├── README.md              # This file
└── thesis.pdf             # Generated PDF (after compilation)
```

## 🎯 Citation Style

This thesis uses **IEEE citation style** with square brackets `[1]`, `[2]`, etc.

- **Bibliography Style**: `ieeetr` (IEEE Transactions)
- **Citation Format**: Numerical with square brackets
- **References**: All references from `refs.bib` are included

## 🔍 Key Features

- **IEEE Citation Style**: Professional numerical citations with square brackets
- **Comprehensive Bibliography**: Includes RFCs, research papers, documentation, and repositories
- **Multiple Chapters**: Modular structure with separate files for each chapter
- **TCD Thesis Format**: Follows Trinity College Dublin thesis formatting requirements
- **Git Integration**: Version controlled with appropriate `.gitignore`

## 🐛 Troubleshooting

### Common Issues and Solutions

#### 1. Missing Package Errors
```bash
# Error: ! LaTeX Error: File `package.sty' not found
# Solution: Install the missing package
sudo apt install texlive-latex-extra
# Or for specific packages:
sudo apt search texlive | grep <package-name>
```

#### 2. Bibliography Not Appearing
```bash
# Ensure you run the complete compilation sequence:
pdflatex thesis.tex
bibtex thesis      # Note: no .tex extension for bibtex
pdflatex thesis.tex
pdflatex thesis.tex
```

#### 3. `\endcsname` Error
```bash
# Clean auxiliary files and recompile:
rm -f *.aux *.bbl *.blg *.log *.out *.toc
pdflatex thesis.tex
```

#### 4. Citations Not Working
- Verify `refs.bib` syntax is correct
- Ensure citation keys match between `.tex` files and `.bib` file
- Run `bibtex thesis` after the first `pdflatex` run

#### 5. Compilation Hangs
- Press `Ctrl+C` to stop
- Check for syntax errors in `.tex` files
- Ensure all `\begin{}` have matching `\end{}`

### Getting Help

If you encounter issues:

1. **Check the LaTeX log**: Look at `thesis.log` for detailed error messages
2. **Verify file syntax**: Ensure all LaTeX commands are properly formatted
3. **Clean build**: Remove auxiliary files and try again
4. **Check dependencies**: Ensure all required packages are installed

## 📄 Output

After successful compilation, you will find:
- **`thesis.pdf`**: The compiled thesis document (~140 pages)
- **Bibliography**: All references properly formatted in IEEE style
- **Cross-references**: All chapters, figures, and tables properly linked

## 🤝 Contributing

This is an academic thesis project. If you're using this as a template:

1. Fork the repository
2. Modify the content for your research
3. Update the bibliography with your references
4. Maintain the same compilation workflow

## 📚 References

This thesis includes comprehensive references to:
- **IETF RFCs**: QUIC (RFC 9000), HTTP/3 (RFC 9114), WebTransport
- **Research Papers**: Computer networking, distributed systems
- **Documentation**: Kubernetes, cloud platforms, networking tools
- **Repositories**: Open-source implementations and tools

## 📧 Contact

**Author**: Sibin George  
**Supervisor**: Dr. Stefan Weber  
**Institution**: Trinity College Dublin  
**Year**: 2025

---

*This thesis explores the implementation of stream-level routing for QUIC connections in Kubernetes environments, addressing the gap between modern transport protocols and cloud-native infrastructure.*