//: Playground - noun: a place where people can play

import UIKit

struct Node {
	var l: Int?
	var r: Int?
	var p: Int?
	var v: String?
}

extension Array where Element==Node {
	func printN() {
		for (i,e) in self.enumerated() {
			print("node \(i): l = \(e.l ?? -1), r = \(e.r ?? -1), p = \(e.p ?? -1), v = \(e.v ?? "?")")
		}
	}
}

var str = "3 * 4 + 2"
str = str.replacingOccurrences(of: " ", with: "") // delete space

var nodes: [Node] = []

for s in str.unicodeScalars {
	nodes.append(Node(l: nil, r: nil, p: nil, v: String(s) ))
}

nodes.printN()
