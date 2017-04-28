prefix operator |
postfix operator |
protocol OperationResult {
    var val: Int { get }
}
struct CollectionSize: OperationResult {
    let val: Int
    init(_ v: Int) {
      val = v
    }
    static prefix func | (setSize: CollectionSize) -> Int {
      return setSize.val
    }
}
extension Array {
    static postfix func | (operand: Array) -> CollectionSize {
      return CollectionSize(operand.count)
    }
}

let A = [1, 2, 3]
let B: [Int]?
B = [4, 5, 6]


print(|[]|)
print(A[0 ..< |A|])
