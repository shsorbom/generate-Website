# generate-Website
A series of Bash scripts to assist in the creation of a static website
## Example usage:
`./generate-page.sh -t example.tmp -f index.html -n Home`
- `-t` is for template file
- `-f` is for the filename of the new page
- `-n` is for the name of the new page as it appears in the navigation links

At present, only adding pages to the end of the navbar is supported.
Also be warned that there is virtually no error detection right now.
