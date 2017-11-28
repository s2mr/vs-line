//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Node {
	var l: Node?
	var r: Node?
	var p: Node?
	var v: String?
}

//func pr(n: Node) {
//	let l = n.l
//	let r = n.r
//
//	while l != nil {
//
//	}
//}

extension Array where Element==Node {
	func printN() {
		for (i,e) in self.enumerated() {
			print("node \(i): l = \(e.l?.v ?? "?" ) \tr = \(e.r?.v ?? "?")\tp = \(e.p?.v ?? "?")\tv = \(e.v ?? "?")")
		}
	}
}

extension String {
	subscript (i: Int) -> String {
		return String(self[index(startIndex, offsetBy: i)])
	}
}

//優先順位
let dic: [String:Int] = ["(":4,
						 "*":3,
						 "/":3,
						 "+":2,
						 "-":2,
						 ")":1]

var input = "3 * 4 + 2"
input = input.replacingOccurrences(of: " ", with: "") // delete space

func parseToTree(exp: String, node: Node?) -> Node {
	var min: Int = 5
	var index: Int = 0
	let n = Node()
	// 優先順位が低い演算子とそのインデックスを見つける
	for (i,s) in exp.unicodeScalars.enumerated() {
		if !(s >= "0" && s <= "9") {
			let n = dic[String(s)]
			if let n = n {
				if min>n {
					min = n
					index = i
				}
			}
		}
	}
	let f = exp.index(exp.startIndex, offsetBy: index)
	let b = exp.index(f, offsetBy: 1)
	let sf = exp[..<f] // 演算子の左側
	let sc = exp[f]
	let sb = exp[b..<exp.endIndex] // 演算子の右側
	
	if index == 0 {
		// exp に演算子が含まれない場合
//		print("str: \(exp)")
		n.v = exp
		n.p = node
	} else {
		n.l = parseToTree(exp: String(sf), node: n)
		n.r = parseToTree(exp: String(sb), node: n)
		n.p = node
		n.v = String(describing: sc)
	}
	
	return n
}

func hoge(_ node: Node) {
	var l: Node? = node.l
	while l != nil { // TODO: delete splace???
		if let ul = l?.l {
			l = ul
			continue
		}
		break
	}
	
	print(l?.v ?? "", terminator: " ")
	var p: Node? = l?.p
	while p != nil {
		print(p?.r?.v ?? "", terminator: " ")
		print(p?.v ?? "", terminator: " ")
		p = p?.p
	}
	print()
}

let n = parseToTree(exp: input, node: nil)
hoge(n)

