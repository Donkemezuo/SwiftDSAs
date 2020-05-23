//
//  ViewController.swift
//  DataStructuresAndAlgorithm
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/20.
//  Copyright © 2020 EnProTech Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // print(rotateArr(withArray: [1, 2, 3, 4, 5], withNumberOfTimes: 4))
        //  print(minimumSwaps(arr: [4,3,1,2]))
        //  print(adjacentElementsProduct(inputArray: [3, 6, -2, -5, 7, 3]))
        print(matrixElementsSum(matrix: [[1, 1, 1, 0],
                                         [0, 5, 0, 1],
                                         [2, 1, 3, 10]]))
        print(reverseInteger(x: -3424))
        print(classifyStrings(s: "lrsesknaiotmqanvt"))
        print(countMoneyOne(cash: myCash))
        print(countMoneyThree(cash: myCash))
        print(validCustomers)
        print(budgetResult(transactions: budget))
        print(directionReduction(directions: directions))
      //  print(reduceDirections(directions: directions))
        
        // print(rotLeft(a: [1, 2, 3, 4, 5], d: 6))
    }
    
    
    // Question: Rotate an array n number of times
    
    private func rotateArr(withArray arr:[Int], withNumberOfTimes numberOfTimes: Int) -> [Int] { // This solution appends the first element on the array to the back, then remove from the front and continue this process until times hits 0
        var result = arr
        var times = numberOfTimes
        
        while times != 0 {
            times -= 1
            result.append(result[0])
            result.remove(at: 0)
        }
        return result
    }
    // Find minimum swaps
    
    func minimumSwaps(arr: [Int]) -> Int {
        var swapCount = 0
        var swapArr = arr
        for i in 0..<swapArr.count {
            
            for j in 1..<swapArr.count - i {
                
                if swapArr[j] < swapArr[j - 1] {
                    let temp = swapArr[j - 1]
                    swapArr[j-1] = swapArr[j]
                    swapArr[j] = temp
                    swapCount += 1
                }
            }
        }
        return swapCount
        
    }
    
    func adjacentElementsProduct(inputArray: [Int]) -> Int {
        
        var dictionary: [Int: (Int, Int)] = [:]
        var j = 0
        
        for i in 0..<inputArray.count {
            j = i + 1
            guard j < inputArray.count else {return dictionary.keys.max()!}
            
            let product = inputArray[i] * inputArray[j]
            dictionary[product] = (inputArray[i],inputArray[j])
        }
        
        //dump(dictionary)
        
        return dictionary.keys.max()!
    }
    
    
    func matrixElementsSum(matrix: [[Int]]) -> Int {
        
        var firstArr = [Int]()
        var secondArr = [Int]()
        var thirdArr = [Int]()
        var total = 0
        
        for index in 0..<matrix.count {
            if index == 0 {
                firstArr = matrix[index]
            } else if index == 1 {
                secondArr = matrix[index]
            } else {
                thirdArr = matrix[index]
            }
        }
        
        for i in 0..<firstArr.count {
            
            if firstArr[i] != 0 {
                total += firstArr[i]
            }
            
            if firstArr[i] != 0 && secondArr[i] != 0 {
                total  += thirdArr[i]
            }
            
            if secondArr[i] != 0 && firstArr[i] != 0 {
                total += secondArr[i]
            }
        }
        
        return total
    }
    
    
}

func reverseInteger(x: Int) -> Int {
    var y = String(x)
    var result = ""
    
    while !y.isEmpty {
        guard let lastNumber = y.popLast() else {return 0}
        if lastNumber.isNumber {
            result += String(lastNumber)
        }
    }
    
    guard let returningResult = Int(result) else {return 0}
    
    if x < 0 {
        return -returningResult
        
    } else {
        
        return returningResult
    }
}

