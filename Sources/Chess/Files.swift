//
//  Files.swift
//  Chess
//
//  Created by Craig Nunemaker on 6/27/26.
//
import Foundation

public enum Files: String, CaseIterable{
	case a, b, c, d, e, f, g, h

	public func nextFile() -> Self?{
		switch self{
			case .a: return .b
			case .b: return .c
			case .c: return .d
			case .d: return .e
			case .e: return .f
			case .f: return .g
			case .g: return .h
			default: return nil
		}
	}
	public func prevFile() -> Self?{
		switch self{
			case .h: return .g
			case .g: return .f
			case .f: return .e
			case .e: return .d
			case .d: return .c
			case .c: return .b
			case .b: return .a
			default: return nil
		}
	}

	static func + (lhs: Self, rhs: Int) -> Self? {
		var result: Self? = lhs
		for _ in 1...rhs{
			result = result?.nextFile()
			if result == nil{
				break
			}
		}
		return result
	}

	static func - (lhs: Self, rhs: Int) -> Self? {
		var result: Self? = lhs
		for i in 1...rhs{
			result = result?.prevFile()
			if result == nil{
				break
			}
		}
		return result
	}
}
