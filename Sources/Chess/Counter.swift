import Foundation
import Synchronization

struct Counter{
    
    private static let last: Mutex<[Int:Int]> = Mutex([1:0])
    
    public static func Next(_ key: Int)-> Int {
        var result: Int = 1
        last.withLock{
            if $0[key] != nil{
                result = $0[key]! + 1
                $0.updateValue(result, forKey: key)
            } else {
                $0.updateValue(1, forKey: key)
            }
        }
        return result
    }
}