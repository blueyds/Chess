import Foundation




public struct ChessGameBoard{
	// boolean values represent whether that piece has moved.
	// initially set to false

//	public var whiteCount: Int = 16
//	public var blackCount: Int = 16

	internal var board: [Coordinates: ChessSquare] = [:]
	internal var pieces: [GamePiece] = []
	internal var currentPlayer: Player = .White
	private var round: Int = 0
	public init(){
		createChessBoard()
		setupNewGame()
	}

	// will attempt to move the piece at from to the new coordinates
	// it will first see if it is valid move for that piece
	// it will then verify if that is a landable spot
	// it will then see if enemy piece is captured
	// finally it will scan for mate.
	public mutating func move(from: Coordinates, to: Coordinates)->ChessMove?{
		let fromSquare = get(at: from)
		let toSquare = get(at: to)
		print("inisde move func")
		// sanity checks.
		// 1. is the from a valid piece?
		//2. is the from a current player color?
		// 3. Are we going somewhere besides our own color pieces?
		guard let piece = fromSquare.piece,
			  piece.color == currentPlayer,
			  toSquare.piece?.color != currentPlayer
		else { return nil }

		//var special: specials = .none

		let safeMoves = getSafeMoves(for: piece)
		print(safeMoves)

		// todo: remove this limitation once we implement a capture

		if safeMoves.contains(to){
			// we can move so set our from nil
			return makeTheMove(from: fromSquare, to: toSquare)
		} else {
			return nil
		}
	}
	internal mutating func makeTheMove(from: ChessSquare, to: ChessSquare)->ChessMove{
		let piece = from.piece!
		set(piece: nil, at: from.coordinates)
		// if capture then note special move
		var special: specials = .none
		if to.piece != nil{
			print("piece at \(to.coordinates) was captured")
			special = .capture
		}
		// complete the move to
		set(piece: piece, at: to.coordinates)
		currentPlayer.toggle()
		let result = ChessMove(round: round, player: piece.color, type: piece.type, from: from.coordinates, to: to.coordinates,special: special)
		if piece.color == .Black {
			round = round + 1
		}
		return result
	}
	internal func isSafe(for piece: GamePiece, toMoveTo to: Coordinates?)-> Bool{
		if to == nil { return false}
		if let blocker = get(at: to!).piece{
			if blocker.color == piece.color { return false}
		}
		return true
	}

	private func getSafeMoves(for piece: GamePiece)->Set<Coordinates>{
		// TODO: add logic to restrict moves based on piece rank
		var safeMoves: Set<Coordinates> = []
		switch piece.type{
		case .Pawn:
			safeMoves = getMovesFor(pawn: piece)
		case .Rook:
			safeMoves = getMovesFor(rook: piece)
		case .Knight:
			safeMoves = getMovesFor(knight: piece)
		default:
			break
		}
		return safeMoves
	}

	private mutating func createChessBoard(){
		var rank: Ranks = .one
		var file: Files = .a
		board = [:]
		for coord in CoordinateEnum.allCases {
			let newValue = Coordinates(file: file, rank: rank)
			let square = ChessSquare(at: newValue)
			board.updateValue(square, forKey: newValue)
			print(newValue,rank, file, coord)
			if let nextRank = rank.nextRank(){
				rank = nextRank
			}
			else if let nextFile = file.nextFile(){
				file = nextFile
				rank = .one
			}
		}
	}
	
	private mutating func set(piece: GamePiece?, at: Coordinates){
		if let square = board[at]{
			var updatedSquare = square
			if piece == nil{
				if let atPiece = square.piece {
					atPiece.location = nil
				}
			}
			if piece != nil, piece!.location != at {
				piece!.location = at
			}
			updatedSquare.piece = piece

			board.updateValue(updatedSquare, forKey: at)
		} else { fatalError() }
	}

	public func get(at: Coordinates)-> ChessSquare{
		if board[at] == nil { fatalError("tried to access coordinates in get(at:) using \(at)")}
		return board[at]!
	}

	private mutating func initializeChessBoard(){
		for c in board.keys{
			set(piece: nil, at: c)
		}
	}
	
	internal mutating func setupNewGame(){
		initializeChessBoard()
		createGamePieces()
		round = 1
		for piece in pieces {
			set(piece: piece, at: piece.location!)
		}
	}

	internal func can(_ piece: GamePiece, captureEnemyAt to: Coordinates?)->Bool{
		guard let location: Coordinates = to  else { return false}
		if isSafe(for: piece, toMoveTo: location){
			if let toPiece = get(at: location).piece{
				if toPiece.color != piece.color {
					return true
				}
			}
		}
		return false
	}
}
