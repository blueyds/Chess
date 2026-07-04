import Foundation
import Synchronization

internal Counter{
    
    private static let last: Mutex<Int> = Mutex(.zero)
    
    internal static var next: Int {
        get{
            var result: Int = .zero
            last.withLock{
                $0 = $0 + 1
                result = $0
            }
            return result
        }
    }
}