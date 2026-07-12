import Foundation

public struct ChessGameBoard {
        // boolean values represent whether that piece has moved.
        // initially set to false

        //	public var whiteCount: Int = 16
        //	public var blackCount: Int = 16

        internal var board: [Coordinates: ChessSquare] = [:]
        internal var pieces: [GamePiece] = []
        internal var currentPlayer: Player = .White
        internal var round: Int = 0
        public init() {
                createChessBoard()
                setupNewGame()
        }

        private mutating func createChessBoard() {
                var rank: Ranks = .one
                var file: Files = .a
                board = [:]
		// iterate through the Coordinate Enums and create Squares based
                for coord in CoordinateEnum.allCases {
                        let newValue = Coordinates(file: file, rank: rank)
                        let square = ChessSquare(at: newValue)
                        board.updateValue(square, forKey: newValue)
                        //print(newValue, rank, file, coord)
                        if let nextRank = rank.nextRank() {
                                rank = nextRank
                        } else if let nextFile = file.nextFile() {
                                file = nextFile
                                rank = .one
                        }
                }
        }

        internal mutating func set(piece: GamePiece?, at coordinates: Coordinate)
		let square = get(at: coordinates)
		if piece == nil
		// if let atPiece = square.piece {
		// 	atPiece.location = nil
		// }
		if piece != nil, piece!.location != at {
			piece!.move(to: location)
		}
		updatedSquare.piece = piece
			board.updateValue(updatedSquare, forKey: at)
	 }

        public func get(at: Coordinates) -> ChessSquare {
                if board[at] == nil {
                        fatalError("tried to access coordinates in get(at:) using \(at)")
                }
                return board[at]!
        }

        private mutating func initializeChessBoard() {
                for c in board.keys {
                        set(piece: nil, at: c)
                }
        }

        public mutating func setupNewGame() {
                initializeChessBoard()
                createGamePieces()
                round = 1
                for piece in pieces {
                        set(piece: piece, at: piece.location!)
                }
        }

        internal func can(_ piece: GamePiece, captureEnemyAt to: Coordinates?) -> Bool {
                guard let location: Coordinates = to else { return false }
                if isSafe(for: piece, toMoveTo: location) {
                        if let toPiece = get(at: location).piece {
                                if toPiece.color != piece.color {
                                        return true
                                }
                        }
                }
                return false
        }
}
