//: Playground - noun: a place where people can play

import UIKit

var str = """
13
0 3 1 4 10
1 2 2 3
2 0
3 0
4 3 5 6 7
5 0
6 0
7 2 8 9
8 0
9 0
10 2 11 12
11 0
12 0
"""

struct Node {
	var parent: Int?
	var left: Int?
	var right: Int?
	
	init(parent: Int?, left: Int?, right: Int?) {
		self.parent = parent
		self.left = left
		self.right = right
	}
}

func printNode(_ nodes: [Node]) {
	for (i,n) in nodes.enumerated() {
		print("node \(i): parent = \(n.parent ?? -1), left = \(n.left ?? -1), right = \(n.right ?? -1)  depth = ?, []")
	}
}

var lines = str.split(separator: "\n")
var nodes: [Node] = [Node](repeatElement(Node(parent: nil, left: nil, right: nil), count: Int(lines[0])! )) // ノード保持配列の初期化
lines.removeFirst() // ノードの個数を削除

for line in lines {
	var nums = line.split(separator: " ").map{Int($0)!}
	
	let nId = nums[0]
	nums.removeFirst() // ノード番号は取得済み
	nums.removeFirst() // 子の数は利用しない
	
	nodes[nId].left = nums.first //
	
	for (i, num) in nums.enumerated() {
		nodes[num].parent = nId
		nodes[num].right = i+1<nums.count ? nums[i+1] : nil
	}
}

printNode(nodes)
