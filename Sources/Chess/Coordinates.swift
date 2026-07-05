import Foundation
public enum  CoordinateEnum: String, CaseIterable{
	case a1,a2,a3,a4,a5,a6,a7,a8
	case b1,b2,b3,b4,b5,b6,b7,b8
	case c1,c2,c3,c4,c5,c6,c7,c8
	case d1,d2,d3,d4,d5,d6,d7,d8
	case e1,e2,e3,e4,e5,e6,e7,e8
	case f1,f2,f3,f4,f5,f6,f7,f8
	case g1,g2,g3,g4,g5,g6,g7,g8
	case h1,h2,h3,h4,h5,h6,h7,h8
	
}




public struct Coordinates: Hashable{
	

	public let file: Files
	public let rank: Ranks
	
	public init(_ coord: CoordinateEnum){
		let f: String = String(coord.rawValue[0])
		let r: String = String(coord.rawValue[1])
		if let newFile = Files(rawValue: f){
			self.file = newFile
		} else {
			fatalError("cound not init coordinates \(coord.rawValue)")
		}
		if let newRank = Ranks(rawValue: r){
			self.rank = newRank
		} else {
			fatalError("cound not init coordinates \(coord.rawValue)")
		}
	}
	
	public init(file: Files, rank: Ranks){
		self.file = file
		self.rank = rank
	}
	
	func offset(files: Int, ranks: Int)->Self?{
		guard let newFile = file + files else { return nil }
		guard let newRank = rank + ranks else { return nil }
		return Self(file: newFile, rank: newRank)
	}
	
	var up: Self?{
		guard let newRank = rank.nextRank() else { return nil }
		return Self(file: file, rank: newRank)
	}
	var down: Self?{
		guard let newRank = rank.prevRank() else { return nil }
		return Self(file: file, rank: newRank)
	}

	var left: Self?{
		guard let newFile = file.prevFile() else { return nil }
		return Self(file: newFile,rank: rank)
	}

	var right: Self?{
		guard let newFile = file.nextFile() else { return nil }
		return Self(file: newFile, rank: rank)

	}

	var upLeft: Self?{
		guard let newFile = file.prevFile() else { return nil }
		guard let newRank = rank.nextRank() else { return nil }
		return Self(file: newFile, rank: newRank)
//		self.up?.left
	}
	var upRight: Self?{
		guard let newFile = file.prevFile() else { return nil }
		guard let newRank = rank.nextRank() else { return nil }
		return Self(file: newFile, rank: newRank)
//		self.up?.right
	}
	var downLeft: Self?{
		guard let newFile = file.prevFile() else { return nil }
		guard let newRank = rank.nextRank() else { return nil }
		return Self(file: newFile, rank: newRank)
//		self.down?.left
	}
	var downRight: Self?{
		guard let newFile = file.prevFile() else { return nil }
		guard let newRank = rank.nextRank() else { return nil }
		return Self(file: newFile, rank: newRank)
//		self.down?.right
	}
	// TODO do we want to add helper funcitons for knights
}

extension Coordinates: CustomStringConvertible{
	public var description: String {
		return "\(file.rawValue)\(rank.rawValue)"
	}
}
