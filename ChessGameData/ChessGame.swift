import Foundation

public struct ChessGame{
	public var board: ChessGameBoard = ChessGameBoard()
	public var moves: [ChessTurn] = []
	internal var currentTurn: ChessTurn? = nil

	mutating public func select(_ square: Coordinates, selection: inout Coordinates?){
		print("selected square \(square). Already selected \(String(describing: selection))")
		if selection == nil {
			if board.get(at: square).piece != nil{
				// this is first part of move
				print("player started a move \(square)")
				selection = square
			}
		} else if selection! != square{
			startMove(from: selection!, to: square)
			selection = nil
		}
	}


	internal mutating func startMove(from fromSquare: Coordinates, to toSquare: Coordinates){
		print("player cmmpleted a move")
		// if move is not valid then don't do naything
		guard let move = board.move(from: fromSquare, to: toSquare) else { return }
		// we already selected a different square so this likely a move to square. if successful we go back to nil status

		print("valud move")
		if currentTurn != nil{
			// we can complete the turn and add it to our list
			currentTurn!.black = move
			moves.append(currentTurn!)
			print(moves.count)
			currentTurn = nil
		} else{
			// we need to begin a turn
			currentTurn = ChessTurn(white: move, black: nil)
		}
	}

	mutating func newGame(){
		moves = []
		currentTurn = nil
		board.setupNewGame()
	}

}
