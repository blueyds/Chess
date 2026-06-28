import Foundation

extension ChessGameBoard{

	internal func getMovesFor(knight piece: GamePiece)->Set<Coordinates>{
		var result: Set<Coordinates> = []
		guard let location = piece.location else { return result }
		let testLocations = [
			location.up?.upRight,
			location.up?.upLeft,
			location.right?.downRight,
			location.right?.upRight,
			location.down?.downLeft,
			location.down?.downRight,
			location.left?.downLeft,
			location.left?.upLeft
		]
		for testLocation in testLocations {
			if testLocation != nil{
				if isSafe(for: piece, toMoveTo: testLocation!){
					result.insert(testLocation!)
				} else if can(piece, captureEnemyAt: testLocation!){
					result.insert(testLocation!)
				}
			}
		}

		return result
	}

}

