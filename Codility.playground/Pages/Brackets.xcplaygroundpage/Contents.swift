/*:
 # Brackets
 
 ## Determine whether a given string of parentheses is properly nested.
 
 A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:
 
 - S is empty;
 - S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
 - S has the form "VW" where V and W are properly nested strings.
 - For example, the string "{[()()]}" is properly nested but "([)()]" is not.
 
 Write a function:
 ```
 public func solution(_ S : inout String) -> Int
 ```
 that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.
 
 For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.
 
 Assume that:
 
 - N is an integer within the range [0..200,000];
 - string S consists only of the following characters: "(", "{", "[", "]", "}" and/or ")".
 
 Complexity:
 
 - expected worst-case time complexity is O(N);
 - expected worst-case space complexity is O(N) (not counting the storage required for input arguments).
 */
public func solution(_ S : inout String) -> Int {
    guard S.count > 0 else { return 1 }
    
    var stack = [Character]()
    for character in S {
        guard let last = stack.last else {
            if "{[(".contains(character) {
                stack.append(character)
                continue
            } else {
                return 0
            }
        }
        
        if last == "{", (character == "]" || character == ")") {
            return 0
        }
        if last == "[", (character == ")" || character == "}") {
            return 0
        }
        if last == "(", (character == "]" || character == "}") {
            return 0
        }
        
        if "({[".contains(character) {
            stack.append(character)
        } else {
            stack.popLast()
        }
    }
    return 1
}

var s1 = "{[()()]}"
assert(solution(&s1) == 1)

var s2 = "([)()]"
assert(solution(&s2) == 0)
