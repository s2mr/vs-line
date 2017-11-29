//: Playground - noun: a place where people can play

import UIKit

class Stack {
	private var arr: [Int] = []
	
	func push(_ i: Int) {
		arr.append(i)
	}
	
	func pop() -> Int? {
		let tmp = arr.last
		arr.removeLast()
		return tmp
	}
}

var str = "1 3 * 4 +"

let stack = Stack()

var arr = str.split(separator: " ")
for v in arr {
	if v>="0" && v<="9" {
		stack.push(Int(v)!)
		continue
	}
	let n1 = stack.pop()
	let n2 = stack.pop()
	if n1 == nil || n2 == nil {
		print("error")
		break
	}
	var res : Int!
	switch String(v) {
	case "+":
		res = n2! + n1!
	case "-":
		res = n2! - n1!
	case "*":
		res = n2! * n1!
	case "/":
		res = n2! / n1!
	default:
		break
	}
	stack.push(res)
}

print(stack.pop()!)

