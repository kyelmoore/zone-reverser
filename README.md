# zone-reverser

Do YOU hate creating zone files? Manually creating half a dozen reverse zone files from your forward zone file giving you nightmares?

ME TOO

That's why I threw together this short script that simply takes a zone file as input, and outputs a reverse zone file using it's contents. 

I'm no shell wizard, so it's not complicated and is very limited, but I found it useful, especially because the only automation I could find at the time to assist with this problem was from like, 2002, oof.


**EXAMPLE**

Simple usage, no options, no arguments

As an example, if I had forward-zone.txt and wanted to generate the reverse zone, which I want named reverse-zone.txt, my command looks like:

./zone-reverser.sh forward-zone.txt reverse-zone.txt
