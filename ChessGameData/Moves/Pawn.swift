import Foundation

extension ChessGameBoard{

	internal func getMovesFor(pawn piece: GamePiece)->Set<Coordinates>{
		var result: Set<Coordinates> = []
		guard let location = piece.location else { return result }
		let isWhite = piece.color == .White
		// if white we want to test forward. pawn can only move in one direction
		var testLocation: Coordinates? = isWhite ? location.up : location.down
		if isSafe(for: piece, toMoveTo: testLocation){
			result.insert(testLocation!)
			// if pawn has not moved it can move two spaces
			testLocation = isWhite ? testLocation!.up : testLocation!.down
			if isSafe(for: piece, toMoveTo: testLocation) && !piece.hasMoved{
				result.insert(testLocation!)
			}
		}
		// pawn can capture on the diagonal
		testLocation = isWhite ? location.upLeft : location.downLeft
		if can(piece, captureEnemyAt: testLocation){
			result.insert(testLocation!)
		}
		testLocation = isWhite ? location.upRight : location.downRight
		if can(piece, captureEnemyAt: testLocation){
			result.insert(testLocation!)
		}
		return result
	}


}

