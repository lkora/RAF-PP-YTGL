# RAF Translation of Programming Languages - YTGL
This is a repo for a course "Programski Prevodioci" (Translation of Programming Languages), goal of this course is to teach students both theory and practice of programming language translation. Languages, grammars and parsing.


A small language **YTGL (Younger Than Google Language)** was created for the purposes of this course.

This language was high key inspired by an Instagram reel by @justin.makes.things: <https://www.instagram.com/reel/Cwn5KYtIWDm>, and lowkey snatched some stuff from [Mario, the Idea vs. Mario, the Man](https://knowyourmeme.com/memes/mario-the-idea-vs-mario-the-man). Perchance.
PS ([Good narration](https://www.youtube.com/watch?v=1ZUhJsf1yUo))

## Functionalities

### Data types

```text
types ::=
    | int                        --- integer
        Can only contain consequent digits

        Example:
        int var_name = 5;
        int bin = 110011b;
        int oct = 33124o;
        int hex = 12ABx;


    | bool                       --- boolean
        Logical true/false represented with keywords
            true - noCap / onGod
            false - cap

        Example:
        bool var_name = cap;

            
    | double                     --- double
        Defined by consequent digits separated by a period. Numbers whole part is defined by the digits before the period while its fractional part comes after.

        Example:
        double trouble = 123.543


    | char                       --- single character
        Defined by a single character/digit/symbol between single quotation marks, char value can only have the length 1.

        Example:
        char letter = 'a';


    | string                     --- charater array
        Defined as an array of characters, digits and symbols between double quotation marks.

        Example:
        string sentence = "This is a goated sentence no1!"


    | array                      --- array of values
        Defined as an array of the same type. Values are stored between open and close brackets and separated by commas.

        Example:
        int[] integer_array = [1, 3, 3, 7];
        string[] string_array = ["goat", "ded", "ong"];

        ## Methods
        fr nah girth() - Prints array length to console
```

### Operators

```text
operators ::=  
    Assignment:
    | term = op                  --- assignment

    Example:
        int a = 5 + 2;


    Arithmetical:
        Operations done on two or more integers or double precision numbers
	| term + op                  --- addition
	| term - op                  --- substraction
    | term * op                  --- multiplication
    | term / op                  --- division
    

    Relational:
        Comparison of two or more integers or double precision numbers
	| term > op                  --- greater than
	| term >= op                 --- greater or equal
	| term < op                  --- smaller than
	| term <= op                 --- smaller or equal
	| term == op                 --- equality 
    | term != op                 --- non equality


    Logical:
        Correctness comparison between two or more statements
    | term && op                 --- logical 'AND'
    | term || op                 --- logical 'OR'
    | term ! op                  --- logical 'NOT'
```

### Statements
```text
stmt ::=  
    | `iykyk` expr `finna` stmt `slay`      --- `if` statement equivalent
    | `jkUnless` expr `finna` stmt `slay`   --- `else if` statement equivalent
    | `perchance` `finna` stmt `slay`       --- `else` statement equivalent
    
    Example:
    bool depression = onGod;
    iykyk vibe finna
		spillTea onGod;
	slay perchance finna 
		spillTea cap;
	slay


	| `fr` type ident `(` params `)` `finna` stmt `slay`    --- declaration of a function
        Functions can return a value of a defined type with `itsGiving {value}` expression, or they can return NULL if the function type is set to `nah` by writing `ghosted`.

    Example:
    fr bool vibeCheck(bool vibe) finna
        iykyk vibe finna
            itsGiving onGod;
        slay perchance finna 
            itsGiving cap;
        slay
    slay
    
    bool depression = onGod;
    bool vibe = vibeCheck(depression);

	| `finna` stmts `slay`                      --- a list of statements
	| `tea` ident                               --- print a value to the command line
    | type ident `snatch`                       --- read value into a specified variable from the command line
	| `while` expr `finna` stmt                 --- while-do statement
    | `chill` `finna` stmt `slay` `while` expr  --- do-while statement

    | `skrt`                                    --- break
    | `letHimCook`                              --- continue
```

## Examples

### Declarations

#### Declare an integer: 
```text
int dec = 7;
int bin = 110011b;
int oct = 33124o;
int hex = 12ABx;
```

#### Declare a boolean:
```text
bool truth = noCap;
```

#### Declare a double:
```text
double pi = 3.14159;
```

#### Declare a character:
```text
char letter = 'a';
```

#### Declare a string:
```text
string sentence = "This is a goated sentence no1!";
```

#### Declare an array:
```text
int[] numbers = [1, 2, 3, 4, 5];
```

### Operations

#### Use of arithmetic operators:
```text
int sum = 5 + 3;
double product = 4.5 * 2.0;
```

#### Use of relational operators:
```text
bool isGreater = 5 > 3;
bool isEqual = 4 == 4;
```

#### Use of logical operators:
```text
bool result = (5 > 3) && (4 == 4);
```

### Statements

#### Use of if-else statement:
```text
bool vibe = onGod;
iykyk vibe finna
    tea "Vibe is good!";
slay perchance finna 
    tea "Vibe is not good!";
slay
```

#### Use of a function:
```text
fr bool vibeCheck(bool vibe) finna
    iykyk vibe finna
        itsGiving onGod;
    slay perchance finna 
        itsGiving cap;
    slay
slay

bool depression = onGod;
bool vibe = vibeCheck(depression);
```

#### Use of a list of statements:
```text
finna
    int number = 5;
    double pi = 3.14159;
    bool truth = noCap;
slay
```

#### Print a value to the command line:
```text
int number = 7;
tea number;
```

#### Read value into a specified variable from the command line:
```text
int number snatch;
```

#### Use of while-do statement:
```text
int number = 0;
while number < 10 finna
    number = number + 1;
slay
```

#### Use of do-while statement:
```text
int number = 0;
chill finna
    number = number + 1;
slay while number < 10;
```

### Test programs

#### Calculate the Fibonacci number for an inputted number:
```text
fr int fibonacci(int n) finna
    iykyk n <= 1 finna
        itsGiving n;
    slay perchance finna 
        itsGiving fibonacci(n - 1) + fibonacci(n - 2);
    slay
slay

int number snatch;
int result = fibonacci(number);
tea result;
```

#### Multiplies two numbers without using the multiplication operator:
```text
fr int multiply(int a, int b) finna
    int result = 0;
    int i = 0;
    bool isNegative = cap;
    iykyk b < 0 finna
        isNegative = onGod;
        b = -b;
    slay
    while i < b finna
        result = result + a;
        i = i + 1;
    slay
    iykyk isNegative finna
        result = -result;
    slay
    itsGiving result;
slay

int a = 5;
int b = 3;
int product = multiply(a, b);
tea product;
```

#### Prints a square of size n with ‘+’ for the borders and ‘-’ for the rest:
```text
fr nah printSquare(int size) finna
    int i = 0;
    int j = 0;
    while i < size finna
        j = 0;
        
        iykyk i == 0 || i == size - 1 finna
            while j < size finna
                tea "+";
                j = j + 1;
            slay
            
        slay perchance finna
            while j < size finna
                iykyk j == 0 || j == size - 1 finna
                    tea "+";
                slay perchance finna
                    tea "-";
                slay
                j = j + 1;
            slay
        slay

        tea "\n";
    slay
slay

int size = 5;
printSquare(size);
```
