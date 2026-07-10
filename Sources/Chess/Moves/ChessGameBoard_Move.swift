extension ChessGameBoard {

        // will attempt to move the piece at from to the new coordinates
        // it will first see if it is valid move for that piece
        // it will then verify if that is a landable spot
        // it will then see if enemy piece is captured
        // finally it will scan for mate.
        public mutating func move(from: Coordinates, to: Coordinates) -> ChessMove? {
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

                if safeMoves.contains(to) {
                        // we can move so set our from nil
                        return makeTheMove(from: fromSquare, to: toSquare)
                } else {
                        return nil
                }
        }

        internal mutating func makeTheMove(from: ChessSquare, to: ChessSquare) -> ChessMove {
                let piece = from.piece!
                // reset the location from to no piece because our piece is moving
                set(piece: nil, at: from.coordinates)
                // if capture then note special move
                var special: specials = .none

                // next we find out if we are going to capture
                if to.piece != nil {
                        print("piece at \(to.coordinates) was captured")
                        special = .capture
                }
                // complete the move to
                set(piece: piece, at: to.coordinates)
                currentPlayer.toggle()
                let result = ChessMove(
                        round: round, player: piece.color, type: piece.type, from: from.coordinates,
                        to: to.coordinates, special: special)

                // update the round if Black
                if piece.color == .Black {
                        round = round + 1
                }
                return result
        }

        // any move can call to determine if a locaation is safe to move to.
        // pieces will have to test based on theiri move rules
        internal func isSafe(for piece: GamePiece, toMoveTo to: Coordinates?) -> Bool {
                if to == nil { return false }
                if let blocker = get(at: to!).piece {
                        if blocker.color == piece.color { return false }
                }
                return true
        }

        // this is called privately by move in order to find all of the safe locations
        // a piece can move to. THe move function will then see if the desired location
        // is in that set.
        // includes a switch that runs a getMovesFor different piece types.
        private func getSafeMoves(for piece: GamePiece) -> Set<Coordinates> {
                // TODO: add logic to restrict moves based on piece rank
                var safeMoves: Set<Coordinates> = []
                switch piece.type {
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
}
