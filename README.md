# C-Language-based-Compiler
## ADITYA GARG
## 2022CSB1062

The zipped folder contains 4 files (apart from the README.txt file) namely cucu.l, cucu.y, Sample1.cu, Sample2.cu 

cucu.l & cucu.y
* cucu.l contains the regular expressions to tokenise the program. 
* cucu.y contains the BNF grammar rules to parse the syntax. 
* Open the terminal in the directory 2022CSB1062 and Enter the following commands to run the program : <
emsp 1. flex cucu.l 
2. bison -d cucu.y 
3. gcc cucu.tab.c lex.yy.c -lfl 
4. ./a.out 
* Lexer.txt will be created that will have all the tokens. 
* Parser.txt will be created that will have the parsed text. 
* If syntax is incorrect, it will print "Syntax Error" in the terminal. 


Sample1.cu
* This file contains the code which has correct synatx.
* You can change the file to be opened in the main function in cucu.y file.

Sample2.cu
* This file contains the code which has incorrect syntax.
* You can change the file to be opened in the main function in cucu.y file.
* By default Sample1.cu is opened
   
Assumptions
* Only two types of data types are valid: 
	1. int
	2. char *
