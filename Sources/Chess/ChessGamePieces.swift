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
internal let emojis: [GamePiece.PieceType:(String,String)] = [
	.King:("♚","♔"),
	.Queen:("♛","♕"),
	.Bishop:("♝", "♗"),
	.Rook:("♜", "♖"),
	.Knight:("♞", "♘"),
	.Pawn:("♟︎","♙")
]
extension GamePiece:CustomStringConvertible{
	public var description: String{
		color == .Black ? emojis[type]!.0 : emojis[type]!.1
	}
}

extension ChessGameBoard{
	public mutating func createGamePieces(){
		pieces = []
		pieces.append(GamePiece(color: .White, type: .Rook, location: 	allCoordinates[.a1]!))
		pieces.append(GamePiece(color: .White, type: .Knight, location: allCoordinates[.b1]!))
		pieces.append(GamePiece(color: .White, type: .Bishop, location: allCoordinates[.c1]!))
		pieces.append(GamePiece(color: .White, type: .Queen, location: 	allCoordinates[.d1]!))
		pieces.append(GamePiece(color: .White, type: .King, location: 	allCoordinates[.e1]!))
		pieces.append(GamePiece(color: .White, type: .Bishop, location: allCoordinates[.f1]!))
		pieces.append(GamePiece(color: .White, type: .Knight, location: allCoordinates[.g1]!))
		pieces.append(GamePiece(color: .White, type: .Rook, location: 	allCoordinates[.h1]!))
		pieces.append(GamePiece(color: .White, type: .Pawn, location: 	allCoordinates[.a2]!))
		pieces.append(GamePiece(color: .White, type: .Pawn, location: 	allCoordinates[.b2]!))
		pieces.append(GamePiece(color: .White, type: .Pawn, location: 	allCoordinates[.c2]!))
		pieces.append(GamePiece(color: .White, type: .Pawn, location: 	allCoordinates[.d2]!))
		pieces.append(GamePiece(color: .White, type: .Pawn, location: 	allCoordinates[.e2]!))
		pieces.append(GamePiece(color: .White, type: .Pawn, location: 	allCoordinates[.f2]!))
		pieces.append(GamePiece(color: .White, type: .Pawn, location: 	allCoordinates[.g2]!))
		pieces.append(GamePiece(color: .White, type: .Pawn, location: 	allCoordinates[.h2]!))

		pieces.append(GamePiece(color: .Black, type: .Rook, location: 	allCoordinates[.a8]!))
		pieces.append(GamePiece(color: .Black, type: .Knight, location: allCoordinates[.b8]!))
		pieces.append(GamePiece(color: .Black, type: .Bishop, location: allCoordinates[.c8]!))
		pieces.append(GamePiece(color: .Black, type: .Queen, location: 	allCoordinates[.d8]!))
		pieces.append(GamePiece(color: .Black, type: .King, location: 	allCoordinates[.e8]!))
		pieces.append(GamePiece(color: .Black, type: .Bishop, location: allCoordinates[.f8]!))
		pieces.append(GamePiece(color: .Black, type: .Knight, location: allCoordinates[.g8]!))
		pieces.append(GamePiece(color: .Black, type: .Rook, location: 	allCoordinates[.h8]!))

		pieces.append(GamePiece(color: .Black, type: .Pawn, location: 	allCoordinates[.a7]!))
		pieces.append(GamePiece(color: .Black, type: .Pawn, location: 	allCoordinates[.b7]!))
		pieces.append(GamePiece(color: .Black, type: .Pawn, location: 	allCoordinates[.c7]!))
		pieces.append(GamePiece(color: .Black, type: .Pawn, location: 	allCoordinates[.d7]!))
		pieces.append(GamePiece(color: .Black, type: .Pawn, location: 	allCoordinates[.e7]!))
		pieces.append(GamePiece(color: .Black, type: .Pawn, location: 	allCoordinates[.f7]!))
		pieces.append(GamePiece(color: .Black, type: .Pawn, location: 	allCoordinates[.g7]!))
		pieces.append(GamePiece(color: .Black, type: .Pawn, location: 	allCoordinates[.h7]!))
	}
}
