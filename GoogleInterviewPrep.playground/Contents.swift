import Cocoa

var str = "Hello, playground"
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    guard nums.count > 0 else {return [Int]()}
    
    //print(getDifferences(withArr: nums, target: target))
    return getDifferences(withArr: nums, target: target)
}

private func getDifferences(withArr arr: [Int], target: Int) -> [Int]{
    
    var indexes = [Int]()
    
    for (index, number) in arr.enumerated() {
        let difference = target - number
        
        for (i, num) in arr.enumerated() {
            if difference == num {
                
                if i != index {
                    indexes.append(i)
                }
                
                //indexes.append(i)
                // indexes.append(index)
            }
        }
    }
    
    return indexes.sorted()
}


let testData = [3,2,4]
let target = 6
//print(twoSum(testData, target))


class Node<T: Equatable>{
    var value: T
    var next: Node?
    init(value: T, next: Node? = nil) {
        self.next = next
        self.value = value
    }
    
    var description: String {
        guard let nextNodeValue = next else {return "\(value) -> nil"} // This is printing out the value of a node
        return "\(value) -> \(nextNodeValue)"
    }
    
    
}


// Creating a linked list

//let fourNode = Node(value: 4)
//let nineNode = Node(value: 9)
//let twoNode = Node(value: 2)
//fourNode.next = nineNode
//nineNode.next = twoNode

//print(fourNode.value)

// Now using a node to create a linked List

class LinkedList<T: Equatable>: CustomStringConvertible {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var description: String {
        guard let head = head else {return "empty linkedList"}
        return "\(head)"
    }
    
    public var firstNodeInLinkList: Node<T>? {
        return head
    }
    
    
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var root1 = l1
        var root2 = l2
        let result = ListNode(0)
        var carry = 0
        var currentNode = result
        
        
        
        while root1 != nil, root2 != nil {
            let firstNodeValue = root1 != nil ? root1!.val : 0
            let secondNodeValue = root2 != nil ? root2!.val : 0
            let sum = carry + firstNodeValue + secondNodeValue
            carry = sum / 10
            currentNode.next = ListNode(sum % 10)
            currentNode = currentNode.next!
            
            root1 = root1?.next
            root2 = root2?.next
        }
        
        if root1 != nil {
            currentNode.next = ListNode((carry + (root1?.val ?? 0) ) % 10)
            carry = (carry + (root1?.val ?? 0)) / 10
        }
        
        if root2 != nil {
           currentNode.next = ListNode((carry + (root2?.val ?? 0) ) % 10)
            carry = (carry + (root2?.val ?? 0)) / 10
            }

        
        if carry > 0 {
            currentNode.next = ListNode(carry)
        }
        
        
      
    
        return result.next
    }
    
    
    
    func printResultingNode(l1: ListNode?, l2: ListNode?) -> String {
        var rootNode = addTwoNumbers(l1, l2)
        var result = ""
        while rootNode != nil {
            result += "\(rootNode?.val) -> \(rootNode?.next?.val)"
            rootNode = rootNode?.next
        }
        
        return result
    }
    
    func printLinkedlist(withNode node: ListNode?) -> String {
        var result = ""
        var rootNode = node
        
        while rootNode != nil, let roottNode = rootNode {
            result += "\(roottNode.val) -> "
            rootNode = rootNode?.next
        }
        
        return result + "nil"
    }
    
    func printLinkedlistss(withNode node: NNode<Int>?) -> String {
        var result = ""
        var rootNode = node
        
        while rootNode != nil, let roottNode = rootNode {
            result += "\(roottNode.value) -> "
            rootNode = rootNode?.next
        }
        
        return result + "nil"
    }
    
    func checkLinkedLists(withLink1 link1: ListNode?, withLink2 link2: ListNode?) -> Bool {
        var dupLink1 = link1
        var dupLink2 = link2
        var result = true
        
        while dupLink1 != nil, dupLink2 != nil {
            if dupLink1?.val != dupLink2?.val {
                result =  false
            } else if dupLink2?.val == dupLink1?.val {
                result = true
            }
            
            dupLink2 = dupLink2?.next
            dupLink1 = dupLink1?.next
            
        }
        
      //  print(printLinkedlist(withNode: link1))
        //print(printLinkedlist(withNode: link2))
        
        return result
        
    }
    
    func reverseLinkedList(withLinkedList linkedList: NNode<Int>?) -> NNode<Int>? {
            guard let linkedList = linkedList else {return nil}
        var reversedLinkedList: NNode<Int>?
            var dup = linkedList
            while dup.next != nil {
              reversedLinkedList?.previous = dup.next
              dup = dup.next!
            }
          
          return reversedLinkedList
        }
    
  
}


class NNode<T: Equatable> {
  var value: T
  var next: NNode?
  var previous: NNode?

    init(value: T, next: NNode? = nil, previous: NNode?) {
    self.value = value
  }
    
    func reverseLinkedList(withLinkedList linkedList: NNode?) -> NNode? {
          guard let linkedList = linkedList else {return nil}
          var reversedLinkedList: NNode?
          var dup = linkedList
          while dup.next != nil {
            //reversedLinkedList.
            reversedLinkedList?.next = dup.next
            dup = dup.next!
          }
        
        return reversedLinkedList
      }
}










let twoNode = ListNode(2)
let fourNode = ListNode(4)
let threeNode = ListNode(3)
let fiveNode = ListNode(5)
let sixNode = ListNode(6)
let fourXNode = ListNode(4)
let eightNode = ListNode(8)
let oneNode = ListNode(1)

threeNode.next = eightNode
eightNode.next = fourNode
fourNode.next = oneNode

let backthreeNode = ListNode(3)
let backFourNode = ListNode(4)
let backOneNode = ListNode(1)
let backEightNode = ListNode(8)

backOneNode.next = backFourNode
backFourNode.next = backEightNode
backEightNode.next = backthreeNode







//twoNode.next = fourNode
//fourNode.next = threeNode
//
//fiveNode.next = sixNode
//sixNode.next = fourXNode



let solution = Solution()
//print(solution.printResultingNode(l1: twoNode, l2: fiveNode))
//print(solution.printLinkedlist(withNode: threeNode))
//print(solution.checkLinkedLists(withLink1: threeNode, withLink2: threeNode))

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else {return 0}
    let frequencyDict = findLongestSubstring(withString: s)
        var maxValue = frequencyDict.keys.first!.count
    
    for (key) in frequencyDict.keys {
           if key.count > maxValue {
               maxValue = key.count
           }
       }
 return maxValue
}

private func findLongestSubstring(withString input: String) -> [String:Int] {
    
    var keyString = ""
    var frequencyDict = [String: Int]()
    
    for character in input {
        
        if !keyString.contains(character) {
            print(keyString)
            keyString += String(character)
            frequencyDict[keyString] = (frequencyDict[keyString] ?? 0) + 1
        } else {
             print(keyString)
            let newString = String(character)
            keyString = newString
            frequencyDict[keyString] = 1
        }
    }
    
    //print(frequencyDict)
    return frequencyDict
}







private func getLongestSubstringCount(withDictionary dict:[String: Int]) -> Int {
    var maxValue = dict.keys.first!.count
    for (key) in dict.keys {
        
        if key.count > maxValue {
            maxValue = key.count
        }
    }
    
    return maxValue
}

//print(getLongestSubstringCount(withDictionary: findLongestSubstring(withString: "dvdf")))

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let numArr = (nums1 + nums2).sorted()
    let total = numArr.reduce(0, +)
    let middleIndex = (numArr.count + 1) / 2
    
    if numArr.count % 2 == 0 {
       return Double(total) / Double(numArr.count)
    } else {
        return Double(numArr[middleIndex - 1])
    }
    
      
  }

//print(findMedianSortedArrays([-2,-1], [3]))

private func findMedian(_ nums1:[Int], nums2: [Int]) -> Double {
    var num1Index = 0
    var num2Index = 0
    var median = 0.0
    var result = [Int]()
    
    while num1Index < nums1.count && num2Index < nums2.count {
        let number1 = nums1[num1Index]
        let number2 = nums2[num2Index]
        
        if number1 < number2 {
            result.append(number1)
            num1Index += 1
        } else if number1 >  number2 {
            result.append(number2)
            num2Index += 1
        } else {
            result.append(number1)
           result.append(number2)
            num2Index += 1
            num1Index += 1
        }
    }
    
    if num1Index < nums1.count{
        result.append(contentsOf: nums1[num1Index...])
    }
    
    if num2Index < nums2.count {
        result.append(contentsOf: nums2[num2Index...])
    }
    
    if result.count % 2 == 0 {
         let total = result.reduce(0, +)
        print(total)
        print(result.count)
        return  Double(total) / Double(result.count)
    } else {
        let middleIndex = (result.count) / 2
        return Double(result[middleIndex - 1])
    }
}


print(findMedian([1,2 ], nums2: [-1, 3]))


// Implementing a Binary Search

func binarySearch(withArr: [Int], searchKey: Int, range: Range<Int>) -> Int? {
    
    var arr = withArr
    
    
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        
        let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2 // This is getting us the index of the object in the middle
        
        if searchKey < withArr[middleIndex]  {
            
            //print("It's on the left side ")
            
            return binarySearch(withArr: withArr, searchKey: searchKey, range: range.lowerBound..<middleIndex)
          } else if withArr[middleIndex] < searchKey {
            
            //print("It's on the right side ")
            return binarySearch(withArr: withArr, searchKey: searchKey, range: middleIndex + 1..<range.upperBound)
            
          } else {
            return middleIndex
        }
    }
    }

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

//print(binarySearch(withArr: numbers, searchKey: 43, range: 0..<numbers.count))

// Bubble Sort Implementation

// Bubble Sort is O(n^2) because it's a nested iteration




func bubbleSort(withInputArr arr: [Int]) -> [Int] {
    var sortedArr = arr
    
    for i in 0..<sortedArr.count {
        
        for j in 1..<sortedArr.count - i {
            
            if sortedArr[j] < sortedArr[j - 1] {
                let temp = sortedArr[j - 1]
                sortedArr[j - 1] = sortedArr[j]
                sortedArr[j] = temp



            }
            
        }
    }
    
    return sortedArr
    
}

let numberss = [6, 20,11 , 4, 11, 13]

// 1st iteration
// i = 0
// j = 1,2,3,4,5 - 0

// numbers[j = 1] = 20
// numbers[j -1 == 1-1= 0]

//temp = numbers[0] == 6
// numbers[j - 1] = numbers[j]
// numbers[0] = 20

// Quick Sort O(nlogn)

func quickSort(withArr arr: [Int]) -> [Int] {
    guard arr.count > 1 else {return arr}
    let pivot = arr[arr.count/2] // This will give us the middle Index of our unsortedArr
    //let pivot = arr[pivotIndex]
    var lessThanPivot = [Int]()
    var equalToPivot = [Int]()
    var greaterThanPivot = [Int]()
    
    for element in arr {
        
        if element < pivot {
             lessThanPivot.append(element)
        } else if element > pivot {
            greaterThanPivot.append(element)
        } else {
            equalToPivot.append(element)
        }
    }

    
    return quickSort(withArr: lessThanPivot) + equalToPivot + quickSort(withArr: greaterThanPivot)
}



