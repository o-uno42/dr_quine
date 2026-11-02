import os
i=5
dna="import os\ni=%i\ndna=%r\ndef sully():\n\tglobal i\n\ti = i - 1\n\tif i >= 0:\n\t\tfilename='Sully_%%i.py' %% i\n\t\tcontent = dna %% (i, dna)\n\t\topen(filename, 'w').write(content)\n\t\tos.system('python3 ' + filename)\nsully()"
def sully():
	global i
	i = i - 1
	if i >= 0:
		filename='Sully_%i.py' % i
		content = dna % (i, dna)
		open(filename, 'w').write(content)
		os.system('python3 ' + filename)
sully()