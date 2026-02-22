# WaybackPDF

## :speech_balloon: Description

Small python tool used to recover and download archived PDF files for a given domain name. It uses the "Wayback Machine" from archive.org.
This tool is based on this <a href="https://github.com/Haax9/WaybackPDF/" target="_blank" rel="noopener">
https://github.com/Haax9/WaybackPDF</a> that was <em>"based on <a href="https://openfacto.fr/2020/04/19/recuperer-des-fichiers-pdf-en-masse-sur-archive-org/" target="_blank" rel="noopener">OpenFacto research</a> and heavily inspired by <a href="https://twitter.com/yannguegan" target="_blank" rel="noopener">@yannguegan's</a> work. His first uploaded script is not reacheable anymore and was lacking some verifications on the gathered files, causing errors. These are the two reasons I recoded the tool and uploaded it"</em>.


## :memo: Prerequisite & Install

You only need to install `requests` module as the others used are built-in.

```bash
pip3 install requests
```

Then, simply run the following to install.

```bash
git clone https://github.com/spicer1/waybackpdf-doc.git
cd waybackpdf-doc/
pip install -r requirements.txt
```

The tool was initially developped for Python3. It might contains some bugs, maybe depending on the structure of gathered data (PDF filenames etc.). 
Please don't hesitate to give a feedback if you find some.

## :book: Usage

```bash
$ python3 waybackpdf-doc.py --help

usage: waybackpdf-doc.py [-h] -d DOMAIN [-o OUTPUT] [--http HTTP] [-r RESUME]
                                                                [-t FILETYPES] [--get-file-ext] [--get-all]
                                                                [--include-html]

OSINT tool to download archived files from archive.org for a given website.

options:
  -h, --help            show this help message and exit
  -d DOMAIN, --domain DOMAIN
                        The target domain you are looking for files
  -o OUTPUT, --output OUTPUT
                        Optional output directory (Default is the domain name)
  --http HTTP           Use HTTP instead of HTTPS for the target domain. The default behavior uses HTTPS
  -r RESUME, --resume RESUME
                        Start downloading at a given index and skip X previous files
  -t FILETYPES, --filetypes FILETYPES
                        Comma-separated list of file types to download (default: pdf,doc,docx,odt)
  --get-file-ext        Generate list of all file extensions found without downloading
  --get-all             Download all files regardless of extension/type
  --include-html        Include HTML/PHP/ASP pages in download (only works with --get-all or specific extensions)
  --YYYYMMDD            Short Timestamp YYYYMMDD instead default YYYYMMDDHHMMSS in filenames

```

## :computer: Example (domain old.unipi.it)

Here are several examples of using the script with the example site `old.unipi.it` (which is a real and safe domain for testing):

### 1. **Basic Analysis - View all available extensions**
This command analyzes all files found on archive.org for old.unipi.it and shows extension statistics without downloading anything:

```bash
python3 waybackpdf-doc.py -d old.unipi.it --get-file-ext  

Expected output:
text

[+] Web Archive File Extension Analyzer
[+] Target domain : old.unipi.it

[*] Requesting files list...
[+] Fetching data from archive.org...
[+] Raw JSON saved in: old.unipi.it/filelist.raw.json
[+] Total entries found: 5842
[+] Files sorted chronologically (oldest first)

[*] Analyzing file extensions...

[+] FILE EXTENSIONS FOUND:
--------------------------------------------------
  html:           2345 files (40.1%)
  no_extension:   1243 files (21.3%)
  css:            456 files (7.8%)
  js:             389 files (6.7%)
  gif:            312 files (5.3%)
  png:            245 files (4.2%)
  pdf:            156 files (2.7%)
  xml:            98 files (1.7%)
  ...
```

### 2. Download only PDFs
```bash

python3 waybackpdf-doc.py -d old.unipi.it -t pdf

This will download all PDFs found in the archive to the old.unipi.it/ directory
```

### 3. Download documents (PDF, DOC, DOCX, ODT) to default directory
```bash
python3 waybackpdf-doc.py -d old.unipi.it -t pdf,doc,docx,odt
```

### 4. Specify a custom output directory
```bash
python3 waybackpdf-doc.py -d old.unipi.it -t pdf -o ./downloads/iana_docs
```

### 5. Download ALL files (any extension)
```bash
python3 waybackpdf-doc.py -d old.unipi.it --get-all
```

### 6. Download all files including web pages
```bash
python3 waybackpdf-doc.py -d old.unipi.it --get-all --include-html
```

### 7. Download only web pages (HTML, PHP, ASP)
```bash
python3 waybackpdf-doc.py -d old.unipi.it -t html,php,asp --include-html
```

### 8. Resume an interrupted download from file 100

If you've already downloaded the first 99 files and want to resume from the hundredth:
```bash
python3 waybackpdf-doc.py -d old.unipi.it -t pdf -r 100
```

### 9. Use HTTP instead of HTTPS for the target
```bash
python3 waybackpdf-doc.py -d old.unipi.it --http -t pdf
```

### 10. Combine options - download PDF and DOC skipping first 50 files
```bash
python3 waybackpdf-doc.py -d old.unipi.it -t pdf,doc -r 50 -o ./my_downloads
```

# Real-world Scenario Examples
## Scenario 1: Security Audit - Look for sensitive documents

### First analyze available extensions
```bash
python3 waybackpdf-doc.py -d old.unipi.it --get-file-ext
```

### Then download file types that might contain sensitive information
```bash
python3 waybackpdf-doc.py -d old.unipi.it -t pdf,doc,docx,xls,xlsx,ppt,pptx,txt
```

## Scenario 2: Complete site backup

### Download all files (requires significant time and space)
```bash
python3 waybackpdf-doc.py -d old.unipi.it --get-all -o ./backup
```

## Scenario 3: Selective image recovery
### Download only images (jpg, png, gif)
```bash
python3 waybackpdf-doc.py -d old.unipi.it -t jpg,jpeg,png,gif -o ./iana_images

```

## Scenario 4: Managed download to avoid server overload
### The 12-second delay between downloads is already built into the script
# Just run the base command
```bash
python3 waybackpdf-doc.py -d old.unipi.it -t pdf
```

# :bookmark: Important Notes

    The script automatically saves a filelist.raw.json file in the output directory with all metadata

    Files are renamed with date prefix (YYYYMMDD_filename.ext)

    In case of conflicts, progressive suffixes are added (+1, +2, etc.)

    There's a 12-second pause between downloads to avoid rate limiting

    Maximum 3 attempts per downloaded file

Example output during download:
text

[+] Web Archive File Downloader
[+] Target domain : old.unipi.it
[+] File types : pdf,doc
[+] Output directory : old.unipi.it/

[*] Requesting files list...
[+] Fetching data from archive.org...
[+] Raw JSON saved in: old.unipi.it/filelist.raw.json
[+] Total entries found: 5842
[+] Files sorted chronologically (oldest first)

[*] Downloading Files...
[+] Found 0 existing files in the output directory.
[+] Downloading 156 files...

[+] (1/156) Saved 20050328_annual-report.pdf
12 seconds pause before next download...
[+] (2/156) Saved 20050615_presentation.pdf
...
[*] Everything's done !
[*] Happy analysis !

These examples cover most common use cases of the script!