//print(quickSort(withArr: [8,4,2]))

// Merge

func mergeSort(withInputArr inputArr: [Int]) -> [Int] {
    guard inputArr.count > 1 else {return inputArr}
    let middleIndex = inputArr.count / 2
    
    let leftPile = mergeSort(withInputArr: Array(inputArr[0..<middleIndex]))
    let rightPile = mergeSort(withInputArr: Array(inputArr[middleIndex..<inputArr.count]))
    return mergeArrs(withLeftPile: leftPile, withRightPile: rightPile)
}

private func mergeArrs(withLeftPile leftPile:[Int], withRightPile rightPile: [Int]) -> [Int] {
    var sortedArr = [Int]()
    var leftPileIndex = 0
    var rightPileIndex = 0
    
    while leftPileIndex < leftPile.count && rightPileIndex < rightPile.count {
        
        if leftPile[leftPileIndex] < rightPile[rightPileIndex] {
            sortedArr.append(leftPile[leftPileIndex])
            leftPileIndex += 1
        } else if rightPile[rightPileIndex] < leftPile[leftPileIndex] {
            sortedArr.append(rightPile[rightPileIndex])
            rightPileIndex += 1
        } else {
            sortedArr.append(rightPile[rightPileIndex])
            sortedArr.append(leftPile[leftPileIndex])
            rightPileIndex += 1
            leftPileIndex += 1
        }
        
    }
    
    while leftPileIndex < leftPile.count {
        sortedArr.append(leftPile[leftPileIndex])
        leftPileIndex += 1
    }
    
    while rightPileIndex < rightPile.count {
        sortedArr.append(rightPile[rightPileIndex])
        rightPileIndex += 1
    }
    
    return sortedArr
    
}

var list = [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]

//print(mergeSort(withInputArr: list))



class LLNode<Key> {
    let val: Key
    var next: LLNode?
    init(val: Key) {
        self.val = val
    }
}
struct Queue<T> {
    private var head: LLNode<T>?
    private var tail: LLNode<T>?
    var isEmpty: Bool {
        return head == nil
    }
    mutating func enQueue(_ newElement: T) {
        let newNode = LLNode(val: newElement)
        guard let tail = tail else {
            self.head = newNode
            self.tail = newNode
            return
        }
        tail.next = newNode
        self.tail = newNode
    }
    mutating func deQueue() -> T? {
        guard let oldHead = head else {
            return nil
        }
        self.head = oldHead.next
        if oldHead.next == nil {
            self.tail = nil
        }
        return oldHead.val
    }
    func peek() -> T? {
        return self.head?.val
    }
}

class TreeNode {
    var key: Int
    var left: TreeNode?
    var right: TreeNode?
    init(key: Int) {
        self.key = key
    }
}

// Implementing BreadthFirst Search

// What happens with the breadthFirst Search is that, We enqueue(put) a node and visit that node and print out that node, then looks at his child node and put that on the queue and repeat the process

func bfs(root: TreeNode) {
    var myQueue = Queue<TreeNode>()
    myQueue.enQueue(root)
    
    while !myQueue.isEmpty {
        let visitedNode = myQueue.deQueue()!
        //print(visitedNode.key)
        
        if let leftChildNode = visitedNode.left {
            myQueue.enQueue(leftChildNode)
        }
        
        if let rightChildNode = visitedNode.right {
            myQueue.enQueue(rightChildNode)
        }
    }
}

let root = TreeNode(key: 1)
let nodeTwo = TreeNode(key: 2)
let nodeThree = TreeNode(key: 3)
let nodeFour = TreeNode(key: 4)
let nodeFive = TreeNode(key: 5)

// Implementing Depth First Search
/*
 
 Depth First Search has three possible ways of getting implemented
 
 1* We have the Pre-Order Depth First Search
 // We access the root node, then the left node and lastly the right node
 
 
     */


func preOrderTraversal(root: TreeNode?) {
    guard let rootNode = root else {return}
   // print(rootNode.key)
    preOrderTraversal(root: root?.left)
    preOrderTraversal(root: root?.right)
}

 
 /*
 
 2* We have the In-Order Depth First Search
 We access the left node, then the root node and then the right node
 */

func inOrderTraversal(root: TreeNode?) {
    guard let rootNode = root else {return}
    inOrderTraversal(root: rootNode.left)
    //print(rootNode.key)
    inOrderTraversal(root: rootNode.right)
}


/*
 
 
 3* We have the Post-Order Depth First Search
 
 We access the left node, the right node before returning back to the root Node
 */

func postOrderTraversal(root: TreeNode?) {
    guard let rootNode = root else {return}
    postOrderTraversal(root: rootNode.left)
    postOrderTraversal(root: rootNode.right)
    //print(rootNode.key)
}

func findStoppageTime(_ input: Int) -> Int? { //inputNumber = 4

guard input > 1 else {return nil}

var count = 0
var inputNumber = input
while inputNumber > 1 {

if inputNumber % 2 == 0 {

 inputNumber = inputNumber / 2
//inputNumber = 4/2 (1st loop)
//inputNumber = 2
//inputNumber = 2/2 (2nd loop)
//inputNumber = 1
count += 1
//count = 2 (loop)

// this will be the even

} else {
// this will be the odd case
inputNumber = 3*(inputNumber) + 1
count += 1
}
}
return count
}

func frequencies(input: Int) -> Int {

var dict = [Int: Int]()

for number in 1...input { // input 4

let stoppageTime = findStoppageTime(number)

if let numberStoppageTime = stoppageTime {
dict[number] = numberStoppageTime
} else {
dict[number] = 0
}
}
    let values = Array(dict.values)
    return values.max()!
}


//print(frequencies(input: 4))



struct Stack<Element> {
var stackedItems = [Element]()
public init(){}

    public mutating func push(_ element: Element) {
        stackedItems.append(element)
    }
    
    public mutating func pop() -> Element? {
        return stackedItems.popLast()
    }
    
    public func peek() -> Element? {
        return stackedItems.last
    }

    
}

public func checkBalance(withStr str: String) -> Bool {
    var stack = Stack<Character>()
    
    // The time complexity of this algorithm is linear 0(n) because the length of the iteration depends on the size of the data input
    
    for char in str {
       // print(char)
        if char == "(" { // if the character is an opening bracket, then push it into the stack.
            stack.push(char)
            //print(stack.stackedItems)
        } else if char == ")" { // if the bracket is an closing bracket, then check is the stack array is empty ..... if it's empty, then it indicates that the stack array is empty and should return false
            if stack.stackedItems.isEmpty {
                return false
            } else {
                print(stack.stackedItems) // if the stack is not empty, then there is an opening bracket on the stackedItems. So pop the last bracket. and when the process is done, if the stackedItems are empty, then it shows that the  brackets are balanced
                stack.pop()
                print(stack.stackedItems)
            }
        }
    }
    //print(stack.stackedItems)
    return stack.stackedItems.isEmpty
}

//print(checkBalance(withStr: "(h())"))

// Implementing a linkedList


class LListNode<Element> {
    
