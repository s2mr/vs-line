//: Playground - noun: a place where people can play

import UIKit
import XCTest


func bubbleSort(A: inout [Int], N: Int) -> Int {
	var flag = true
	var i = 0 // 未ソート部分の開始位置（走査する範囲はどんどん狭まっていく）
	var swapCount = 0
	while flag {
		flag = false
		
		var j = N-1
		while j>i {
			if A[j] < A[j-1] {
				A.swapAt(j, j-1)
				flag = true
				swapCount += 1
			}
			j -= 1
		}
		i += 1
	}
	
	return swapCount
}

let input = """
5
5 3 2 4 1
"""

let start = Date()

let lines = input.split(separator: "\n")
let N = Int(lines.first!)!
var A = lines[1].split(separator: " ").map{ Int(String($0))! }

let C = bubbleSort(A: &A, N: N)

for i in 0..<A.count-1 {
	print(A[i], terminator: " ")
}
print(A.last!)
print(C)

let elapsed = Date().timeIntervalSince(start)
print(elapsed)

// 0.00886297225952148
// 0.00757294893264771 （iを利用して)


