import Foundation

public struct ChessSquare: Identifiable{
	public enum SquareColor{
		case black, white
	}
	public let coordinates: Coordinates
	public let color: SquareColor
	public var piece: GamePiece? = nil
	public var id: Coordinates {
		coordinates
	}

	public init(at coord: Coordinates){
		self.coordinates = coord
		self.piece = nil
		if Self.isWhite(coord){
			self.color = .white
		} else {
			aelf.color = .black
		}
	}

	private static func isWhite(_ coordinate: Coordinates){
		switch coordinate{
			case Coordinates(file: .b, rank: .one),
				Coordinates(file: .d, rank: .one),
				Coordinates(file: .f, rank: .one),
				Coordinates(file: .h, rank: .one),
				Coordinates(file: .a, rank: .two),
				Coordinates(file: .c, rank: .two),
				Coordinates(file: .e, rank: .two),
				Coordinates(file: .g, rank: .two),
				Coordinates(file: .b, rank: .three),
				Coordinates(file: .d, rank: .three),
				Coordinates(file: .f, rank: .three),
				Coordinates(file: .h, rank: .three),
				Coordinates(file: .a, rank: .four),	
				Coordinates(file: .c, rank: .four),
				Coordinates(file: .e, rank: .four),
				Coordinates(file: .g, rank: .four),
				Coordinates(file: .b, rank: .five),
				Coordinates(file: .d, rank: .five),
				Coordinates(file: .f, rank: .five),
				Coordinates(file: .h, rank: .five),
				Coordinates(file: .a, rank: .six),
				Coordinates(file: .c, rank: .six),
				Coordinates(file: .e, rank: .six),
				Coordinates(file: .g, rank: .six),
				Coordinates(file: .b, rank: .seven),
				Coordinates(file: .d, rank: .seven),
				Coordinates(file: .f, rank: .seven),
				Coordinates(file: .h, rank: .seven),
				Coordinates(file: .a, rank: .eight),
				Coordinates(file: .c, rank: .eight),
				Coordinates(file: .e, rank: .eight),
				Coordinates(file: .g, rank: .eight):
				return true
			default: return false
			}		
	]

}
