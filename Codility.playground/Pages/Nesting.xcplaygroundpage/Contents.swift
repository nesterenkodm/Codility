/*:
 # Nesting
 
 ## Determine whether given string of parentheses is properly nested.
 
 A string S consisting of N characters is called properly nested if:
 
 - S is empty;
 - S has the form "(U)" where U is a properly nested string;
 - S has the form "VW" where V and W are properly nested strings.
 
For example, string "(()(())())" is properly nested but string "())" isn't.
 
 Write a function:
 ```
 public func solution(_ S : inout String) -> Int
 ```
 that, given a string S consisting of N characters, returns 1 if string S is properly nested and 0 otherwise.
 
 For example, given S = "(()(())())", the function should return 1 and given S = "())", the function should return 0, as explained above.
 
 Assume that:
 
 - N is an integer within the range [0..1,000,000];
 - string S consists only of the characters "(" and/or ")".
 
 Complexity:
 
 - expected worst-case time complexity is O(N);
 - expected worst-case space complexity is O(1) (not counting the storage required for input arguments).
 */
public func solution(_ S : inout String) -> Int {
    var counter = 0
    for character in S {
        if counter == 0, character == ")" {
            return 0
        }
        if character == "(" {
            counter += 1
        } else {
            counter -= 1
        }
    }
    return counter == 0 ? 1 : 0
}

var s1 = "(()(())())"
assert(solution(&s1) == 1)

var s2 = "())"
assert(solution(&s2) == 0)
