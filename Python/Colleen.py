# comment outside
def func():
    pass

def main():
    # comment inside
    s = '# comment outside\ndef func():\n    pass\n\ndef main():\n    # comment inside\n    s = {0}{1}{0}\n    print(s.format(chr(39), s))\n\nif __name__ == "__main__":\n    func()\n    main()'
    print(s.format(chr(39), s))

if __name__ == "__main__":
    func()
    main()