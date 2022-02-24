# MAC-address_randomizer
Use this wonderful tool to randomly generate a new MAC-address for yourself. Useful for spoofing.

Might have dependencies im not aware of, in any case:
- Made for and on Kali Linux.
- Make sure you have the newest version of Bash.

Has 2 options:
- -h to print the help screen.
- -o to output the newly generated MAC-address to a file.

Comes pre-packaged with the $(arp-scan -l) list of vendors inside macdonalds.txt. If you dont have a macdonalds.txt file inside your current working directory the script will fail. 

You can generate a new one with `arp-scan -l > macdonalds.txt` make sure to remove the bottom column of wireless vendors!

You could also in theory, replace the macdonalds.txt with your own file aslong as it adheres to the same format.
