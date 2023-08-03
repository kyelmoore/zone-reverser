# zone-reverser

Do YOU hate creating zone files? Manually creating half a dozen reverse zone files from your forward zone file giving you nightmares?

ME TOO

That's why I threw together this short script that simply takes a zone file as input, and outputs a reverse zone file using it's contents. 

I'm no shell wizard, so it's not complicated and is very limited, but I found it useful, especially because the only automation I could find at the time to assist with this problem was from like, 2002, oof.


**EXAMPLE**

Simple usage, no options, no arguments

./zone_reverser.sh \<input-zone-file\> \<output-reverse-zone-file\>
