//
//  Ranks.swift
//  Chess
//
//  Created by Craig Nunemaker on 6/27/26.
//
import Foundation

public enum Ranks: String, CaseIterable{
	case one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8"

	public func nextRank() -> Ranks? {
		switch self {
			case .one: return .two
			case .two: return .three
			case .three: return .four
			case .four: return .five
			case .five: return .six
			case .six: return .seven
			case .seven: return .eight
			default: return nil
		}
	}
	
	public func prevRank() -> Ranks? {
		switch self {
			case .eight: return .seven
			case .seven: return .six
			case .six: return .five
			case .five: return .four
			case .four: return .three
			case .three: return .two
			case .two: return .one
			default: return nil
		}
	}


	static func + (lhs: Self, rhs: Int) -> Self? {
		var result: Self? = lhs
		for i in 1...rhs{
			result = result?.nextRank()
			if result == nil{
				break
			}
		}
		return result
	}

	static func - (lhs: Self, rhs: Int) -> Self? {
		var result: Self? = lhs
		for i in 1...rhs{
			result = result?.prevRank()
			if result == nil{
				break
			}
		}
		return result
	}
}
