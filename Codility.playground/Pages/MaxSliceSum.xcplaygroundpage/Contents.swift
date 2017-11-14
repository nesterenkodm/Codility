/*:
 [Previous](MaxProfit)
 
 # MaxSliceSum
 
 ## Find a maximum sum of a compact subsequence of array elements.
 
 A non-empty zero-indexed array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P ≤ Q < N, is called a slice of array A. The sum of a slice (P, Q) is the total of A[P] + A[P+1] + ... + A[Q].
 
 Write a function:
 ```
 public func solution(_ A : inout [Int]) -> Int
 ```
 that, given an array A consisting of N integers, returns the maximum sum of any slice of A.
 
 For example, given array A such that:
 ```
 A[0] = 3  A[1] = 2  A[2] = -6
 A[3] = 4  A[4] = 0
 ```
 the function should return 5 because:
 
 - (3, 4) is a slice of A that has sum 4,
 - (2, 2) is a slice of A that has sum −6,
 - (0, 1) is a slice of A that has sum 5,
 - no other slice of A has sum greater than (0, 1).
 
 Assume that:
 
 - N is an integer within the range [1..1,000,000];
 - each element of array A is an integer within the range [−1,000,000..1,000,000];
 - the result will be an integer within the range [−2,147,483,648..2,147,483,647].
 
 Complexity:
 
 - expected worst-case time complexity is O(N);
 - expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 
 Elements of input arrays can be modified.
 */
public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 1 else { return 0 }
    
    var sum = 0
    var slice = 0
    
    for (index, a) in A.enumerated() {
        if sum + a > 0 {
            if index + 1 < A.count {
                sum = max(0, sum) + a
            } else {
                sum = sum + a
            }
            slice = max(sum, slice)
        } else {
            sum = a
        }
    }
    return slice
}

var a = [3, 2, -6, 4, 0]
assert(solution(&a) == 5)

var a1 = [-1, 3, 2, -6, 4, 0]
assert(solution(&a1) == 5)

var a2 = [3, 2, -6, 4, 0, -1, -3, 20]
solution(&a2)
assert(solution(&a2) == 17)

var a3 = [3, 2, -6, 4, 0, 10, -4, 20]
solution(&a3)
assert(solution(&a3) == 30)
