public protocol IncrementalID{
    static var last: Int {get set}
}

extension IncrementalID{
    static public func NextID()->Int {
        last += 1
        return last
    }
}
