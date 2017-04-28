prefix operator |
postfix operator |
infix operator ∈
infix operator ∋
infix operator ∉
infix operator ∌
infix operator ⊆
infix operator ⊇
infix operator ⋂
infix operator ⋃
infix operator ×

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
  static func ⋂ (leftSet: Set, rightSet: Set) -> Set {
    return leftSet.intersection(rightSet)
  }
  static func ⋃ (leftSet: Set, rightSet: Set) -> Set {
    return leftSet.union(rightSet)
  }
  static func × (leftSet: Set, rightSet: Set) -> Set<OrderedPair<Element, Element>> {
    var result = Set<OrderedPair<Element, Element>>()
    for leftEl in leftSet {
      for rightEl in rightSet {
        result.insert(OrderedPair(leftEl, rightEl))
      }
    }
    return result
  }
}

struct OrderedPair<Element1, Element2>: Hashable, CustomStringConvertible where Element1: Hashable, Element2: Hashable {
  let el1: Element1
  let el2: Element2
  init(_ el1: Element1, _ el2: Element2) {
    self.el1 = el1
    self.el2 = el2
  }
  var hashValue: Int {
    return el1.hashValue ^ el2.hashValue
  }

  var description: String {
        return "(\(el1), \(el2))"
    }

  static func == (lhs: OrderedPair<Element1, Element2>, rhs: OrderedPair<Element1, Element2>) -> Bool {
      return lhs.el1 == rhs.el1 && lhs.el2 == rhs.el2
  }
}
