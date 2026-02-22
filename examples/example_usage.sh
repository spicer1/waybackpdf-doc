#!/bin/bash

# Wayback Machine Downloader - Esempi di utilizzo
# Colori per output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== WAYBACK MACHINE DOWNLOADER - ESEMPI ===${NC}\n"

# Esempio 1: Analisi base
echo -e "${GREEN}Esempio 1: Analisi estensioni (senza download)${NC}"
echo "python3 waybackpdf-doc.py -d example.com --get-file-ext"
echo ""

# Esempio 2: Download PDF
echo -e "${GREEN}Esempio 2: Download solo PDF${NC}"
echo "python3 waybackpdf-doc.py -d example.com -t pdf"
echo ""

# Esempio 3: Download documenti con output personalizzato
echo -e "${GREEN}Esempio 3: Download documenti in directory specifica${NC}"
echo "python3 waybackpdf-doc.py -d example.com -t pdf,doc,docx -o ./downloads"
echo ""

# Esempio 4: Download con timestamp breve
echo -e "${GREEN}Esempio 4: Download con timestamp breve (YYYYMMDD)${NC}"
echo "python3 waybackpdf-doc.py -d example.com -t pdf --YYYYMMDD"
echo ""

# Esempio 5: Riprendere download interrotto
echo -e "${GREEN}Esempio 5: Riprendi download dal file 100${NC}"
echo "python3 waybackpdf-doc.py -d example.com -t pdf -r 100"
echo ""

# Esempio 6: Download completo
echo -e "${GREEN}Esempio 6: Download di tutti i file${NC}"
echo "python3 waybackpdf-doc.py -d example.com --get-all"
echo ""

echo -e "${BLUE}Per eseguire uno degli esempi, copia e incolla il comando desiderato.${NC}"
