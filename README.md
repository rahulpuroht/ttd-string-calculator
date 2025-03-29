# ttd-string-calculator
Implement string calculator using TDD

Requirements:
1. Create a simple String calculator with a method signature like this:
function add(numbers: string): number {
// implementation goes here
}

o Input: a string of comma-separated numbers
o Output: an integer, sum of the numbers
Examples:

1. Input: “”, Output: 0
2. Input: “1”, Output: 1
3. Input: “1,5”, Output: 6

2. Allow the add method to handle any amount of numbers.
3. Allow the add method to handle new lines between numbers (instead of commas).
("1\n2,3" should return 6)
4. Support different delimiters:
o To change the delimiter, the beginning of the string will contain a separate
line that looks like this: "//[delimiter]\n[numbers...]". For example, "//;\n1;2" where
the delimiter is ";" should return 3.

5. Calling add with a negative number will throw an exception: "negative numbers not
allowed <negative_number>".
o If there are multiple negative numbers, show all of them in the exception
message, separated by commas.