    var value: Element
    var next: LListNode?
    init(value: Element, next: LListNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension LListNode: CustomStringConvertible {
    var description: String {
        guard let next = next else { return "\(value) "}
        return "\(value) -> " + "\(next)"
    }
}

struct linkedlist<Element> {
    var headNode: LListNode<Element>?
    var tailNode: LListNode<Element>?
    
    public init() {}
    
    public var isEmpty: Bool { // if headnode is nil, then the linked list is empty
        return headNode == nil
    }
    

    

}

extension linkedlist: CustomStringConvertible {
    public var description: String {
        guard let headNode = headNode else {return "Empty linked list"}
        return String(describing: headNode)
    }
    
    // Pushing a new node into the linked list.
    // This operation updates the headNode with the new node which makes the older head now the next node to the newNode
    
    public mutating func push(_ newNodeValue: Element) {
        
        if isEmpty {
            let newNode = LListNode(value: newNodeValue, next: nil)
            headNode = newNode
            tailNode = headNode
        } else {
            let newNode = LListNode(value: newNodeValue, next: headNode)
            headNode = newNode
        }
        
    }
    
    // Appending a newNode into a linked list
    // This operation adds a new node to the end of the linked list
    // This is equally a constant time operation 0(n)
    
    public mutating func append(_ value: Element) {
        if isEmpty {
            self.push(value)
        } else {
            let newNode = LListNode(value: value, next: nil)
            tailNode?.next = newNode
            tailNode = tailNode?.next
        }
    }
    
    // Inserting a new node into a linked list at a particular location or after a particular node
    // This method appends a node to the linked list after a specified node
    // Steps
        // step 1: Find the after node
        
    public func findTargetNode(atIndex index: Int) -> LListNode<Element>? {
        var currentNode = headNode
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    
    
    // Step 2: Then insert the newNode
//    @discardableResult
//    public mutating func insert(_ value: Element, afterNode node: LListNode<Element>?) -> LListNode<Element>? {
//
//        guard let afterNode = node else {return nil}
//
//        // we first need to check if the afterNode is the last node,
//        guard tailNode! == afterNode else { // if our last node is the target (after) node, then just append the new node into the linked list
//            append(value)
//            return tailNode
//        }
//        let newNode = LListNode(value: value, next: afterNode.next)
//        afterNode.next = newNode
//        return afterNode.next
//    }
    
    public mutating func pop() -> Element? {
        if isEmpty {
            return nil
        } else {
            let headValue = headNode?.value
            let newHeadNode = headNode?.next
            headNode = newHeadNode
            if isEmpty {
                tailNode = nil
            }
            return headValue
        }
    }
    
    public mutating func removeLast() -> Element? {
        guard let headNode = headNode else {return nil}
        guard headNode.next != nil else {
            print(pop())
            return pop()
        }
        
        var previousNode = headNode
        var currentNode = headNode
        
        while let nextNode = currentNode.next {
            previousNode = currentNode
            currentNode = nextNode
        }
        previousNode.next = nil
        tailNode = previousNode
        print(previousNode.value)
        print(currentNode.value)
        return currentNode.value
    }
    
    
  
    
}

var mylinkedList = linkedlist<String>()
mylinkedList.append("1")
mylinkedList.append("2")
mylinkedList.append("3")
//mylinkedList.append("4")

func printLinkedListInReverse(withNode node: LListNode<String>?) {
    guard let passedNode = node else {return} // we are using recursion to print out the values but we are printing the values after hitting the last node 
    printLinkedListInReverse(withNode: passedNode.next)
     print(passedNode.value)
}

func printInReverse(withLinkedList linkedList: linkedlist<String>) {
    //printLinkedListInReverse(withNode: linkedList.headNode)
    let middleIndex = getMiddleIndex(withNode: linkedList.headNode)
   let middleNode = getMiddleNode(withNode: linkedList.headNode, andIndex: middleIndex)
    //print(middleNode?.value)
}

func printReversedLinkedList(withLinked linkedList: linkedlist<String>) {
    
    if let reversedLinkedList = reverseLinkedList(withLinkedList: linkedList) {
      print("Reversed linked", reversedLinkedList)
    } else {
        print("Linked list is empty. Can't reverse empty linked list")
    }
}

func getMiddleIndex(withNode node: LListNode<String>?) -> Int {
    
    var currentNode = node
    var count = 1
    
    while let nextNode = currentNode?.next {
        currentNode = nextNode
        count += 1
    }
    //print("The count of my linked list is ", count)
  // print("The middle index of my linked list ",count / 2)
    return count / 2
}

func getMiddleNode(withNode node: LListNode<String>?, andIndex index: Int) -> LListNode<String>? {
    
    var currentNode = node
    var currentIndex = 0
    
    while currentNode != nil && currentIndex < index {
        currentNode = currentNode?.next
        currentIndex += 1
    }
    print("The middle node on my linked list is ",currentNode?.value, "located at index \(index)")
    return currentNode
}

// This getting the middle node using the running approach
// This uses two pointers to iterate through the linked list where one of the pointers goes twices as the order

func gettingMiddleNode(withLinkedlist list: linkedlist<String>) -> String? { // This is the runners approach
    
    var fastPointer = list.headNode
    var slowPointer = list.headNode
    
    while let nextFastPoint = fastPointer?.next {
        fastPointer = nextFastPoint.next
        slowPointer = slowPointer?.next
    }
    return slowPointer?.value
}



func reverseLinkedList(withLinkedList inputLinkedList: linkedlist<String>) -> linkedlist<String>? {
    var reversedLinkedList = linkedlist<String>()
    var reversedListStr = ""
    guard !inputLinkedList.isEmpty else {return nil}
    var headNode = inputLinkedList.headNode

    while headNode != nil, let nodeValue = headNode?.value {
        reversedLinkedList.push(nodeValue)
        headNode = headNode?.next
    }
    print(reversedListStr)
    return reversedLinkedList
}


func  removeOccuringNodes(withLinkedList list: linkedlist<Int>, andValue value: Int) -> linkedlist<Int>{
    var currentNode = list.headNode
    var resultingLinkedList = linkedlist<Int>()
    
    while currentNode != nil , let currentNodeValue = currentNode?.value {
    
        if currentNodeValue != value {
            resultingLinkedList.append(currentNodeValue)
        }
        currentNode = currentNode?.next
    }
    
    return resultingLinkedList
    
}




//print(mylinkedList)

//print(printInReverse(withLinkedList: mylinkedList))
print("Original linkedList", mylinkedList.description)
print(printReversedLinkedList(withLinked: mylinkedList))


// Merging two sorted linked list using merge sort


func addTwoLinkedList(withlist1 list1: linkedlist<Int>, withList2 list2: linkedlist<Int>) -> linkedlist<Int>? {
    
    guard !list1.isEmpty else {return list2}
    guard !list2.isEmpty else {return list1}
    
    if list1.isEmpty && list2.isEmpty {
        return nil
    }
    
    var currentLeftNode = list1.headNode
    var currentRightNode = list2.headNode
    
    var mergedLinkedList = linkedlist<Int>()
    
    
    while let currentLeft = currentLeftNode, let currentRight = currentRightNode {
        
        if currentLeft.value < currentRight.value {
            mergedLinkedList.append(currentLeft.value)
            currentLeftNode = currentLeft.next
        } else if currentRight.value < currentLeft.value {
            mergedLinkedList.append(currentRight.value)
            currentRightNode = currentRight.next
        } else {
         mergedLinkedList.append(currentLeft.value)
          mergedLinkedList.append(currentRight.value)
             currentLeftNode = currentLeft.next
            currentRightNode = currentRight.next
        }
    }
    
    if let leftNodes = currentLeftNode {
        mergedLinkedList.append(leftNodes.value)
    }
    
    if let rightNodes = currentRightNode {
        mergedLinkedList.append(rightNodes.value)
    }
    
    return mergedLinkedList
}


var myList1 = linkedlist<Int>()
var myList2 = linkedlist<Int>()
myList1.append(1)
myList1.append(4)
myList1.append(10)
myList1.append(11)


myList2.append(1)
myList2.append(2)
myList2.append(3)
myList2.append(6)

var mytestList = linkedlist<Int>()
mytestList.append(1)
mytestList.append(3)
mytestList.append(3)
mytestList.append(3)
mytestList.append(4)

var myMergeList1 = linkedlist<Int>()
myMergeList1.append(3)
myMergeList1.append(2)
myMergeList1.append(1)



var myMergeList2 = linkedlist<Int>()
myMergeList2.append(-1)
myMergeList2.append(-2)
myMergeList2.append(-3)

print(removeOccuringNodes(withLinkedList: mytestList, andValue: 3))

print("Middle node using the runners technique",gettingMiddleNode(withLinkedlist: mylinkedList))
print("Middle node using the middle index technique",gettingMiddleNode(withLinkedlist: mylinkedList))

let mergedLinkedList = addTwoLinkedList(withlist1: myMergeList1, withList2: myMergeList2)
print("This is the first linked list", myList1)
print("This is the second linked list", myList2)
print("This is my merged linked list ",mergedLinkedList!)


// Queue
/*
 Queues use the traditional first in first out concept where the first item that goes in on the queue is the first to come out
 Queues === FIFO
 There are four main operations in Queues
 1. Enqueue -- Appending a new item to the queue from the back
 2. dequeue -- remove and return the first item on the queue
 3. isEmpty --- returns a bool if the queue is empty or not
 4. peek --- returns the first item on the queue without removing it
 */


// Implementing a queue using an array as the storage tank

struct MyQueue<Element> {
    
    var storageTankArr = [Element]()
    
    public init(){}
    
    // enqueue operation
    
    mutating func enqueue(withNewElement newElement: Element) { // This is a constant time operation
        storageTankArr.append(newElement)
    }
    


    // dequeue operation
    mutating func dequeue() -> Element? { // This is a linear time operation because after removing the first element on the queue, we require the rest of the elements on the queue to shift on place forward
        return storageTankArr.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return  storageTankArr.isEmpty
    }
    
    func peek() -> Element? {
        return storageTankArr.first
    }
    
    
}

class DNode<Element: Equatable>: Equatable {
    var value: Element
    var next: DNode?
    var previous: DNode?
    init(value: Element,next: DNode? = nil, previous: DNode? = nil) {
        self.value = value
        self.next = next
        self.previous = previous
    }
    
    static func == (lhs: DNode<Element>, rhs: DNode<Element>) -> Bool {
        return lhs.value == rhs.value
    }
    
}

struct DoublyLinkedLink<Element: Equatable> {
    var previousNode: DNode<Element>?
    var nextNode: DNode<Element>?
    var size: Int = 0
    public init(){}
    
    public func append(withElement element: Element) { // This method will update the tail node's previous and next values on the linked list
        
    }
    
    public func remove(withElement element: Element) -> Element { // This will take an element and remove it from the doubly linked list. i.e the linked list's tail
        return element
    }
}

// Implementing a queue using a double linked list
/*
 Double linked list are linked list where each node mantains its reference to the previous node
 Double linked list are bidirectional linked list
 
 
 */

class QueueLinkedList<Element: Equatable> { // This is our custom queue where we are using a doubly linked list as storage instead of using an array
    var doublyLinkedList = DoublyLinkedLink<Element>()
    public init(){}
    
    // Implementing the enqueue method .... which adds a new element to the end of the queue
    
    public func enqueue(withElement element: Element) -> Bool {
        doublyLinkedList.append(withElement: element)
        return true
    }
    
    // Implementing the dequeue method ... this method removes the first node (head node) from the linked list
    
//    public func dequeue() -> Element? { // This is a constant time operation because our linked list does not need to resize itself by moving nodes a step forward
//        let element: Element?
//        return doublyLinkedList.remove(withElement: element!)
//    }
    }


struct QueueStack<Element> {
    var rightStack = [Element]()
    var leftStack = [Element]()
    public init() {}
    
    public var isEmpty: Bool { // if our right stack and left stacks are empty, then it will return true
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public func peek() -> Element? {
        if leftStack.isEmpty {
            return rightStack.first
        } else {
            return leftStack.last
        }
    }
    
    public mutating func enqueue(withElement element: Element) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue()-> Element? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
    

    
    // [s, w, i, f,t]
    // enqeue("r") == [s,w,i,f,t,r]
}



// Implementation of trees

class ATreeNode<Element: Equatable> { // This is the node in a tree
    var value: Element // This is the value of a node in a tree
    var childrenNodes = [ATreeNode]()
    init(value: Element) {
        self.value = value
    }
    
    // to add a child to a node
    
    public func addChildNode(withChildNode childNode: ATreeNode) {
        childrenNodes.append(childNode)
    }
    
}

extension ATreeNode {
    /*
     In a depth first traversal, we visit a node, then visits its children nodes
     */
    
    func depthFirstTraversal(visitedNode: (ATreeNode) -> Void) {
        visitedNode(self) // The self in this case is the root node for the first iteration
        // Now we have to visit its childrens
        // iterate through the child nodes and recursively call the depthFirst method
       
        childrenNodes.forEach { // iterate through the child nodes and visit them
            $0.depthFirstTraversal(visitedNode: visitedNode)
          //  print(value)
        }
    }
    
    func levelOrderTraversal(visitedNode: (ATreeNode) -> Void) {
        visitedNode(self) // we start by visiting the root node first
        // queue to hold the child nodes
        var nodesQueue = Queue<ATreeNode>()
        childrenNodes.forEach {
            nodesQueue.enQueue($0)
        }
        
        while let node = nodesQueue.deQueue() { // this dequeues the child nodes in the order that they enter the queue and repeats the process
            visitedNode(node)
            node.childrenNodes.forEach {
                nodesQueue.enQueue($0)
            }
        }
    }
    
    func searchNode(_ value: Element) -> ATreeNode? {
        var result: ATreeNode?
        depthFirstTraversal { (node) in
            if node.value == value {
                result = node
                
            }
        }
        return result
    }
    
    func booleanSearch(_ value: Element) -> Bool? {
        var result: Bool?
        depthFirstTraversal { (node) in
            if node.value == value {
                result = true
            } else {
                result = false
            }
        }
        return result
    }
    
    // How to print the nodes according to their levels with seperator lines
    // We will use the level order traversal
    // But we need to account for when the level is complete
    
    func printEachLevelWithLine(withTree tree: ATreeNode) {
        var queue = MyQueue<ATreeNode>()
        var nodesLeftInCurrentLevel = 0
        queue.enqueue(withNewElement: tree) // this is passing in the root node
        
        while !queue.isEmpty() {
            nodesLeftInCurrentLevel = queue.storageTankArr.count
            
            while nodesLeftInCurrentLevel > 0 {
                guard let node = queue.dequeue() else {break}
                Swift.print("\(node.value)", terminator: " ")
                node.childrenNodes.forEach { queue.enqueue(withNewElement: $0)}
                nodesLeftInCurrentLevel -= 1
            }
        }
        
    }
   // print()
    
    
}





//print("This is what alice family tree looks like", aLiceFamilyTree.depthFirstTraversal(withVisitedNode: { (self) in
//    print(self.value)
//}))

func printTree(){
    let aLiceFamilyTree = ATreeNode<String>(value: "Alice")
    let ebiNode = ATreeNode<String>(value: "Ebibolouemi")
    let ongosNode = ATreeNode<String>(value: "Ongokuromo")
    let tukuNode = ATreeNode<String>(value: "Tuku")
    let vicNode = ATreeNode<String>(value: "Victoria")
    
    let ebiPNode = ATreeNode<String>(value: "Ebipanipre")
    let undusNode = ATreeNode<String>(value: "Undutimi")
    let pereNode = ATreeNode<String>(value: "Perebibo")
    let tariNode = ATreeNode<String>(value: "Tariladou")

    aLiceFamilyTree.addChildNode(withChildNode: vicNode)
    aLiceFamilyTree.addChildNode(withChildNode: ongosNode)
    aLiceFamilyTree.addChildNode(withChildNode: tukuNode)
    aLiceFamilyTree.addChildNode(withChildNode: vicNode)

    ebiNode.addChildNode(withChildNode: tariNode)
    ebiNode.addChildNode(withChildNode: undusNode)
    ebiNode.addChildNode(withChildNode: pereNode)
    ebiNode.addChildNode(withChildNode: ebiPNode)
    
    let tree = ebiNode
    
    print(tree.printEachLevelWithLine(withTree: tree))
}

print(printTree())

   
// Binary Trees
// For binary trees each node has 2 children at most
// Child nodes are called left or right child

class BinaryTreeNode<Element>{
    var value: Element // This is the value of the binary tree node node
    var leftChildNode: BinaryTreeNode? // This is the left child node
    var rightChildNode: BinaryTreeNode? // This is the right child node
    init(value: Element) {
        self.value = value
    }
}

extension BinaryTreeNode {
    
    // Traversing a Binary Tree
    // We are going to use level order travel to go through a binary tree so we can print out the values according to their levels
    // There are 3 ways to level order traversal for binary trees
    // We have the In-Order, Pre-Order and Post order traversal


    /*
     Pre-Order
     we start with the root node
     
     if the current node has a left child, we recursively visit this child first
     
     then visit the node itself
     
     if the current node has a child, recursively visit this child
     */
    
    func preOrderTraversal(visit: (Element) -> Void) {
        visit(value)
        leftChildNode?.preOrderTraversal(visit: visit)
        rightChildNode?.preOrderTraversal(visit: visit)
    }
    
    /*
     Post-Order Traversal
      we start by visiting the left and right child nodes of the current node before returning to it
     */
    
    func postOrderTraversal(visit: (Element) -> Void) {
        leftChildNode?.postOrderTraversal(visit: visit)
        rightChildNode?.postOrderTraversal(visit: visit)
        visit(value)
    }
    
    /*
     In-Order Traversal
     
     We start by visiting the left child's current node, then visiting the node itself and then the right child node
     */
    
    func inOrderTraversal(visit: (Element) -> Void) {
        leftChildNode?.inOrderTraversal(visit: visit)
        visit(value)
        rightChildNode?.inOrderTraversal(visit: visit)
    }
    
    // Serialization returns an array containing all the values of an array in pre-order traversal
    // The time complexity of serialization is linear time 0(n)because all values must be visited
    
    func traversePreOrder(visit: (Element?)-> Void) {
        visit(value)
        if let leftChildNode = leftChildNode { // If the left child exist, then visit it
            leftChildNode.traversePreOrder(visit: visit)
        } else { //  else visit the nil
            visit(nil)
        }
        
        if let rightChildNode = rightChildNode {
            rightChildNode.traversePreOrder(visit: visit)
        }
    }
    
    // Write a function to see if a value is contained in a binary tree
    

    
    
    
    
    
    
    
    
}

func findHeight(withBinaryTree binaryTree: BinaryTreeNode<Int>?) -> Int {
    
    guard let node = binaryTree else { return -1 } // if the node is nil, then return -1
    
    // then we call the method recursively
    
    return 1 + max(findHeight(withBinaryTree: node.leftChildNode), findHeight(withBinaryTree: node.rightChildNode))
}
 // The time complexity is linear since we have to go through all the nodes in the tree

func printTreeHeight() {
    let root = BinaryTreeNode<Int>(value: 15)
    let tenNode = BinaryTreeNode<Int>(value: 10)
      let fiveNode = BinaryTreeNode<Int>(value: 5)
      let twelveNode = BinaryTreeNode<Int>(value: 12)
      let twentyFiveNode = BinaryTreeNode<Int>(value: 25)
      let seventeenNode = BinaryTreeNode<Int>(value: 17)
    root.leftChildNode = tenNode
    root.rightChildNode = twentyFiveNode
    tenNode.leftChildNode = fiveNode
    tenNode.rightChildNode = twelveNode
    twentyFiveNode.leftChildNode = seventeenNode
    
    let treeHeight = findHeight(withBinaryTree: root)
    print(treeHeight)
    
    print(getAllTreeValues(withBinaryNode: root))
    
    let searchResult = searchBinaryTree(withValue: 40, withNode: root)
    
    print(searchResult)
}

// To get all the values on the tree including the nil values in an array, we just need to call our traverse method

func getAllTreeValues(withBinaryNode binaryNode: BinaryTreeNode<Int>) -> [Int?] {
    
    var treeValuesArr = [Int?]()
    
    binaryNode.traversePreOrder { treeValuesArr.append($0)}
    
    return treeValuesArr
}

func searchBinaryTree(withValue value: Int, withNode node: BinaryTreeNode<Int>?) -> Bool {
   
    
    guard let node = node else {return false}
    
     var result = false
    
    node.preOrderTraversal { (nodeValue) in
        if nodeValue == value {
            result = true
        }
    }
    return result
}

// Binary Search tree (BST)

// Implementation of Binary Search Tree

struct BinarySearchTree<Element: Comparable> { // This is our binary search tree
    var rootNode: BinaryTreeNode<Element>? // This is the root node of our binary search tree
    // The root node has a value, a left child node and a right child node
    // The left child node value must be less than the root node value
    // The right child node value must be equal or greater than the root node value
    
    public init(){}
    
    // Binary Search Trees have three main operations
    // The insertion Operation 0(log n)
    // The removal Operation 0(log n)
    // The search operation 0(log n)
    
    // The insertion Operation
    
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let rootNode = rootNode else {return "empty tree"}
        return String(describing: rootNode)
    }
    
    public mutating func insertNewNode(_ value: Element) {
        rootNode = insertNode(fromNode: rootNode, withNewValue: value)
    }
    
    private func insertNode(fromNode node: BinaryTreeNode<Element>?, withNewValue newValue: Element) -> BinaryTreeNode<Element> { // This is the helper method that handles the insertion of new values
        
        // Step 1: Check if tree already contains a new value. if the tree is empty, then add the new value into the tree
        guard let node = node else { // if the current node is nil, then we have found an insertion point
            let newRoot = BinaryTreeNode(value: newValue)
            return newRoot
        }
        
        // step 2: Check if the new node should be added into the left or right side of the current node
        
        if node.value < newValue {
            // This is checks if the right child value of the current node is greater or equal to the new value. If yes, then recursively call it on the right side of tree
          
             node.rightChildNode = insertNode(fromNode: node.rightChildNode, withNewValue: newValue)
        } else {
          node.leftChildNode = insertNode(fromNode: node.leftChildNode, withNewValue: newValue)
        }
        
        return node
        
    }
    
    // Search Operation on BST
    // This is also a 0(log n) operation
    //
    
    func searchBSTForValue(value: Element) -> Bool { // This is the conventional inorder approach which is 0(n) because it goes through all the values
        guard let root = rootNode else {return false } // If the root node is nil, then return false because our tree is empty
        var result: Bool = false
        root.inOrderTraversal { (currentNodeValue) in // then we use the in order traversal to go through the tree and check if our value of interest is in the tree
            if currentNodeValue == value {
                result = true
            }
        }
        
        return result
    }
    
    // The optimized approach will be to use the rules of BST
    // This cuts the iteration into half i.e runtime 0(log n)
    
    func searchBST(value: Element) -> Bool {
        var currentNode = rootNode // By default, our start node is the root node. So we start there
        
        while let currentRootNode = currentNode { // if our current root node value is equal to the value, then return true ... we have found our search value
            if currentRootNode.value == value {
                return true
            }
            
            if value < currentRootNode.value { // if our search value is smaller than our currentRootNode value, then the value must be on the left side of our current node. so look at the Left
                currentNode = currentRootNode.leftChildNode // this will happen recursively
            } else {
                currentNode = currentRootNode.rightChildNode // this will happen recursively
            }
        }
        return false
    }
    
    // The removing operation
    
    mutating func removeBST(_ value: Element) {
        rootNode = removeNodeBST(fromRootNode: rootNode, andValue: value)
        
    }
    
    func removeNodeBST(fromRootNode rootNode: BinaryTreeNode<Element>?, andValue value: Element) -> BinaryTreeNode<Element>? {
        // Step 1:
        // Check if there's any node in our binary search tree
        // If there are no nodes on the tree, then return nil
        
        guard let node = rootNode else {return nil}
        
        // Step 2:
        // Check what side(left or right) to remove the node from
        
        if value < node.value { // if the value is smaller, then check the left side
            node.leftChildNode = removeNodeBST(fromRootNode: node.leftChildNode, andValue: value)
            
        } else if value > node.value { // if the value is larger than the current node, then check the right side of that node
            node.rightChildNode = removeNodeBST(fromRootNode: node.rightChildNode, andValue: value)
        } else { // if the current node is the value we are trying to remove, then we need to replace the node with the smallest value on the right subtree
            
            if node.leftChildNode == nil && node.rightChildNode == nil { // if the node is a left node, then just remove it
                return nil
            }
            
            if node.leftChildNode == nil { // if the left node is nil, then return the right node as a replace
                return node.rightChildNode
            }
            
            if node.rightChildNode ==  nil { // if the node has only a child node, then bring that as his replacement
                return node.leftChildNode
            }
            
            
            // This is the case where we have to get the smallest posible value on the right child sub tree
            
            // Step 1:
            // Mutate the value of the node with the smallest value on the rightNode's subtree
            node.value = node.rightChildNode!.min.value
            // then we call remove on the rightchild node to remove that smallest possible value
            node.rightChildNode = removeNodeBST(fromRootNode: node.rightChildNode, andValue: node.value)
 
        }
        return node
    }
     
    // Checking if the tree is a binary search tree
    func isABST() -> Bool { // This is a linear time complexity because we have to travel to every node 
        let currentNode = rootNode

        return validDateBST(withRootNode: currentNode, min: nil , max: nil)
    }
    
    func validDateBST(withRootNode rootNode: BinaryTreeNode<Element>?, min: Element?, max: Element?) -> Bool {
        
        // check if the node exist first
        
        guard let tree = rootNode else {return true}
        
        // check if the bounds of the current node.
        if let minBound = min, minBound > tree.value { // if the minimum bounds is greater than the tree value, then return false
            return false
            
        } else if let maxBound = max, maxBound < tree.value { // if the maximum bounds are less than the value of the current node, then false
            return false
        }
        
        // recursively call the method and check both the right and the left child nodes of our tree
        
        return validDateBST(withRootNode: tree.leftChildNode, min: min, max: max) && validDateBST(withRootNode: tree.rightChildNode, min: min, max: max)
    }
    
}

extension BinaryTreeNode {
    var min: BinaryTreeNode {
        leftChildNode?.min ?? self
    }
}

var binarySearchTree = BinarySearchTree<Int>()
binarySearchTree.insertNewNode(3)
binarySearchTree.insertNewNode(1)
binarySearchTree.insertNewNode(4)
binarySearchTree.insertNewNode(0)
binarySearchTree.insertNewNode(2)
binarySearchTree.insertNewNode(5)



func printOutBST() -> BinarySearchTree<Int>{
    var binarySearchTree = BinarySearchTree<Int>()
    binarySearchTree.insertNewNode(3)
    binarySearchTree.insertNewNode(1)
    binarySearchTree.insertNewNode(4)
    binarySearchTree.insertNewNode(0)
    binarySearchTree.insertNewNode(2)
    binarySearchTree.insertNewNode(5)
return binarySearchTree
}


print("Is the number 2 on the binary tree?", binarySearchTree.searchBSTForValue(value: 5))
print("Using the optimized option, is the number 5 on the binary tree", binarySearchTree.searchBST(value: 5))


print(printTreeHeight())
print(printOutBST())



class AVLTreeNode<Element: Equatable> { // This is the node in a tree
    var value: Element // This is the value of a node in a tree
    var leftChildNode: AVLTreeNode?
    var rightChildNode: AVLTreeNode?
    var height = 0 // This is the relative height of a node's children
    // We use the height of the node's children to determine if a node is balanced
    // The height of the left and right child nodes must differ at most by 1
    // The difference between the left child and right child node heights is called the balanceFactor
    init(value: Element) {
        self.value = value
    }

    
    var balanceFactor: Int { // This is difference between the height of the left and right child node. For balanced nodes, the balance Factor can at most be 1
        leftChildNodeHeight - rightChildNodeHeight
        
    }
    
    var leftChildNodeHeight: Int { // This gives the height of the leftChildNode
        leftChildNode?.height ?? -1 // If the left node is nil, then it's height is considered to be -1
        
    }
    
    var rightChildNodeHeight: Int { // This gives the height of the rightChildNode
        rightChildNode?.height ?? -1 // If the right node is nil, then it's height is considered to be -1
    }
    
    // A balance factor of -2 or 2 is an unbalance tree
    // The balancing procedure is performed only on the bottom most node with a bad balance factor. i.e the node with a bad balance factor closer to the root node is the one to be rebalanced.
    
    // Rotations
    // The process of balancing an unbalanced binary tree is called Rotations
    // There are 4 main rotations in total according to the different ways a tree becomes unbalanced
    /*
     They are;
     
     Left Rotation,
     
     left-right rotation,
     
     right rotation,
     
     right-left rotation
     
     */
    
}

struct AVLTree<Element: Comparable> {
    var rootNode: AVLTreeNode<Element>?
    public init(){}
}

extension AVLTree: CustomStringConvertible {
    var description: String {
        guard let rootNode = rootNode else {return "Empty tree"}
        return String(describing: rootNode)
        
    }
        
        // insert method on an AVL Binary tree
        
        mutating func insertNewNode(withValue value: Element) {
            
            rootNode = insertingNode(fromNode: rootNode, withNewValue: value)
            
        }
        
        private func insertingNode(fromNode node: AVLTreeNode<Element>?, withNewValue newValue: Element) -> AVLTreeNode<Element> {
            
            // if the tree is empty, then just insert new node
            
            guard let node = node else {
                let newNode = AVLTreeNode(value: newValue)
                return newNode
            }
            
            if node.value < newValue {
                node.rightChildNode = insertingNode(fromNode: node.rightChildNode, withNewValue: newValue)
            } else {
               node.leftChildNode = insertingNode(fromNode: node.leftChildNode, withNewValue: newValue)
            }
            // we need to apply our balance here before returning it
            let balancedNode = node.balanceTree(node)
            balancedNode.height = max(balancedNode.leftChildNodeHeight, balancedNode.rightChildNodeHeight) + 1
            return balancedNode
        }
    
    mutating func remove(withValue value: Element) {
        
    }
    
    func removeNode(fromNode node: AVLTreeNode<Element>?, withValue value: Element) -> AVLTreeNode<Element>? {
        
        guard let node = node else {return nil}
        
        if node.value < value {
            node.rightChildNode = removeNode(fromNode: node.rightChildNode, withValue: value)
        } else if node.value > value {
            node.leftChildNode = removeNode(fromNode: node.leftChildNode, withValue: value)
        } else {
            if node.leftChildNode == nil && node.rightChildNode == nil {
                return nil
            }
            
            if node.leftChildNode == nil {
                return node.rightChildNode
            }
            
            if node.rightChildNode == nil {
                return node.leftChildNode
            }
        }
        
        node.value = (node.rightChildNode?.min.value)!
        node.rightChildNode = removeNode(fromNode: node.rightChildNode, withValue: node.value)
        let balancedNode = node.balanceTree(node)
        balancedNode.height = max(node.leftChildNodeHeight, node.rightChildNodeHeight) + 1
        
        return balancedNode
        
    }
    
    // Find the number of leaf nodes in a perfectly balanced tree with a given height
    
    func findLeafNodesNumber(withTreeHeight treeHeight: Int) -> Int {
        
        // Since each node has two nodes, the number of leaf nodes increases as the height increases
        // i.e the leafNumber  = treeHeight ^ 2
        let leafNumber = pow(2.0, Double(treeHeight))
        return Int(leafNumber)
    }
    
    // To find the number of nodes in a perfectly balance tree with a given height
    
    func fincNumberOfNodesInTree(withTreeHeight treeHeight: Int) -> Int {
        var totalNodes = 0
        for level in 0...treeHeight {
            totalNodes += Int(pow(2.0, Double(level)))
        }
        return totalNodes
    }
    


}

extension AVLTreeNode {

    func preOrderTraversal(visit: (Element) -> Void) {
        visit(value)
        leftChildNode?.preOrderTraversal(visit: visit)
        rightChildNode?.preOrderTraversal(visit: visit)
    }
    
    /*
     Post-Order Traversal
      we start by visiting the left and right child nodes of the current node before returning to it
     */
    
    func postOrderTraversal(visit: (Element) -> Void) {
        leftChildNode?.postOrderTraversal(visit: visit)
        rightChildNode?.postOrderTraversal(visit: visit)
        visit(value)
    }
    
    /*
     In-Order Traversal
     
     We start by visiting the left child's current node, then visiting the node itself and then the right child node
     */
    
    func inOrderTraversal(visit: (Element) -> Void) {
        leftChildNode?.inOrderTraversal(visit: visit)
        visit(value)
        rightChildNode?.inOrderTraversal(visit: visit)
    }
    
    private func leftRotation(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> { // Left Rotation is used when a series on right nodes makes the tree unbalance
        // To perform a leftRotation, the right child node is picked as the pivot. i.e the center of rotation
        // This pivot will replace the rotated node as the root of the subtree
        // The node to be rotated will become the left child of the pivot
        
 // step 1: Set pivot
        let rotatingNode = node
        let pivot = rotatingNode.rightChildNode!
        rotatingNode.rightChildNode = pivot.leftChildNode
        
        // step 2:
        // Update the left child node of the pivot using the rotating node
        pivot.leftChildNode = rotatingNode
        
        // step 3:
        // Update the heights of the pivots and the rotating node
        pivot.height = max(pivot.leftChildNodeHeight, pivot.rightChildNodeHeight) + 1
        rotatingNode.height = max(rotatingNode.leftChildNodeHeight, rotatingNode.rightChildNodeHeight) + 1
        
        return pivot
    }
    
    // The right Rotation will be the opposite of the left rotation.
    // The right rotation is used to balance a tree when a series of left nodes cause the imbalance
    
    func rightRotation(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> {
        let rotatingNode = node
        let pivot = rotatingNode.leftChildNode!
        rotatingNode.leftChildNode = pivot.rightChildNode
        pivot.rightChildNode = rotatingNode
        pivot.height = max(pivot.leftChildNodeHeight, pivot.rightChildNodeHeight) + 1
        rotatingNode.height = max(rotatingNode.leftChildNodeHeight, rotatingNode.rightChildNodeHeight) + 1
        return pivot
    }
    
    func rightLeftRotation(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> {
        guard let rightChild = node.rightChildNode else {return node} // check if the right child exist else return the node
        
        node.rightChildNode = rightRotation(rightChild) // This is rotating the rightChild node
        return leftRotation(node) // This is the final rotation
        
    }
    
    
    func leftRightRotation(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> { // The left-right rotation uses the opposite of the right-left rotation
        guard let leftChild = node.leftChildNode else {return node}
        node.leftChildNode = leftRotation(leftChild)
        return rightRotation(node)
    }
    
    var min: AVLTreeNode {
           leftChildNode?.min ?? self
       }
    
    // right - left rotation
    // We perform a right - left rotation when just performing a left rotation don't balance our tree
    // In order to balance our tree, we start by performing a right rotation on the right child before performing the left rotation.
    
    
    /*
     
     50
     / \
    25  75
     \
     37
     /
    36
     
performing just a left rotation on 25, will given us
     
     50 // This is an imbalance tree
     / \
    37  75
    /
   25
   36
     
     */
    
    
    // To resolve this problem, we first perform a right location on the right node before performing the left node
    
    /*
    
     50
     / \
    25  75
     \
     37    ====> Performing right rotation ===>      50
         on the right node (37) will give us        /  \
                                                   25   75
                                                    \
                                                    36
                                                     \
                                                     37
     /
     36
    */
    

    // Now we perform the left rotation
    
    
    // How to check if a binary tree is balance using the balance factor
    //
    
    
    func balanceTree(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> {
        switch node.balanceFactor {
        case 2: // A balance factor of 2 means that the left child is heavier as such we want to use the right or left-right rotation
            if let leftChild = node.leftChildNode, leftChild.balanceFactor == -1 {
                return leftRotation(node)
            } else {
                return rightRotation(node)
            }
        case -2: // A balance factor of -2 means that the right child is heavier as such we want to use the left or right-left rotation
            
            if let rightChild = node.rightChildNode, rightChild.balanceFactor == 1 {
                return rightLeftRotation(node)
            } else {
                return leftRotation(node)
            }
            
        default: // if it's neither -2 or 2, then just return the node because it's balanced
            return node
        }
    }
    
    
    // Self balancing trees avoid performance degradation by performing a balance procedure whenever you try to add or remove elements in the tree

}


class TrieNode<Key: Hashable> {
    var key: Key? // Holds the data for the node
    // The root node of the tree has no key
    // The key is the value attached to a node
    public weak var parentNode: TrieNode?
    
    public var children: [Key: TrieNode] = [:] // This is helps a node hold multiple different elements
    
    public var isTerminating = false // Acts as an indicator for the end of a collection
    
    init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parentNode = parent
    }
    
    
}

class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    public typealias trieNode = TrieNode<CollectionType.Element>
    private let rootNode = trieNode(key: nil, parent: nil)
    
    init(){}
    
    // Four operations for the trie data structure is Insert, contains, remove and prefix match
    
    
    // Tries work with any type that conforms to Collection. The trie will take the collection and represent it as a series of node in which each node maps to an element in the collection
    func insert(_ collection: CollectionType) {
        var current = rootNode // This keeps track of the traversal progress starting with the root Node
        
        for element in collection {
            if current.children[element] == nil { // loops through the collection and stores each element in seperate nodes.
                current.children[element] = TrieNode(key: element, parent: current)
            }
            
            current = current.children[element]!
        }
        current.isTerminating =  true
    }
    
    
    func contains(_ collection: CollectionType) -> Bool {
        var current = rootNode
        
        for element in collection {
            guard let child = current.children[element] else  {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
}

#warning("I need to come back to the Trie Data structure ")

// Binary Search
// Binary Search is an 0(log n)
/*
 Binary Search is one of the most efficient searching algorithms of complexity of 0(log n)
 
 For binary search to take place, the collection must be sorted
 
 the collection must be able to perform index manipulation in constant time
 
 // Steps for implementing binary search on a sorted collection
 
 Step 1: Find the middle index,
 
 Step 2: Check if the item at the middle index is the item we are searching for else
 
 Step 3: Divide the collection into two using the middle index and recursively call our function on the divided parts until we find our item
 
 
 
 
 */
 

public extension RandomAccessCollection where Element: Comparable {

    func binarySearch(value: Element, range: Range<Index>? = nil) -> Index? {
        
        let range = range ?? startIndex..<endIndex
        
        guard range.lowerBound < range.upperBound else {return nil}
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middleIndex = index(range.lowerBound, offsetBy: size / 2)
        
        if self[middleIndex] == value {
            return middleIndex
        } else if self[middleIndex] > value {
            return binarySearch(value: value, range: range.lowerBound..<middleIndex)
        } else {
            return binarySearch(value: value, range: index(after: middleIndex)..<range.upperBound)
        }
        
    }
}

// Sometimes, it'se okay to sort the collection and then use binary search 

 let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
let search31 = array.firstIndex(of: 31)
let binarySearch = array.binarySearch(value: 31)

print("Non-Binary Search for 31 ", search31)
print("Binary Search for 31 ", binarySearch)


func binarySearchWithArr(withArr arr: [Int], withValue value: Int, range: Range<Int>) -> Int? {
    guard arr.count > 1 else {return nil}
    
    if range.lowerBound >= range.upperBound {
        return nil
    }
    
    let middleIndex = (range.lowerBound) + ((range.upperBound - range.lowerBound)/2)
    
    let dupArr = arr
    
    if dupArr[middleIndex] == value {
        return middleIndex
    } else if value < dupArr[middleIndex] {
        return binarySearchWithArr(withArr: dupArr, withValue: value, range: range.lowerBound..<middleIndex)
    } else {
      
        return binarySearchWithArr(withArr: dupArr, withValue: value, range: (middleIndex+1)..<range.upperBound)
    }
}

print(binarySearchWithArr(withArr: array, withValue: 31, range: 0..<array.count))


// Write a function that searches a sorted arr and finds the range of range of indices for a particular element

func getIndicesOfValue(withArr arr: [Int], value: Int) -> Range<Int>? { // This is done in linear time
    
    guard arr.count > 1 else {return 0..<1}
    
    guard let firstIndex = arr.firstIndex(of: value) else {return nil } // This will give us the first index with a value == value
    guard let lastIndex = arr.lastIndex(of: value) else {return nil} // This will give us the last index with a value == value
    
    return firstIndex..<lastIndex

}

//Optimized version for getting the indices in Range

func findIndices(ofValue value: Int, inArr arr: [Int]) -> CountableRange<Int>? {
    
    guard let startIndex = startIndex(ofValue: value, inArr: arr, onRange: 0..<arr.count) else {return nil}
    
    guard let endIndex = endIndex(ofValue: value, inArr: arr, onRange: 0..<arr.count) else {return nil}
    
    return startIndex..<endIndex
    
}

// We need to get the startIndex of a value in our collection

func startIndex(ofValue value: Int, inArr arr:[Int], onRange range: CountableRange<Int>) -> Int? {
    
    let middleIndex = range.lowerBound + ((range.upperBound - range.lowerBound) / 2)
    
    if middleIndex == 0 || middleIndex == arr.count-1 { // if the middle index is the first index or the last index
        if arr[middleIndex] == value {
            return middleIndex
        } else {
            return nil
        }
    }
    
    if arr[middleIndex] == value { // if the previous value is not equal to the value, then we have found the startIndex but if the previous value is thesame, then recursively call startIndex on the left side
        if arr[middleIndex - 1] != value {
            return middleIndex
        } else {
            return startIndex(ofValue: value, inArr: arr, onRange: range.lowerBound..<middleIndex)
        }
    } else if value < arr[middleIndex] {
        return startIndex(ofValue: value, inArr: arr, onRange: range.lowerBound..<middleIndex)
    } else {
        return startIndex(ofValue: value, inArr: arr, onRange: middleIndex..<range.upperBound)
    }
}

func endIndex(ofValue value: Int, inArr arr:[Int], onRange range: CountableRange<Int>) -> Int? {
    
    let middleIndex = range.lowerBound + ((range.upperBound - range.lowerBound) / 2)
    if middleIndex == 0 || middleIndex == arr.count-1 {
        if arr[middleIndex] == value {
            return middleIndex + 1
        }else {
            return nil
        }
        
    }
    
    if arr[middleIndex] == value {
        if arr[middleIndex + 1] != value {
            return middleIndex + 1
        } else {
            return endIndex(ofValue: value, inArr: arr, onRange: middleIndex..<range.upperBound)
        }
    } else if value < arr[middleIndex] {
        return endIndex(ofValue: value, inArr: arr, onRange: range.lowerBound..<middleIndex)
    } else {
        return endIndex(ofValue: value, inArr: arr, onRange: middleIndex..<range.upperBound)
    }
    
}

let dummyArr = [1, 2, 3, 3, 3, 4, 5, 5]
print(getIndicesOfValue(withArr: dummyArr, value: 3))

if let indices = findIndices(ofValue: 3, inArr: dummyArr) {
    print(indices)
}

// With the heap data structure, each level needs to be filled
// i.e each level has twice as much nodes than the previous level
// Given a node at an index, we can access that nodes child nodes by using the following formulas
/*
 The left child of the given node can be found using it's index
 leftChildNodeIndex = 2i + 1 where i is the index of the parent node
 rightChildNodeIndex = 2i + 2
 
*/

// You can get the parent node of a node with a given index by floor((i - 1) / 2) where i is the index of the node

struct Heap<Element: Equatable> {
    
    var elements = [Element]()
    let sort:(Element, Element) -> Bool // This sort type will determine if it's a max or min heap
    
    init(sort: @escaping(Element, Element) -> Bool, elements:[Element]) {
        self.sort = sort
        self.elements = elements
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2-1, to: 0, by: -1) {
                shiftDown(fromIndex: i)
            }
        }
    }
    
    var isEmpty: Bool { // This gives us if the elements in the heap are empty or not
        elements.isEmpty
    }
    
    var count: Int { // This counts the numbers of elements in the heap
        elements.count
    }
    
    func peek() -> Element? {
        
        return elements.first
    }
    
    func leftChildNodeIndex(ofParentNodeatIndex index: Int)-> Int {
        return (2 * index) + 1
    }
    
    func rightChildNodeIndex(ofParentNodeAtIndex index: Int)-> Int {
        return (2*index) + 2
    }
    
    func parentNodeIndex(ofChildNodeAtIndex childNodeIndex: Int) -> Int {
        return (childNodeIndex - 1) / 2
    }
    
    // A remove operation on a heap will remove the maximum element on the heap which is the root node
    /*
     Step one: We have to swap the root node(to be taken out) with the last element on the heap
     Step two: Reorganize our heap by performing a shift down
     Step three: To perform a shift down, we check the current value's left and right node. if one child has a greater value than the current node, we swap that node with the parent node. if both are greater than the current value, then we swap the parent with the greater value
     
     */
    
    mutating func remove()-> Element? {
        guard !isEmpty else {return nil} // We first need to check to see if our heap is empty or not
        
        // Step 1: Swap current parent node with the last node
        
        elements.swapAt(0, elements.count-1)
        
        // Step 2: Perform ShiftDown to reorganize heap
        defer {
            shiftDown(fromIndex: 0)
        }
        // step 3: Return the old parent
        
        return elements.removeLast()
 
    }
    
    mutating func shiftDown(fromIndex index: Int) {
        var parent = index // This is storing the parent index which is 0 by default
        
        // we have to perform our shiftDown recursively until our base case is met
        
        while true  {
            let leftIndex = leftChildNodeIndex(ofParentNodeatIndex: parent) // This is getting the parent's leftChildIndex
            let rightIndex = rightChildNodeIndex(ofParentNodeAtIndex: parent) // This getting the parent's rightChildIndex
            
            var candidate = parent // This keeps track of which index to swap with the parent index
            
            if leftIndex < count && sort(elements[leftIndex], elements[candidate]) { // If there is a left child and it has a larger value than the parent, then swap the indexes
                candidate = leftIndex
            }
            
            if rightIndex < count && sort(elements[rightIndex], elements[candidate]) { // If there is a right child and it has a larger value than the parent, then swap the index
                          candidate = rightIndex
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
        
    }
    
    
    mutating func insert(withValue value: Element){ // for the insert, we insert the element to the end of the tree and then if the value is greater than it's parent nodes, we perform a shiftUp operation
        
        // Step 1: Add the element to the end of the tree
        
        elements.append(value)
       
        
        // setp 2: Perform a shift up
        
        shiftUp(fromIndex: elements.count-1)
    }
    
    // Shift up operation
    
    mutating func shiftUp(fromIndex childIndex: Int) { // We are performing a shiftUp from the index of our insertedNode(the new last element of the tree)
        
        var child = childIndex
        
        var parent = parentNodeIndex(ofChildNodeAtIndex: child) // We get the parent of our child node
        while child > 0 && sort(elements[child], elements[parent]) { // Our algorithm swaps the current node with the parent node as long as the value of the child node is greater than the currentChild node
            elements.swapAt(child, parent)
            child = parent
            parent = parentNodeIndex(ofChildNodeAtIndex: child)
        }
    }
    

    // Write a func that checks if a given array is a min heap
    // To do this: we need to go through all the parent nodes and compare them with their child node

    func isMinHeap<Element: Comparable>(elements: [Element]) -> Bool { // This is an 0(n) operation because we have to go through all the nodes on the heap
        guard !elements.isEmpty else {return true}
        
        for parentIndex in stride(from: elements.count / 2-1, to: 0, by: -1) { // This is looping backwards from the middle of our elementsArr
        
        let leftChildIndex = leftChildNodeIndex(ofParentNodeatIndex: parentIndex)
        let rightChildIndex = rightChildNodeIndex(ofParentNodeAtIndex: parentIndex)
            
            if elements[leftChildIndex] < elements[parentIndex] {
                return false
            }
            
            if rightChildIndex < elements.count && elements[rightChildIndex] < elements[parentIndex] {
                return false
            }
        
        
    }
        return true
    }
    
    // The insert operation is a 0(log n) operation
    
    // To remove an element on the tree with a given index
    
    mutating func remove(atIndex index: Int) -> Element? {
        guard index < elements.count else {return nil} // if the given index is not within 0...the last index, then the index does not exist and the element cannot be in the arry as well
        
        if index == elements.count - 1 { // If the index is the last index, then return the last element on the array
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count-1) //if the index is not the last index, then perform our shiftUp and down operations
            defer {
                shiftDown(fromIndex: index)
                shiftUp(fromIndex: index)
            }
        }
        return elements.removeLast()
    }
    
    // Searching for an element in a heap. To find the index of an element
    
//    func index(ofElement element:Element, startingAtIndex index: Int) -> Int? {
//        if index >= count { // if the index is out of bounds, return nil
//            return nil
//        }
//
//        if sort(element, elements[index]) {
//            return nil
//        }
//
//        if element == elements[index] { // if the element is equal to the element at index, then return index
//            return index
//        }
//
//
//        if let j = index(ofElement: element, startingAtIndex: leftChildNodeIndex(ofParentNodeatIndex: index)) {
//            return j
//        }
//
//        if let l = index(ofElement: element, startingAtIndex: rightChildNodeIndex(ofParentNodeAtIndex: index)) {
//            return l
//        }
//
//        return nil
//
//
//
//    }
    
}
// Heap will be like
/*
 
                    12
                    / \
                    8  7
                    /\ /\
                    6 4 3 1
 */

var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])

//while !heap.isEmpty {
//    print(heap.remove()!)
//}

// Exercise on Heap: Find nth smallest number, i.e count all the numbers on the heap until it hits the target number

func findNthSMallestInt(withArr arr: [Int], withNthNumber nthNumber: Int) -> Int? {
    
    var heap = Heap(sort: <, elements: arr) // Creating the heap with our arr
    var currentCount = 1 // This tracks the nth smallest element
    
    while !heap.isEmpty {
        let element = heap.remove() // This removes the parent nodes until the count is == to the nthNumber
        print(element)
        if currentCount == nthNumber {
            return  element
        }
        currentCount += 1
    }
    
    return nil

}

let heapArr = [3, 10, 18, 5, 21, 100]

//print(findNthSMallestInt(withArr: heapArr, withNthNumber: 3))


// Exercise 2: Combine two heaps

func combineTwoHips(withHeapArr1 heap1Arr:[Int], withHeapArr2 heap2Arr: [Int]) -> Heap<Int> { // To merge two heaps, just add there araay properties together and recall build heap
    let arr = heap1Arr + heap2Arr
    let heap = Heap(sort: <, elements: arr)
    
    return heap // Runtime of merging two heaps is 0(n)
}



// Priority Queues
// priority queues are special type of queues that dequeue elements not in a FIFO manner but on a priority base
// There are two forms of Priority Queues
// Max-Priority Queues == In which the element in front is always the largest
// Min-Priority Queues == In which the element in front is always the smallest
// Priority queues can help with identifying the min and max in a given set of data
// Priority queues can be created with sorted Arrays, Balanced Binary Search Trees, Heap
// Creating a priority queue with a the heap data structure is best because
// 1. We can person the insert at 0(log n)
// To get the min and max values are also constant time operations

public protocol myQueue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool {get}
    var peek: Element? {get}
    
}

struct PriorityQueue<Element: Equatable>: myQueue { // Conforming to the existing queue protocol
    var heap: Heap<Element> // We need this heap to be able to prepare the queue
    init(sort: @escaping(Element, Element) -> Bool, elements: [Element]) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    
    
    
   // var elements = [Element]()
    mutating func enqueue(_ element: Element) -> Bool { // Inserts an element into the queue and returns true if it's a success. The overrall performance is 0(log n)
        heap.insert(withValue: element)
        return true
    }

    mutating func dequeue() -> Element? {// removes the element with the highest priority and returns it
        heap.remove()
    }

    var isEmpty: Bool { // checks to see if the queue is empty or not
        heap.isEmpty
    }
    var peek: Element? { // returns the element with the highest priority
        heap.peek()
    }

}



var priotityQueue = PriorityQueue(sort: <, elements: [1,12,3,4,1,6,8,7])

//while !priotityQueue.isEmpty {
//    print(priotityQueue.dequeue())
//}




struct PriorityQueueWithArr<Element: Equatable>: myQueue {
       var arr = [Element]()
    
    let sort: (Element, Element) -> Bool
    
      mutating func enqueue(_ element: Element) -> Bool {
        //we compare the priority of all the elements in the array with the new element to know where to append the new element
        
        for (index, existingElement) in arr.enumerated() {
            if sort(element, existingElement) { // if our new element has a higher priority, then insert our new element at that index
                arr.insert(element, at: index)
            }
        }
        arr.append(element) // if the element does not have a higher priority than any element on the arr, then append it
 
          return true
      }
    
   mutating func dequeue() -> Element? {
   return arr.removeFirst()
    }
    
    var isEmpty: Bool {
        arr.isEmpty
    }
    
    var peek: Element? {
        arr.first
    }
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element]) {
        self.sort = sort
        self.arr = elements
        self.arr.sort(by: sort) // This will give our elements a sorting order
    }
}


// Exercise: Prioritize a waitlist

struct Person: Equatable {
    let name: String
    let age: Int
    let isMilitary: Bool
}

func sortWaitList(withPerson1 person1: Person, withPerson2 person2: Person) -> Bool {
    
    if person1.isMilitary == person2.isMilitary {
        return person1.age > person2.age
    }
    
    return person1.isMilitary
}


func bubbleSort(_ arr: inout [Int]) -> [Int] {
    
    guard arr.count >= 2 else {return arr} // ensure there are more than 2 items in the array else just return the array
    
    
    for i in 0..<arr.count { // This will be the outer loop
        var swapped = false
        
        for j in 0..<arr.count {
            if arr[j] > arr[i] {
                arr.swapAt(i,j)
                swapped = true
            }
        }
        
        if !swapped {
            return arr
        }
    }
    return arr
}
// The bubble sort algorithm is 0(n^2) because the time = number^2

var unsortedArr = [9, 4, 10, 3]
let sortedArr = bubbleSort(&unsortedArr)
//print("This is the unsorted version",unsortedArr)
//print("This is the sorted version", sortedArr)


// Selection Sort

// Selection sort is another 0(n^2) operation
// Unlike bubble sort, selection sort only swaps at the end of each iteration

func selectionSort(_ arr: inout [Int]) -> [Int] { // This is a 0(n^2) operation
    guard arr.count >= 2 else {return arr}
    
    for currentIndex in 0..<arr.count {
        var lowestElementIndex = currentIndex
        
        for nextItemIndex in (currentIndex + 1)..<arr.count {
            
            if arr[lowestElementIndex] > arr[nextItemIndex] { // if the value of the index infront is smaller than our current smallest value index, then update the index of our smallest value to that
                lowestElementIndex = nextItemIndex
            }
        }
        
        if lowestElementIndex != currentIndex { // n
            arr.swapAt(lowestElementIndex, currentIndex)
        }
    }
    
    return arr
    
}

// Insertion sort

// Insertion sort is another 0(n^2) sorting algorithim

func insertionSort(_ arr: inout [Int]) -> [Int] {
    guard arr.count >= 2 else {return arr}
    
    for currentIndex in (1..<arr.count) {
        
        for shiftingIndex in 1...currentIndex {
            
            if arr[shiftingIndex] < arr[shiftingIndex - 1] { // This compares the current index with his previous index
                arr.swapAt(shiftingIndex, shiftingIndex - 1)
            } else {
                break
            }
            
        }
    }
    return arr 
}
 
func mergeSort(withArr arr: [Int]) -> [Int] { // The time complexity of merge sort is 0(n log n) becauase the merging part is n while the recursive sorting is log n
    
    // make sure the arr to be sorted is has more than 1 element else just return it
    
    guard arr.count > 1 else {return arr}
    
    // Divide the arr into half using the middleIndex
    
    let middleIndex = arr.count / 2
    let leftMerge = mergeSort(withArr: Array(arr[0..<middleIndex]))
    let rightMerge = mergeSort(withArr: Array(arr[middleIndex..<arr.count]))
    
    var leftIndex = 0
    var rightIndex = 0
    
    var result = [Int]()
    

    while leftIndex < leftMerge.count && rightIndex < rightMerge.count {
        
        let leftElement = leftMerge[leftIndex]
        let rightElement = rightMerge[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if rightElement < leftElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            result.append(rightElement)
            rightIndex += 1
            leftIndex += 1
        }
    }
    
    if leftIndex < leftMerge.count {
        result.append(contentsOf: leftMerge[leftIndex...])
    }
    
    if rightIndex < rightMerge.count {
        result.append(contentsOf: rightMerge[rightIndex...])
    }
    
 
    return result
}


let unsortedArrr = [88, 410, 1772, 20]

let mergeSortedArr = mergeSort(withArr: unsortedArrr)
//print(mergeSortedArr)

//Implementation of Radix Sort

extension Array where Element == Int {
    public mutating func radixSort(){
        let base = 10 // we are sorting base 10 integers
        var done = false // This tracks our progress
        var digits = 1
        
        while !done {
            done = true
            
            // perform bucket sort
            var buckets:[[Int]] = .init(repeating: [], count: base)
            forEach { (number) in
                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)
                digits *= base
                self = buckets.flatMap{$0}
                if remainingPart > 0 {
                    done = false
                }
            }
        }
        
        //print(self)
        
    }
}


var arrayy = [88, 410, 1772, 20]
print("This is the original array: \(arrayy)")
arrayy.radixSort()
print("This is the sorted array: \(arrayy)")


// Heap Sort is a comparison based sort algorithm that sorts a collection in an ascending order using a heap.

extension Heap {
    func sorted() -> [Element] {
        
        var heap = Heap(sort: sort, elements: elements) // we start by making a copy of the heap.
        
        for index in heap.elements.indices.reversed() { // We loop through the elements of the heap and swap the first element with the last element
            heap.elements.swapAt(0, index) // This moves the largest unsorted element to it's correct position
            heap.shiftUp(fromIndex: 0) // then we shift down the new root node to keep the heap valid
            // Heap sort is an 0(n log n) operation because each shift down is an 0(log n) operation and since we have to perform the process for all the elements, it becomes an 0(n log n)  operation.
        }
        return heap.elements
    }
}


// Quick Sort // Quick sort is another comparison based sort algorithm which uses the divide and conquer concept.
// The pivot is the middle of our array

func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else {return a } // we first ensure that our array is greater than 1 else return
    
    // choosing the pivot ..... the item at the middle index
    
    let pivot = a[a.count / 2] // this is getting the item at the middle index
    
    print("This is the pivot", pivot)
    
    // we get all the items lesser than the pivot
    
    let lessThanPivot = a.filter{$0 < pivot} // This will get use all the items that are lesser than the pivot
    
        print("This are the items lesser than the pivot", lessThanPivot)
    
    // then we get all the items that are equal to the pivot
    
    let equalToPivot = a.filter{$0 == pivot} // this will get us all the items that are equal to the pivot in the array
     print("This are the items equal to the pivot", equalToPivot)
    // Finally we get all the items that are greater than the pivot
    
    let greaterThanPivot = a.filter{$0 > pivot} // This will give us all the items that are greater than the pivot
     print("This are the items greater than the pivot", equalToPivot)
    // we now have to recursively do this on all the 3 versions of our array
    return quickSort(lessThanPivot) +  equalToPivot + quickSort(greaterThanPivot)
}

var quickSortArray =  [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
//let quickSorting = quickSort(quickSortArray)
//print(quickSorting)

// Partitioning Strategies for picking the best pivot
// The Lomuto's partitioning ..... The lomuto's partitioning always chooses the last element as the pivot

func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    
    // The three parameters of this partition are,
    /*
     The arr,
     the range (low and high bounds)
     */
    
    // The function should return the index of the pivot
    
    var i = low // This represents how many elements are less than the current pivot
    let currentPivot = a[high] //This sets the current pivot as the last element on our arr
    for index in low..<high {
        if a[index] <= currentPivot {
            a.swapAt(i, index)
            i += 1
        }
    }
    
    a.swapAt(i,high)
    return i
}

func quickSortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivot = partitionLomuto(&a, low: low, high: high) // this gives us the pivot
        quickSortLomuto(&a, low: low, high: pivot - 1) // this sorts the items before  the pivot
        quickSortLomuto(&a, low: pivot + 1, high: high) // this sorts the items behind the pivot
    }
}