func classifyStrings(s: String) -> String {
    
    var nextIndex = 0
    let vowels:[Character] = ["a","e","i","o","u"]
    let sArr = Array(s)
    
    if s.count == 1 && Character(s) == "?" {
        return "good"
        
    }
    
    if sArr.contains("?") && sArr.count < 3 {
        return "mixed"
    }
    
    for i in 0..<sArr.count {
        nextIndex += 1
        guard nextIndex < s.count else {return "bad"}
        let nextChar = sArr[nextIndex]
        if vowels.contains(sArr[i]) && vowels.contains(nextChar) {
            print(nextChar)
            print(sArr[i])
            return "bad"
        } else if nextChar == Character("?") {
            return "mixed"
        } else if vowels.contains(sArr[i]) && !vowels.contains(nextChar) {
            
            return "good"
        } else if sArr[i] == Character("?") {
            return "mixed"
        }
    }
    
    return "mixed"
}






/*
 
 A very hungry rabbit is placed in the center of of a garden, represented by a rectangular N x M 2D matrix.
 
 The values of the matrix will represent numbers of carrots available to the rabbit in each square of the garden. If the garden does not have an exact center, the rabbit should start in the square closest to the center with the highest carrot count.
 
 On a given turn, the rabbit will eat the carrots available on the square that it is on, and then move up, down, left, or right, choosing the square that has the most carrots. If there are no carrots left on any of the adjacent squares, the rabbit will go to sleep. You may assume that the rabbit will never have to choose between two squares with the same number of carrots.
 
 Write a function which takes a garden matrix and returns the number of carrots the rabbit eats. You may assume the matrix is rectangular with at least 1 row and 1 column, and that it is populated with non-negative integers. For example
 
 */

/*
 
 Matrix = [[5, 7, 8, 6, 3],
 [0, 0, 7, 0, 4],
 [4, 6, 3, 4, 9],
 [3, 1, 0, 5, 8]]
 
 */

func getMiddleCoordinatesOfMatrix(withMatrix garden: ([[Int]])) -> (Int, Int) {
    
    var max = 0
    var row = 0
    var column = 0
    
    var rows = [garden.count / 2, garden.count / 2]
    var columns = [garden[0].count / 2, garden[0].count]
    
    if garden.count % 2 == 0 {
        rows[0] -= 1
    }
    
    if garden[0].count % 2 == 0 {
        columns[0] -= 1
    }
    
    for rw in rows {
        for col in columns {
            
            if garden[rw][col] > max {
                max = garden[rw][col]
                row = rw
                column = col
                
            }
            
        }
    }
    return (row, column)
}


//private func calculateTotalCarrots(withGardenMatrix matrix:[[Int]], row: Int, column: Int) -> Int {
//    var max = 0
//    var nextRowInMatrix:Int?
//    var nextColumnInMatrix:Int?
//    var totalCarrots = 0
//    var garden = matrix
//
//    for (rw, c) in [[-1, 0], [1, 0], [0, -1], [0, 1]].enumerated() {
//
//        for index in c {
//            let columIndex = column + index
//            let rowIndex = rw + row
//              if rowIndex >= 0 && (rw + row) < matrix.count &&  (columIndex >= 0 & index + column < matrix[row]) {
//
//                  if matrix[row + rw][column + index] > max {
//                      max = matrix[row + rw][column + index]
//                      nextRowInMatrix = row + rw
//                      nextColumnInMatrix = column + index
//                  }
//              }
//        }
//    }
//
//    totalCarrots = matrix[row][column]
//    garden[row][column] = 0
//
//    if let nextRowIndex = nextRowInMatrix, let nextColIndex = nextColumnInMatrix, max > 0 {
//       totalCarrots += calculateTotalCarrots(withGardenMatrix: garden, row: nextRowIndex, column: nextColIndex)
//    }
//
//    return totalCarrots
//
//}

