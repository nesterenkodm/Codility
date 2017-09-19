/*:
 # EquiLeader
 
 ## Find the index S such that the leaders of the sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N - 1] are the same.

 A non-empty zero-indexed array A consisting of N integers is given.
 
 The leader of this array is the value that occurs in more than half of the elements of A.
 
 An equi leader is an index S such that 0 ≤ S < N − 1 and two sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N − 1] have leaders of the same value.
 
 For example, given array A such that:
 ```
 A[0] = 4
 A[1] = 3
 A[2] = 4
 A[3] = 4
 A[4] = 4
 A[5] = 2
 ```
 we can find two equi leaders:
 
 - 0, because sequences: (4) and (3, 4, 4, 4, 2) have the same leader, whose value is 4.
 - 2, because sequences: (4, 3, 4) and (4, 4, 2) have the same leader, whose value is 4.
 
 The goal is to count the number of equi leaders.
 
 Write a function:
 ```
 public func solution(_ A : inout [Int]) -> Int
 ```
 that, given a non-empty zero-indexed array A consisting of N integers, returns the number of equi leaders.
 
 For example, given:
 ```
 A[0] = 4
 A[1] = 3
 A[2] = 4
 A[3] = 4
 A[4] = 4
 A[5] = 2
 ```
 the function should return 2, as explained above.
 
 Assume that:
 
 - N is an integer within the range [1..100,000];
 - each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].
 
 Complexity:
 
 - expected worst-case time complexity is O(N);
 - expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 
 Elements of input arrays can be modified.
 */
public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 0 else { return 0 }
    
    var left = [Int]()
    var right = [Int]()
    var leaders = Array<(Int?, Int?)>(repeating: (nil, nil), count: A.count - 1)
    
    for i in 0..<A.count - 1 {
        left.append(A[i])
        if left.count > 1, left[left.count - 1] != left[left.count - 2] {
            left.popLast()
            left.popLast()
        }
        right.append(A[A.count - i - 1])
        if right.count > 1, right[right.count - 1] != right[right.count - 2] {
            right.popLast()
            right.popLast()
        }
        
        leaders[i].0 = left.last
        leaders[A.count - i - 2].1 = right.last
    }
    
    return leaders.reduce(0) {
        guard let left = $1.0, let right = $1.1 else { return $0 }
        return $0 + (left == right ? 1 : 0)
    }
}

var a = [4, 3, 4, 4, 4, 2]
assert(solution(&a) == 2)