//let lomutoQuickSort = quickSortLomuto(&quickSortArray, low: 0, high: quickSortArray.count - 1)
//print(quickSortArray)

// The Hoare's Partitioning === Always picks the first item as the pivot

func hoarePartition<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    
    var pivot = a[low] // this will be the first pivot .... the first element on our array
    var i = low - 1 // index i identifies the region for items less than or equal to the pivot. i.e every item before index i is less than the pivot
    
    var j = high + 1 // every item after j is greater than or equal to the pivot
    
    while true {
        repeat{ j -= 1} while a[j] >  pivot // while the item at j is greater than pivot, keep decreasing j. We keep decreasing it reaches an element that is not greater than the pivot
        repeat {i += 1} while a[i] < pivot // while the item at i is less than pivot, keep increasing it. Keep increasing the index i until it reaches an element that is not lesser than the pivot
        
        if i < j {
            a.swapAt(i, j)
        } else {
            return j // return j when i and j overlap
        }
    }
}

func hoareQuickSort<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    let pivot = hoarePartition(&a, low: low, high: high)
    hoarePartition(&a, low: low, high: pivot)
    hoarePartition(&a, low: pivot + 1, high: high)
}

//let hoareQuickSorting = hoareQuickSort(&quickSortArray, low: 0, high: quickSortArray.count-1)
//print(quickSortArray)