//func getTotalCarrot(withMatrix matrix:[[Int]]) -> Int{
//
//    guard matrix.count > 0 else {return 0}
//
//    var garden = matrix
//
//    for row in garden {
//
//        let (row, col) = getMiddleCoordinatesOfMatrix(withMatrix: matrix)
//
//        return calculateTotalCarrots(withGardenMatrix: garden, row: row, column: col)
//
//    }
//}


//https://github.com/jordanpaulchan/coding-challenges/blob/master/hungry-rabbit/hungry-rabbit.py
//https://repl.it/repls/AcclaimedWebbedFirefly




func countMoney (cash cashInventory: Dictionary<Int, Int>) -> Int {
    var myTotal = 0
    for denomination in cashInventory {
        myTotal += denomination.value * denomination.key
    }
    return(myTotal)
}

var myCash = [100: 0, 50: 0, 20: 2, 10: 3, 5:1, 1:5]


func countMoneyOne (cash cashInventory: Dictionary<Int, Int>) -> Int {
    
    return cashInventory.map {denomination, totalBills in denomination * totalBills}.reduce(0, +)
    
}

//func countMoneyTwo(cash cashInventory: Dictionary<Int, Int>) -> Int {
//
//    return cashInventory.merge {denomination, totalBills in denomination * totalBills}.reduce(0, +)
//
//}

func countMoneyThree(cash cashInventory: Dictionary<Int, Int>) -> Int {
    
    return cashInventory.reduce(0, {runningTotal, currentValues in return runningTotal + currentValues.key * currentValues.value})
}


//func countMoneyFour(cash cashInventory: Dictionary<Int, Int>) -> Int {
//
//    return cashInventory.myCash.count (0, {runningTotal, currentValues in return runningTotal + currentValues.key * currentValues.value})
//}

struct Customer {
    let firstName: String?
    let lastName: String?
    let email: String
}

let c1 = Customer(firstName: "Keith", lastName: nil, email: "keit@test.com")
let c2 = Customer(firstName: nil, lastName: "Ben", email: "bent@test.com")
let c3 = Customer(firstName: "Annie", lastName: "Tam", email: "keit@test.com")

var arr = [c1, c2, c3]

let validCustomers = arr.filter{$0.lastName != nil && $0.firstName != nil}.map{$0.firstName}

var budget = [100,-200,600]
func budgetResult(transactions: [Int]) -> Bool {
    
    guard let startValue = transactions.first else {return true}
    var total = 0
    
    for index in 1..<transactions.count - 1 {
        total += transactions[index]
    }
    
    
    if (startValue - abs(total)) > 0 {
        
        return true
    } else {
        
        return false
    }
}


func directionReduction(directions: [String]) -> [String] {
    
    //var startIndex = 0
    var nextIndex = 0
    var treasureDirection = directions
    
    
    
    for (index, direction) in treasureDirection.enumerated(){

        guard nextIndex <= treasureDirection.count - 1 else {return treasureDirection}
        nextIndex += 1
          
        if (direction,treasureDirection[nextIndex]) == ("NORTH", "SOUTH") {
            treasureDirection.remove(at: index)
            treasureDirection.remove(at: nextIndex)
            print(treasureDirection)
        } else if (direction,treasureDirection[nextIndex]) == ("EAST", "WEST") {
            treasureDirection.remove(at: index)
            treasureDirection.remove(at: nextIndex)
             print(treasureDirection)
            
        } else if (direction,treasureDirection[nextIndex]) == ("SOUTH", "NORTH") {
            treasureDirection.remove(at: index)
            treasureDirection.remove(at: nextIndex)
             print(treasureDirection)
        } else if (direction,treasureDirection[nextIndex]) == ("WEST", "EAST") {
            treasureDirection.remove(at: index)
            treasureDirection.remove(at: nextIndex)
            print(treasureDirection)
        }
    }
    
    //print(treasureDirection)
    return treasureDirection
    
}

var directions = ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "SOUTH", "NORTH", "WEST"]

var allDirections = ["NORTH", "SOUTH", "EAST", "WEST"]



​
​

