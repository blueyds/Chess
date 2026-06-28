import Foundation
public class GamePiece{

	public enum PieceType:String{
		case King = "K"
		case Queen = "Q"
		case Rook = "R"
		case Bishop = "B"
		case Knight = "N"
		case Pawn = "P"
	}

	public let color: Player
	public let type: PieceType
	
	public var location: Coordinates?{
	// TODO: will this make inital sets show hasMoved?
		didSet{ _hasMoved = true}
	}
	
	private var _hasMoved: Bool = false
	public var hasMoved: Bool { _hasMoved}
	
	public init(color: Player, type: PieceType, location: Coordinates){
		self.color = color
		self.type = type
		self.location = location
	}
}
extension GamePiece{

	public var emoji: String{
		var result: (black: String, white: String)
		switch type{
			case .King:
				result = .Black ? "♚" : "♔",
			case .Queen:
				result = .Black ? "♛" : "♕",
			case .Bishop:
				result = .Black ? "♝" : "♗",
			case .Rook:
				result = .Black ? "♜" : "♖",
			case .Knight:
				result = .Black ? "♞" : "♘",
			case .Pawn:
				result = .Black ? "♟︎" : "♙"
		}
		return result
	}

	public var notation: String{
		type.rawValue
	}
}

extension ChessGameBoard{
	public mutating func createGamePieces(){
		pieces = []
		pieces.append(GamePiece(color: .White, type: .Rook, 
			location: Coordinates(file: .a, rank: .one)))
		pieces.append(GamePiece(color: .White, type: .Knight, 
			location: Coordinates(file: .b, rank: .one)))
		pieces.append(GamePiece(color: .White, type: .Bishop, 
			location: Coordinates(file: .c, rank: .one)))
		pieces.append(GamePiece(color: .White, type: .Queen, 
			location: 	Coordinates(file: .d, rank: .one)))
		pieces.append(GamePiece(color: .White, type: .King, 
			location: 	Coordinates(file: .e, rank: .one)))
		pieces.append(GamePiece(color: .White, type: .Bishop, 
			location: Coordinates(file: .f, rank: .one)))
		pieces.append(GamePiece(color: .White, type: .Knight, 
			location: Coordinates(file: .g, rank: .one)))	
		pieces.append(GamePiece(color: .White, type: .Rook, 
			location: 	Coordinates(file: .h, rank: .one)))
		pieces.append(GamePiece(color: .White, type: .Pawn, 
			location: Coordinates(file: .a, rank: .two)))
		pieces.append(GamePiece(color: .White, type: .Pawn, 
			location: Coordinates(file: .b, rank: .two)))
		pieces.append(GamePiece(color: .White, type: .Pawn, 
			location: Coordinates(file: .c, rank: .two)))
		pieces.append(GamePiece(color: .White, type: .Pawn, 
			location: Coordinates(file: .d, rank: .two)))
		pieces.append(GamePiece(color: .White, type: .Pawn, 
			location: Coordinates(file: .e, rank: .two)))
		pieces.append(GamePiece(color: .White, type: .Pawn, 
			location: Coordinates(file: .f, rank: .two)))
		pieces.append(GamePiece(color: .White, type: .Pawn, 
			location: Coordinates(file: .g, rank: .two)))
		pieces.append(GamePiece(color: .White, type: .Pawn, 
			location: Coordinates(file: .h, rank: .two)))

		pieces.append(GamePiece(color: .Black, type: .Rook, 
			location: Coordinates(file: .a, rank: .eight)))
		pieces.append(GamePiece(color: .Black, type: .Knight, 
			location: Coordinates(file: .b, rank: .eight)))
		pieces.append(GamePiece(color: .Black, type: .Bishop, 
			location: Coordinates(file: .c, rank: .eight)))
		pieces.append(GamePiece(color: .Black, type: .Queen, 
			location: 	Coordinates(file: .d, rank: .eight)))
		pieces.append(GamePiece(color: .Black, type: .King, 
			location: 	Coordinates(file: .e, rank: .eight)))
		pieces.append(GamePiece(color: .Black, type: .Bishop, 
			location: Coordinates(file: .f, rank: .eight)))
		pieces.append(GamePiece(color: .Black, type: .Knight, 
			location: Coordinates(file: .g, rank: .eight)))
		pieces.append(GamePiece(color: .Black, type: .Rook, 
			location: Coordinates(file: .h, rank: .eight)))

		pieces.append(GamePiece(color: .Black, type: .Pawn, 
			location: 	Coordinates(file: .a, rank: .seven)))
		pieces.append(GamePiece(color: .Black, type: .Pawn, 
			location: Coordinates(file: .b, rank: .seven)))
		pieces.append(GamePiece(color: .Black, type: .Pawn, 
			location: Coordinates(file: .c, rank: .seven)))
		pieces.append(GamePiece(color: .Black, type: .Pawn, 
			location: Coordinates(file: .d, rank: .seven)))
		pieces.append(GamePiece(color: .Black, type: .Pawn, 
			location: Coordinates(file: .e, rank: .seven)))
		pieces.append(GamePiece(color: .Black, type: .Pawn, 
			location: Coordinates(file: .f, rank: .seven)))
		pieces.append(GamePiece(color: .Black, type: .Pawn, 
			location: Coordinates(file: .g, rank: .seven)))
		pieces.append(GamePiece(color: .Black, type: .Pawn, 
			location: Coordinates(file: .h, rank: .seven)))
	}
}
