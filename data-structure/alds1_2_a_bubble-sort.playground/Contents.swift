//: Playground - noun: a place where people can play

import UIKit

func bubbleSort(A: inout [Int], N: Int) -> Int {
	var flag = true
	var swapCount = 0
	while flag {
		flag = false
		
		var j = N-1
		while j>0 {
			if A[j] < A[j-1] {
				A.swapAt(j, j-1)
				flag = true
				swapCount += 1
			}
			j -= 1
		}
	}
	return swapCount
}

let input = """
5
5 3 2 4 1
"""

let lines = input.split(separator: "\n")
let N = Int(lines.first!)!
var A = lines[1].split(separator: " ").map{ Int(String($0))! }

let C = bubbleSort(A: &A, N: N)

for i in 0..<A.count-1 {
	print(A[i], terminator: " ")
}
print(A.last!)
print(C)

