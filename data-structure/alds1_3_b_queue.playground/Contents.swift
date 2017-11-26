//: Playground - noun: a place where people can play

import UIKit

class Queue<T> {
	private var arr: [T] = []
	private var head = 0
	private var tail = 0
	
	init(_ t: T) {
		for _ in 1...100 {
			arr.append(t)
		}
	}
	
	func isEmpty() -> Bool {
		return head == tail
	}
	
	func isFull() -> Bool {
		return arr.count-1 == tail
	}
	
	func enqueue(_ t: T) {
		if isFull() {
			return
		}
		arr[tail] = t
		tail += 1
	}
	
	func dequeue() -> T? {
		if isEmpty() {
			return nil
		}
		let tmp = arr[head]
		head += 1
		return tmp
	}
}

struct Process {
	let name: String
	var t: Int
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

let q: Queue<Process> = Queue(Process(name: "", t: 0))

for l in lines {
	let v = l.split(separator: " ")
	q.enqueue(Process(name: v[0].description, t: Int(v[1])!))
}

var passed = 0
while(!q.isEmpty()) {
	if var p = q.dequeue() {
		let min = p.t > quantum ? quantum : p.t // 経過時間にquantumかプロセス時間のどちらかを加算するための値
		p.t -= min
		passed += min
		
		if p.t > 0 {
			q.enqueue(p)
		} else {
			print("\(p.name) \(passed)")
		}
	}
}

