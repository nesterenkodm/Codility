/*:
 # PermCheck
 
 ## Check whether array A is a permutation.
 
 A non-empty zero-indexed array A consisting of N integers is given.
 
 A permutation is a sequence containing each element from 1 to N once, and only once.
 
 For example, array A such that:
 ```
 A[0] = 4
 A[1] = 1
 A[2] = 3
 A[3] = 2
 ```
 is a permutation, but array A such that:
 ```
 A[0] = 4
 A[1] = 1
 A[2] = 3
 ```
 is not a permutation, because value 2 is missing.
 
 The goal is to check whether array A is a permutation.
 
 Write a function:
 ```swift
 public func solution(_ A : inout [Int]) -> Int
 ```
 that, given a zero-indexed array A, returns 1 if array A is a permutation and 0 if it is not.
 
 For example, given array A such that:
 ```
 A[0] = 4
 A[1] = 1
 A[2] = 3
 A[3] = 2
 ```
 the function should return 1.
 
 Given array A such that:
 ```
 A[0] = 4
 A[1] = 1
 A[2] = 3
 ```
 the function should return 0.
 
 Assume that:
 
 - N is an integer within the range [1..100,000];
 - each element of array A is an integer within the range [1..1,000,000,000].
 
 Complexity:
 
 - expected worst-case time complexity is O(N);
 - expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 
 Elements of input arrays can be modified.
 */
public func solution(_ A : inout [Int]) -> Int {
    var min = Int.max
    var counter = [Int: Bool]()
    for i in A {
        counter[i] = true
        min = Swift.min(min, i)
    }

    var i = min
    while i < min + A.count {
        if counter[i] == nil {
            return 0
        }
        i += 1
    }
    return 1
}

var a = [4, 1, 3, 2]
assert(solution(&a) == 1)

var b = [4, 1, 3]
assert(solution(&b) == 0)

var c = [8, 10, 9, 7]
assert(solution(&c) == 1)

var d = [8, 10, 9, 7, 5]
assert(solution(&d) == 0)
