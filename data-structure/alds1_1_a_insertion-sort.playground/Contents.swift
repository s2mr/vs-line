//: Playground - noun: a place where people can play
// 挿入ソート

import UIKit

let input = """
6
5 2 4 6 1 3
"""

func insertionSort(A: [Int], N: Int) {
	var A = A
	print(A)
	for i in 1...N-1 {
		let v = A[i] // 1. 未ソート部分の先頭を取り出しｖに記録
		var j = i - 1
		
		while j >= 0 && A[j] > v { // ソート済み部分よりも取り出したものvが小さい場合
			A[j+1] = A[j] // ソート済み部分をひとつずつずらす
			j -= 1
		}
		A[j+1] = v // 挿入
	}
}

let lines = input.split(separator: "\n")
let N = Int(lines.first!.description)!
let A = lines[1].split(separator: " ").map { Int($0)! }
insertionSort(A: A, N: N)
