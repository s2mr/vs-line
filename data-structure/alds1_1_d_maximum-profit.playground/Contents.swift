//: Playground - noun: a place where people can play

import UIKit

let input = [4,3,2]

var max = Int.min
for j in 1..<input.count {
	for i in 0..<j {
		if max < input[j]-input[i] {
			max = input[j]-input[i]
		}
	}
}

print(max)
