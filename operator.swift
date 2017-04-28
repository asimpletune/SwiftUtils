prefix operator |
postfix operator |
struct CollectionCount<C> where C: Collection {
    let count: C.IndexDistance
    init(_ value: C.IndexDistance) {
      count = value
    }
    static prefix func | (setSize: CollectionCount) -> C.IndexDistance {
      return setSize.count
    }
}
extension Collection {
    static postfix func | (operand: Self) -> CollectionCount<Self> {
      return CollectionCount(operand.count)
    }
}
