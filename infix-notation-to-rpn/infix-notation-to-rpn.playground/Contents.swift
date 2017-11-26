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
			print("node \(i): l = \(e.l ?? -1) \tr = \(e.r ?? -1)\tp = \(e.p ?? -1)\tv = \(e.v ?? "?")")
		}
	}
}

extension Character {
	var asciiValue: Int {
		get {
			let s = String(self).unicodeScalars
			return Int(s[s.startIndex].value)
		}
	}
}

var str = "3 * 4 + 2"
str = str.replacingOccurrences(of: " ", with: "") // delete space

var nodes: [Node] = []

//for s in str.unicodeScalars {
//	nodes.append(Node(l: nil, r: nil, p: nil, v: String(s) ))
//}
//for (i,s) in str.unicodeScalars.enumerated() {
//	if !(s >= "0" && s <= "9") {
//		// 演算子
//		nodes[i].l = i-1 // print(s)
//		nodes[i].r = i+1
//
//		//数字
//		nodes[i-1].p = i
//		nodes[i+1].p = i
//	}
//}

enum Arith: Int {
	case plus = 1
	case minus = 1
}


nodes.printN()
