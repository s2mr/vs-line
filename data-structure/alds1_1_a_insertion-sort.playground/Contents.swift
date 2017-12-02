//: Playground - noun: a place where people can play

import UIKit

let input = """
6
5 2 4 6 1 3
"""

func insertionSort(A: [Int], N: Int) {
	var A = A
	print(A)
	for i in 1...N-1 {
		let v = A[i]
		var j = i - 1
		
		while j >= 0 && A[j] > v {
			A[j+1] = A[j]
			j -= 1
		}
		A[j+1] = v
		print(A)
	}
}

let lines = input.split(separator: "\n")
let N = Int(lines.first!.description)!
let A = lines[1].split(separator: " ").map { Int($0)! }
insertionSort(A: A, N: N)
