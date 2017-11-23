//: Playground - noun: a place where people can play

import UIKit

class Node {
	var p: Int = -1
	var l: Int = -1
	var r: Int = -1
	
	init(p: Int, l: Int, r: Int) {
		self.p = p
		self.l = l
		self.r = r
	}
}

var nodes: [Node] = []

func getSibling(i: Int) -> Int {
	let node = nodes[i]
	let p = node.p
	if p == -1 {
		return -1
	}
	return nodes[p].l==i ? nodes[p].r : nodes[p].l
}

func getHeight(i: Int) -> Int {
	let node = nodes[i]
	
	var l=0, r=0
	
	if node.l != -1 {
		l = getHeight(i: node.l) + 1
	}
	if node.r != -1 {
		r = getHeight(i: node.r) + 1
	}
	
	return l>r ? l : r
}

func getDegree(i: Int) -> Int {
	let node = nodes[i]
	var deg=0
	if node.l != -1 {
		deg += 1
	}
	if node.r != -1 {
		deg += 1
	}
	
	return deg
}

func getDepth(i: Int) -> Int {
	let node = nodes[i]
	var dep = 0
	
	if node.p != -1 {
		dep = getDepth(i: node.p) + 1
	}
	
	return dep
}

extension Array where Element==Node {
	func printN() {
		print("-------------NODE INFO-------------")
		for (i,e) in self.enumerated() {
//			print("node \(i): \tp = \(e.p)\tl = \(e.l)\tr = \(e.r)")
			print("node \(i): \tparent = \(e.p)\tsibling = \(getSibling(i: i))\tdegree = \(getDegree(i: i))\t depth = \(getDepth(i: i))\t height = \(getHeight(i: i))\t type = ?")
		}
		print("-------------END-------------")
	}
}

let s = """
9
0 1 4
1 2 3
2 -1 -1
3 -1 -1
4 5 8
5 6 7
6 -1 -1
7 -1 -1
8 -1 -1
"""

var lines = s.split(separator: "\n")
lines.removeFirst()

lines.forEach { _ in
	nodes.append(Node(p: -1, l: -1, r: -1))
}

for (i,l) in lines.enumerated() {
	var nums = l.split(separator: " ").map { Int($0)! }
	nums.removeFirst()
	
	let le = nums[0]
	let ri = nums[1]
	nodes[i].l = le
	nodes[i].r = ri
	
	if le != -1 {
		nodes[le].p = i
	}
	
	if ri != -1 {
		nodes[ri].p = i
	}
}

nodes.printN()