/*
 An ideal pivot will split the elements in the array evenly where one side contains the less and while the other the items that are greater than. Using the first or the last element of an already sorted array as a pivot makes quicksort perform an insertion sort. There we have to find the median of the three partition strategies
 
 // we find the median of the first, middle and last element and use that as the pivot
 */


func medianOfThree<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let center = (low + high) / 2
    
    if a[low] > a[center] {
        a.swapAt(low, center)
    }
    
    if a[low] > a[high] {
        a.swapAt(low, high)
    }
    
    if a[center] > a[high] {
        a.swapAt(center, high)
    }
    
    
    return center
    
}

func quickSortWithMedian<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    let pivot = medianOfThree(&a, low: low, high: high)
    quickSortWithMedian(&a, low: low, high: pivot)
    quickSortWithMedian(&a, low: pivot + 1, high: high)
}

let medianSort = quickSortWithMedian(&quickSortArray, low: 0, high: quickSortArray.count-1)
print("This is the sorted arr using medianOfThree as pivot",quickSortArray)

/*
 
 Implementing quickSort using the Dutch Flag method ..... This method helps us account for duplicates
 */


func dutchFlagPartition<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {
    let pivotElement = a[pivotIndex]
    var smaller = low // This capsures all the items that are smaller than the pivot
    var equal = low // this captures allm the items that are equal to the pivot
    var larger = high // all the items that are larger
    
    
    while equal <= larger {
        if a[equal] < pivotElement {
            a.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if a[equal] == pivotElement {
            equal += 1
        } else {
            a.swapAt(equal, larger)
            larger -= 1
        }
    }
    
    return (smaller, larger)
    
}

// Merge sort works best when you have large data
// Merge Sort is more stable and can guarantee an 0(n log n) operation

// Graphs

// Implementation of Graphs

enum EdgeType { // This will determine the type of graph we are dealing with
    case directed
    case undirected
    
}


protocol Graph {
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    
     func addUnDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    
    func add(_ edge: EdgeType,from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}


// A vertex

struct Vertex<T> {
    // Properties of a vertex
    public let index: Int // This is the index of that point on the graph .... a point on the graph is called a vertex
    public let data: T // this the data held by that vertex
}


extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}


extension Vertex: CustomStringConvertible {
    public var description: String {
        "\(index): \(data)"
    }
}

struct Edge<T> { // An edge on a graph is a line that connects two Vertex(points) of a graph
    // Properties
    
    let source: Vertex<T> // This is the starting point (Vertex)
    let destination: Vertex<T> // This is the end of the edge (vertex)
    let weight: Double? // this holds the value between two vertexes
    
}

// Adjacency List will enable us find list of outgoing edges for every point on the graph

public class AdjacencyList<T: Hashable>: Graph {
    func createVertex(data: T) -> Vertex<T> {
        let newVertex = Vertex(index: adjacencies.count, data: data) // This method takes data and creates a new verTex with it
        adjacencies[newVertex] = [] // It uses that vertex as a key on the dictionary and assign a new value of an empty edge
        return newVertex // we return the new vertex that we have made
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight) // this creates a new edge between two vertexes with a weight of weight
        
        adjacencies[source]?.append(edge) // this methode creates a new edge and stores the edge on the dictionary
    }
    
    func addUnDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight) // since undirected edges are bidirectional, we need to repeat the process for both vertex
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    func add(_ edge: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) { // when adding an edge, we check to see which type of edge it is. if it's a directed edge, then add as a directed edge else add as an undirected edge
        switch edge {
        case .directed:
      addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUnDirectedEdge(from: source, to: destination, weight: weight)
        }
    }
    
    
    
    func edges(from source: Vertex<T>) -> [Edge<T>] { // This will take in a vertex (point on the graph and return all the edges connected to it)
        if let edgesFromSource = adjacencies[source] {
            return edgesFromSource
        } else {
            return []
        }
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? { // This returns the weight between two Vertex
        
        let allEdgesFromSource = adjacencies[source]
        let weightFromDestination = allEdgesFromSource?.filter{$0.destination == destination}.first?.weight
        return weightFromDestination
    }
    
    typealias Element = T
    
   
    
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:] // For every vertex on the graph, this will hold a corresponding list of edges connected to that Vertex
    public init(){}
}


