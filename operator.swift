prefix operator |
postfix operator |
infix operator ∈
infix operator ∋
infix operator ∉
infix operator ∌
infix operator ⊆
infix operator ⊇

// TODO: ℝ, ℚ, ℤ, ℕ, i.e. print(1 ∈ ℕ)

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

extension Set {
  static func ∈ (element: Element, aSet: Set) -> Bool {
    return aSet.contains(element)
  }
  static func ∋ (aSet: Set, element: Element) -> Bool {
    return aSet.contains(element)
  }
  static func ∉ (element: Element, aSet: Set) -> Bool {
    return !aSet.contains(element)
  }
  static func ∌ (aSet: Set, element: Element) -> Bool {
    return !aSet.contains(element)
  }
  static func ⊆ (leftSet: Set, rightSet: Set) -> Bool {
    return leftSet.isSubset(of: rightSet)
  }
  static func ⊇ (leftSet: Set, rightSet: Set) -> Bool {
    return leftSet.isSuperset(of: rightSet)
  }
}
