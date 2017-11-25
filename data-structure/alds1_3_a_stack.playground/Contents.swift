//: Playground - noun: a place where people can play

import UIKit

class Stack {
	private var top = 0
	private var stack:[String] = Array(repeating: "", count: 100)
	
	func push(_ e: String) {
		top += 1
		stack[top] = e
	}
	
	func pop() -> String {
		let tmp = stack[top]
		top -= 1
		return tmp
	}
	
	func isEmpty() -> Bool {
		return top == 0
	}
	
	func isFull() -> Bool {
		return top >= stack.count-1
	}
}

let input = "1 2 +  3 4 - *"

let stack = Stack()

let arr = input.split(separator: " ")
for e in arr {
	let s = String(e)
	if e>="0" && e<="9" {
		stack.push(s)
		continue
	}
	
	let n1 = Int(stack.pop())!
	let n2 = Int(stack.pop())!
	
	switch s {
	case "+":
		stack.push("\(n2 + n1)")
	case "-":
		stack.push("\(n2 - n1)")
	case "*":
		stack.push("\(n2 * n1)")
	default:
		break
	}
}

print(stack.pop())
