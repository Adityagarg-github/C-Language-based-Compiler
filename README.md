# C-Language-based-Compiler
ADITYA GARG
2022CSB1062

The zipped folder contains 4 files (apart from the README.txt file) namely cucu.l, cucu.y, Sample1.cu, Sample2.cu 

cucu.l & cucu.y
> cucu.l contains the regular expressions to tokenise the program. <br/>
> cucu.y contains the BNF grammar rules to parse the syntax. <br/>
> Open the terminal in the directory 2022CSB1062 and Enter the following commands to run the program : <br/>
        1. flex cucu.l <br/>
        2. bison -d cucu.y <br/>
        3. gcc cucu.tab.c lex.yy.c -lfl <br/>
        4. ./a.out <br/>
> Lexer.txt will be created that will have all the tokens. <br/>
> Parser.txt will be created that will have the parsed text. <br/>
> If syntax is incorrect, it will print "Syntax Error" in the terminal. <br/>


Sample1.cu<br/>

> This file contains the code which has correct synatx.<br/>
> You can change the file to be opened in the main function in cucu.y file.<br/>

Sample2.cu
> This file contains the code which has incorrect syntax.
> You can change the file to be opened in the main function in cucu.y file.

> By default Sample1.cu is opened
   
Assumptions
> Only two types of data types are valid: 
	1. int
	2. char *
