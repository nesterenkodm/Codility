/*:
 # MissingInteger
 
 ## Find the smallest positive integer that does not occur in a given sequence.
 
 This is a demo task.
 
 Write a function:
 ```swift
 public func solution(_ A : inout [Int]) -> Int
 ```
 that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
 
 For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
 
 For another example, given A = [1, 2, 3], the function should return 4.
 
 Given A = [−1, −3], the function should return 1.
 
 Assume that:
 
 - N is an integer within the range [1..100,000];
 - each element of array A is an integer within the range [−1,000,000..1,000,000].
 
 Complexity:
 
 - expected worst-case time complexity is O(N);
 - expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 
 Elements of input arrays can be modified.
 */
public func solution(_ A : inout [Int]) -> Int {
    var counter = [Int: Bool]()
    for i in A {
        counter[i] = true
    }

    var i = 1
    while true {
        if counter[i] == nil {
            return i
        } else {
            i += 1
        }
    }
}

var a = [1, 3, 6, 4, 1, 2]
assert(solution(&a) == 5)

var b = [1, 2, 3]
assert(solution(&b) == 4)

var c = [-1, -3]
assert(solution(&c) == 1)
