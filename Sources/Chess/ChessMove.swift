import Foundation
import Synchronization

public enum specials{
	case none
	case capture
	case castling(rookSpaces: Int)
	case check
	case checkmate
}

public class ChessTurn: Identifiable{
	public let id = Counter.next(1)
	public var white: ChessMove
	public var black: ChessMove?
	public var gameEnding: Bool = false
	init(white: ChessMove, black: ChessMove?){
		self.white = white
		self.black = black
	}
	
	
}
extension ChessTurn: CustomStringConvertible{
	public var description: String {
		if gameEnding{
			if black != nil{
				return "\(id).0-1"
			} else {
				return "\(id).1-0"
			}
		} else {
			return "\(id).\t\(white)\t\(black?.description ?? "")"
		}
	}
}
public class ChessMove: Identifiable{
	public let id: Int = Counter.next(2)
	public let round: Int
	public let color: Player
	public let type: GamePiece.PieceType
	public let from: Coordinates
	public let to: Coordinates
	public let special: specials
	public init(round: Int, player: Player, type: GamePiece.PieceType, from: Coordinates,to: Coordinates, special: specials = .none){
		self.color = player
		self.type = type
		self.from = from
		self.to = to
		self.special = special
		self.round = round
	}
}
extension ChessMove: CustomStringConvertible{
	public var description: String {
		var result = "\(type.rawValue)\(to)"
		switch special{
		case .none:
			break
		case .capture:
			result = "\(type.rawValue)x\(to)"
		case .castling(let spaces):
			if spaces == 2 {
				result = "0-0"
			} else {
				result = "0-0-0"
			}
		case .check:
			result += "+"
		case .checkmate:
			result += "#"
		}
		return result
	}
}
