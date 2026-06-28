import Foundation

extension ChessGameBoard{

	internal func getMovesFor(rook piece: GamePiece)->Set<Coordinates>{
		var result: Set<Coordinates> = []
		guard let location = piece.location else { return result }
		let isWhite = piece.color == .White
		/* Below is code for pawn
		TODO: needs to be deleted once
		var testLocation: Coordinates? = isWhite ? location.up : location.down
		if isSafe(for: piece, toMoveTo: testLocation){
			result.insert(testLocation!)
			testLocation = isWhite ? testLocation!.up : testLocation!.down
			if isSafe(for: piece, toMoveTo: testLocation) && !piece.hasMoved{
				result.insert(testLocation!)
			}
		}
		testLocation = isWhite ? location.upLeft : location.downLeft
		if can(piece, captureEnemyAt: testLocation){
			result.insert(testLocation!)
		}
		testLocation = isWhite ? location.upRight : location.downRight
		if can(piece, captureEnemyAt: testLocation){
			result.insert(testLocation!)
		}
		 */
		return result
	}

}

