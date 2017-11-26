//: Playground - noun: a place where people can play

import UIKit

class Queue {
	private var arr: [Int] = Array(repeating: -1, count: 100)
	private var head = 0
	private var tail = 0
	
	func isEmpty() -> Bool {
		return head == tail
	}
	
	func isFull() -> Bool {
		return arr.count-1 == tail
	}
	
	func enqueue(_ i: Int) {
		if isFull() {
			return
		}
		arr[tail] = i
		tail += 1
	}
	
	func dequeue() -> Int {
		if isEmpty() {
			return -1
		}
		let tmp = arr[head]
		head += 1
		return tmp
	}
}

let input = """
5 100
p1 150
p2 80
p3 200
p4 350
p5 20
"""

var lines = input.split(separator: "\n")
let quantum = Int(lines.first!.split(separator: " ")[1])!
lines.removeFirst()

print("quantum ", quantum)

let q = Queue()

for l in lines {
	let v = l.split(separator: " ")
	q.enqueue(Int(v[1])!)
}

var passed = 0
while(!q.isEmpty()) {
	var t = q.dequeue()
	
	let min = t > quantum ? quantum : t // 経過時間にquantumかプロセス時間のどちらかを加算するための値
	t -= min
	passed += min
	
	if t > 0 {
		q.enqueue(t)
	} else {
		print(passed )
	}
}

