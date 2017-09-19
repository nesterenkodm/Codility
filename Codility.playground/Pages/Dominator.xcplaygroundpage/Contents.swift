/*:
 # Dominator
 
 ## Find an index of an array such that its value occurs at more than half of indices in the array.

 A zero-indexed array A consisting of N integers is given. The dominator of array A is the value that occurs in more than half of the elements of A.
 
 For example, consider array A such that
 ```
 A[0] = 3    A[1] = 4    A[2] =  3
 A[3] = 2    A[4] = 3    A[5] = -1
 A[6] = 3    A[7] = 3
 ```
 The dominator of A is 3 because it occurs in 5 out of 8 elements of A (namely in those with indices 0, 2, 4, 6 and 7) and 5 is more than a half of 8.
 
 Write a function
 ```
 public func solution(_ A : inout [Int]) -> Int
 ```
 that, given a zero-indexed array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.
 
 Assume that:
 
 - N is an integer within the range [0..100,000];
 - each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
 
 For example, given array A such that
 ```
 A[0] = 3    A[1] = 4    A[2] =  3
 A[3] = 2    A[4] = 3    A[5] = -1
 A[6] = 3    A[7] = 3
 ```
 the function may return 0, 2, 4, 6 or 7, as explained above.
 
 Complexity:
 
 - expected worst-case time complexity is O(N);
 - expected worst-case space complexity is O(1), beyond input storage (not counting the storage required for input arguments).
 
 Elements of input arrays can be modified.
 */
public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 1 else { return 0 }
    
    var leader = 0
    var size = 0
    
    for i in 0..<A.count {
        if size == 0 {
            leader = A[i]
            size += 1
        } else {
            if leader == A[i] {
                size += 1
            } else {
                size -= 1
            }
        }
    }

    guard size > 0 else { return -1 }
    
    var counter = 0
    for i in 0..<A.count {
        counter += (A[i] == leader ? 1 : 0)
    }
    
    guard counter > A.count / 2 else { return -1 }
    
    return A.index(of: leader)!
}

var a = [3, 4, 3, 2, 3, -1, 3, 3]
assert(solution(&a) == 0)