// To print out all the Vertices and their edges, we just print out the keys and their values

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        
        for (vertex, edges) in adjacencies {
            var edgesString = ""
            
            for (index, edge) in edges.enumerated() {
                
                if index != edges.count - 1 {
                    edgesString.append("\(edge.destination), ")
                } else {
                    edgesString.append("\(edge.destination)")
                }
            }
            
            result.append("\(vertex) ---> [\(edgesString)] \n") // this will return the vertex and it's edges as an array
        }
        return result
        
    }
}

let graph = AdjacencyList<String>()
let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongKong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanFrancisco = graph.createVertex(data: "San Francisco")
let washingtonDC = graph.createVertex(data: "Washington DC")
let austinTexas = graph.createVertex(data: "Austin Texas")
let seattle = graph.createVertex(data: "Seattle")

graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)

print( "This is the flight graph", graph)

/*
 
 If there are few edges in a graph, it is called a sparse graph and should use an adjacent list
 
 If there are alot of edges in the graph, we should use adjacency matrix because it's a densed graph.
 
 Adjacency list stores a list of outgoing edges for every vertex
 */


 // Find number of paths between two vertices in a directed graph

extension Graph where Element: Hashable {
    
     func numberOfPaths(from source: Vertex<Element>, to destination: Vertex<Element>) -> Int {
        
        var numberOfPaths = 0 // this keeps track of the number of paths found between the source and the destination
        var visited: Set<Vertex<Element>> = [] // keeps track of all the visited vertices
        paths(from: source, to: destination, visited: &visited, pathCount: &numberOfPaths)
        return numberOfPaths
    }
    
