# MAC-address_randomizer
Use this wonderful tool to randomly generate a new MAC-address for yourself. Useful for spoofing.

Might have dependencies im not aware of, in any case:
- Made for and on Kali Linux.
- Make sure you have the newest version of Bash.

Has 2 options:
- -h to print the help screen.
- -o to output the newly generated MAC-address to a file.
- -v option for a little bit of verbosity (needs expanding)

Comes pre-packaged with the $(macchanger -l) list of vendors inside macdonalds.txt. If you dont have a macdonalds.txt file inside your current working directory the script will fail. 

You can generate a new one with `macchanger -l > macdonalds.txt` make sure to remove the bottom section of "Wireless MACs:"!

You could in theory, replace the macdonalds.txt with your own file aslong as it adheres to the same format:

- XXXX - XX:XX:XX - [OPTIONAL STRING]
- First part should be the entry number between 0001 - 19010
- For the second part put in any MAC address you desire really, make sure it is in the correct format though (0-9, A-F, a-f are valid options)
