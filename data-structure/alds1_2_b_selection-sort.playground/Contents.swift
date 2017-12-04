//: Playground - noun: a place where people can play

import UIKit

func selectionSort(A: inout [Int], N: Int) -> Int {
	var swapCount = 0
	for i in 0...N-1 {
		var minj = i // 一番小さい数のインデックスを探す
		for j in i...N-1 {
			if A[j] < A[minj] {
				minj = j
			}
		}
		A.swapAt(i, minj)
		swapCount += 1
	}
	return swapCount
}

let input = """
6
5 6 4 2 1 3
"""

let lines = input.split(separator: "\n")
let N = Int(lines.first!)!
var A = lines[1].split(separator: " ").map{ Int($0)! }

let C = selectionSort(A: &A, N: N)

print(A)
print(C)