    func paths(from source: Vertex<Element>, to destination: Vertex<Element>, visited: inout Set<Vertex<Element>>, pathCount: inout Int) {
        visited.insert(source)
        if source == destination {
            pathCount += 1
        } else {
            let neighbors = edges(from: source)
            
            for edges in neighbors {
                if !visited.contains(edges.destination) {
                    paths(from: edges.destination, to: destination, visited: &visited, pathCount: &pathCount)
                }
            }
        }
        visited.remove(source)
    }
}


//Breadth-First Search




func addTwoNumbers(_ l1: LListNode<Int>?, _ l2: LListNode<Int>?) -> LListNode<Int>? {
    
    var list1Head = l1
    var list2Head = l2
    var remainder = 0
    var newList: LListNode<Int>?
    
    
 
    while let list1Data = list1Head, let list2Data = list2Head {
        
        let sum = (remainder + list1Data.value + list2Data.value)
        
        if sum < 10 {
            print(sum)
            newList?.next = LListNode(value: sum)
        } else {
            
            let division = sum % 10
            remainder = division
            newList?.next = LListNode(value: division)
            print(division)
        }
        
        list1Head = list2Data.next
        list2Head = list2Data.next
    }
    
    return newList
}

let lisst1 = linkedlist<Int>()
let twwoNode = LListNode(value: 2)
let fourrNode = LListNode(value: 4)
let threerNode = LListNode(value: 3)

twwoNode.next = fourrNode
fourrNode.next = threerNode

let seveenNode = LListNode(value: 7)
let zeroNode = LListNode(value: 0)
let eighttNode = LListNode(value: 8)

seveenNode.next = zeroNode
zeroNode.next = eighttNode

let addNodes = addTwoNumbers(twwoNode, seveenNode)
//print("This is the added version",addNodes?.description)



