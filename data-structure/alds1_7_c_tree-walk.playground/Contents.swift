//: Playground - noun: a place where people can play

import UIKit

struct Node {
	var p: Int
	var l: Int
	var r: Int
}
var nodes: [Node] = []

func preorderTreeWalk(_ r: Int) {
	if r == -1 {
		return
	}
	print("", r, terminator: "")
	preorderTreeWalk(nodes[r].l)
	preorderTreeWalk(nodes[r].r)
}

func inorderTreeWalk(_ r: Int) {
	if r == -1 {
		return
	}
	inorderTreeWalk(nodes[r].l)
	print("", r, terminator: "")
	inorderTreeWalk(nodes[r].r)
}

func postorderTreeWalk(_ r: Int) {
	if r == -1 {
		return
	}
	postorderTreeWalk(nodes[r].l)
	postorderTreeWalk(nodes[r].r)
	print("", r, terminator: "")
}

let input = """
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

var lines = input.split(separator: "\n")
nodes = Array(repeating: Node(p: -1,l: -1,r: -1), count: Int(lines.first!)!)

lines.removeFirst()
for l in lines {
	var v = l.split(separator: " ").map { Int($0)! }
	nodes[v[0]].l = v[1]
	nodes[v[0]].r = v[2]
	if v[1] != -1 {
		nodes[v[1]].p = v[0]
	}
	if v[2] != -1 {
		nodes[v[2]].p = v[0]
	}
}

print("Preorder")
preorderTreeWalk(0)
print()
print("Inorder")
inorderTreeWalk(0)
print()
print("Postorder")
postorderTreeWalk(0)
print()
