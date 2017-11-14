/*:
 [Previous](CountDiv)
 
 # MinAvgTwoSlice
 
 ## Find the minimal average of any slice containing at least two elements.
 
 A non-empty zero-indexed array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P < Q < N, is called a slice of array A (notice that the slice contains at least two elements). The average of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice. To be precise, the average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1).
 
 For example, array A such that:
 ```
 A[0] = 4
 A[1] = 2
 A[2] = 2
 A[3] = 5
 A[4] = 1
 A[5] = 5
 A[6] = 8
 ```
 contains the following example slices:
 
 - slice (1, 2), whose average is (2 + 2) / 2 = 2;
 - slice (3, 4), whose average is (5 + 1) / 2 = 3;
 - slice (1, 4), whose average is (2 + 2 + 5 + 1) / 4 = 2.5.
 
 The goal is to find the starting position of a slice whose average is minimal.
 
 Write a function:
 ```swift
 public func solution(_ A : inout [Int]) -> Int
 ```
 that, given a non-empty zero-indexed array A consisting of N integers, returns the starting position of the slice with the minimal average. If there is more than one slice with a minimal average, you should return the smallest starting position of such a slice.
 
 For example, given array A such that:
 ```
 A[0] = 4
 A[1] = 2
 A[2] = 2
 A[3] = 5
 A[4] = 1
 A[5] = 5
 A[6] = 8
 ```
 the function should return 1, as explained above.
 
 Assume that:
 
 - N is an integer within the range [2..100,000];
 - each element of array A is an integer within the range [−10,000..10,000].
 
 Complexity:
 
 - expected worst-case time complexity is O(N);
 - expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 
 Elements of input arrays can be modified.
 */
public func solution(_ A : inout [Int]) -> Int {
    var sums = Array(repeating: 0, count: A.count)
    var index = 0
    var min = Double.greatestFiniteMagnitude
    
    for i in 0..<sums.count {
        let sum = i - 1 < 0 ? 0 : sums[i - 1]
        let sum2 = i - 2 < 0 ? 0 : sums[i - 2]
        let sum3 = i - 3 < 0 ? 0 : sums[i - 3]
        
        sums[i] = sum + A[i]

        if i > 0 {
            let avg = Double(sums[i] - sum2) / 2
            if avg < min {
                index = i - 1
                min = avg
            }
        }
        
        if i > 1 {
            let avg = Double(sums[i] - sum3) / 3
            if avg < min {
                index = i - 1
                min = avg
            }
        }
    }
    return index
}

var a = [4, 2, 2, 5, 1, 5, 8]
solution(&a) == 1

var b = [-10, 3, 4, -20]
solution(&b) == 0

var c = [1 ,2 ,1 ,0 ,0 ,1]
solution(&c) == 3
