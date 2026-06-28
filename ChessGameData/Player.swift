//
//  Player.swift
//  Chess
//
//  Created by Craig Nunemaker on 6/25/26.
//

import Foundation

public enum Player{
	case White
	case Black
	public mutating func toggle(){
		if self == .White { self = .Black}
		else { self = .White}
	}
}
