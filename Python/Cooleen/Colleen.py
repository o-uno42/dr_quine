# comment outside
def func():
	pass

def main():
	# comment inside
	s = '# comment outside\ndef func():\n\tpass\n\ndef main():\n\t# comment inside\n\ts = %r\n\tprint(s %% s)\n\nif __name__ == "__main__":\n\tfunc()\n\tmain()'
	print(s % s)

if __name__ == "__main__":
	func()
	main()
