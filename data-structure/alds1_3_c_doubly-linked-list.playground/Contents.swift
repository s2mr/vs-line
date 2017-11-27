//: Playground - noun: a place where people can play

import UIKit

class Node {
	let key: Int
	var prev: Node?
	var next: Node?
	
	init(key: Int, prev: Node?, next: Node?) {
		self.key = key
		self.prev = prev
		self.next = next
	}
}

let null = Node(key: -1, prev: nil, next: nil)
null.prev = null
null.next = null

enum Command: String {
	case insert = "insert"
	case delete = "delete"
}

func insert(_ i: Int) {
	let n = Node(key: i, prev: nil, next: nil)
	n.next = null.next // 最後尾のものだけnullを指す
	null.next?.prev = n
	null.next = n
	n.prev = null
}

func search(_ i: Int) -> Node? {
	var n = null
	while n.next != nil {
		if n.next!.key == i {
			return n.next!
		}
		n = n.next!
	}
	return nil
}

func delete(_ n: Node) {
	n.prev?.next = n.next
	n.next?.prev = n.prev
	n.next = nil
	n.prev = nil
}

func printN() {
	var node: Node? = null
	while node?.next != nil {
		if node!.next === null {
			return
		}
		print(node?.next?.key ?? "" , terminator: " ")
		node = node?.next
	}
}

let input = """
insert 5
insert 2
insert 3
insert 1
delete 3
insert 6
delete 5
"""

let lines = input.split(separator: "\n")
for l in lines {
	let v = l.split(separator: " ")
	
	let c = Command(rawValue: v[0].description)!
	switch c {
	case .insert:
		insert(Int(v[1])!)
		break
	case .delete:
		let n = search(Int(v[1])!)
		if let _ = n {
			delete(n!)
		}

		break
	}
}

printN()
