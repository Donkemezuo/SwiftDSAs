import Cocoa

var str = "Hello, playground"

func reverseStr(inputStr: String) -> String {
    var inputStr = inputStr
    var result = ""
    while !inputStr.isEmpty {
        result += String(inputStr.popLast()!)
    }
    
    return result
}

let reverse = reverseStr(inputStr: "Tariladou")

print(reverse)

let grades: [[(String, Int)]] = [
    [(name: "Alan", 80), (name: "Alan", grade: 70), (name: "Alan", grade: 75)],
     [(name: "Eli", 90), (name: "Eli", grade: 95), (name: "Eli", grade: 100)],
    [(name: "Antonio", 80), (name: "Antonio", grade: 85), (name: "Antonio", grade: 87)]
]


private func mergeAllGrades(fromAllGradesData grades: [[(String, Int)]]) -> [(String, Int)] {
    let mergedData = grades.flatMap {$0}
    return mergedData
}

// Return the student who's average is equal to the average of all the grades
private func calculateAllGradesAverage(fromAllGradesData grades: [(String, Int)]) -> Int { // This helper method goes through the entire database of grades and adds each score (totalGrades), counts the number of scores in the database (totalNumberGrades) and calculate the average by dividing the total(totalGrades) by the count
    // average = totalGrades / totalNumberGrades
    var totalGrades = 0
    var totalNumberGrades = 0
    for (_, value) in grades {
        totalGrades += value
        totalNumberGrades += 1
    }

return totalGrades / totalNumberGrades
}
private func calculateIndividualTotalScore(fromAllGradesData grades: [(String, Int)]) -> [String:(Int, Int)]{
    var studentsAndAverages = [String:(Int, Int)]()
    for (studentName, studentScore) in grades {
        if studentsAndAverages[studentName] == nil {
            studentsAndAverages[studentName] = (studentScore, 1)
        } else {
            
            guard let count = studentsAndAverages[studentName]?.1, let score = studentsAndAverages[studentName]?.0 else {
                return studentsAndAverages
            }
            studentsAndAverages[studentName] = (score + studentScore, count + 1)
            
        }
    }
return studentsAndAverages
}
private func calculateIndividualAverage(fromIndividualStudentTotalGrade totalGrade:[String:(Int, Int)]) -> [String:Int] {
    var studentsAndAverage = [String:Int]()
    var average = 0
    for (student, (total, count)) in totalGrade {
        average = total / count
        if studentsAndAverage[student] == nil {
            studentsAndAverage[student] = average
        }
    }
    
    return studentsAndAverage
}

let totalGradeData = mergeAllGrades(fromAllGradesData: grades)

let studenttotal = calculateIndividualTotalScore(fromAllGradesData: totalGradeData)
let studentAverage = calculateIndividualAverage(fromIndividualStudentTotalGrade: studenttotal)
let classAverage = calculateAllGradesAverage(fromAllGradesData: totalGradeData)

func findClosestAverage(withIndividualAverages studentAverage:[String:Int], andTotalAverage totalAverage: Int) -> Dictionary<String,Int> {
    var closestStudent = Dictionary<String, Int>()
    for (student, average) in studentAverage {
        if average == totalAverage {
            closestStudent[student] = average
        }
    }
    return closestStudent
}

print(findClosestAverage(withIndividualAverages: studentAverage, andTotalAverage: classAverage))



func findDfferenceInTime(withS: String, withT: String) -> Int {
    
    var sArr = withS.components(separatedBy: ":")
    var tArr = withT.components(separatedBy: ":")
    var range = [[Int]]()
    
    guard let s1 = Int(sArr[0]), let s2 = Int(sArr[1]),let s3 = Int(sArr[2]), let t1 = Int(tArr[0]), let t2 = Int(tArr[1]),let t3 = Int(tArr[2]) else {return 1}
    
    if s1 != t1 {
        var hOURrange = Array(s1..<t1)
        hOURrange.removeFirst()
        range .append(hOURrange)
    }
        
    if s2 != t2 {
            var minuite = Array(s2..<t2)
             minuite.removeFirst()
        range.append(minuite)
        
    }
        
    if s3 != t3 {
        
    var seconds = Array(t3..<s3)
                 seconds.removeFirst()
        range.append(seconds)
            
        }
            
    print(range)

    
    
    return range.count
}







findDfferenceInTime(withS: "13:31:33", withT: "15:45:14")



func countCharacter(withS: String, withT: String) -> Int {
    
    var count = 0
    
    var sArr = withS.components(separatedBy: ":")
    var tArr = withT.components(separatedBy: ":")
    
    var sCharacters = sArr.map{Character($0)}
    var tCharacters = tArr.map{Character($0)}
    
    var tCharacterFreq = [Character:Int]()
     var sCharacterFreq = [Character:Int]()
    
    for char in sCharacters {
        if sCharacterFreq[char] == nil {
            sCharacterFreq[char] = 1
        } else {
             sCharacterFreq[char]! += 1
        }
    }
    
    for char1 in tCharacters {
        
        if tCharacterFreq[char1] == nil  {
            tCharacterFreq[char1] = 1
        } else {
            tCharacterFreq[char1]! += 1
        }
       }
    
    if tCharacterFreq.count <= 2 {
        count += 1
    }
    
    if sCharacterFreq.count <= 2 {
        count += 1
    }
    
    
    return count
}



func link(Arr: [Int]) -> Int {
    var newArr = [Arr[0]]
    for (index, value) in Arr.enumerated() {
        if index == 0 {
            continue
        } else {
            newArr.append(value)
        }
    }
    
    print(newArr)
    return newArr.count
}

print(link(Arr: [1, 4, -1, 3, 2 ]))


//
func closestNumber(arr: [Int]) {
    guard !arr.isEmpty else {return}
    let sortedArr = arr.sorted()
    var minimalDifference = Int.max
    var dictOfPairs = [Int : Int]()
    for i in 0..<arr.count-1 {
        for j in (i+1)..<arr.count {
            let differenceBtwNumbers = sortedArr[i] - sortedArr[j]
            let difference = abs(differenceBtwNumbers)

            if difference == minimalDifference {
                dictOfPairs[sortedArr[i]] = sortedArr[j]
            } else if difference < minimalDifference && difference > 0  {
                minimalDifference = difference
                dictOfPairs[sortedArr[i]] = sortedArr[j]
            }
        }
    }

    let arrOfPairs = Array(dictOfPairs)
    let sortedDictPairs = arrOfPairs.sorted{$0.key < $1.key}

    for pair in sortedDictPairs {
        print("\(pair.key) \(pair.value)")
    }

}



//func closestNumber(nums: [Int]) {
//    let sortedNums = nums.sorted()
//    var smallestDifference = Int.max
//    var pairs = [Int : Int]()
//    for i in 0..<(nums.count - 1) {
//        for j in (i+1)..<nums.count {
//            let difference = abs(sortedNums[i] - sortedNums[j])
//            if difference < smallestDifference && difference > 0 {
//                smallestDifference = difference
//                pairs[sortedNums[i]] = sortedNums[j]
//            } else if difference == smallestDifference {
//                pairs[sortedNums[i]] = sortedNums[j]
//            }
//        }
//    }
//    let sortedPairs = Array(pairs).sorted {$0.key < $1.key}
//    for pair in sortedPairs {
//        print("\(pair.0) \(pair.1)")
//    }
//}

print(closestNumber(arr:[4,4,2,1,3]))


func firstRepeatedWord(s: String) -> String {
    // Write your code here

var dict = [String: Int]()
var mostOccurringStrings = [String]()
let arrS = s.components(separatedBy: " ")
    

for char in arrS {
    
if dict[char] == nil {
 dict[char] = 1
} else {
    dict[char]! += 1
}
    }
    
    for (key, value) in dict {
        if value > 1 {
            mostOccurringStrings.append(key)
        }
    }
    
    let sortedKeys = mostOccurringStrings.sorted()
    
    guard let result = sortedKeys.first else {return "" }
    
    return result
}


//}

//print(firstRepeatedWord(s: "He had had quite enough of this nonsense"))


func braces(values: [String]) -> [String] {
    
    let brackets = ["{}", "[]", "()"]
    var results = [String]()
    var arr = values
    var index = 0
    
    while index < values.count - 1 && !arr.isEmpty {
        let lastItem = arr.popLast()!
       // index += 1
       // print(arr[index])
            // print(lastItem)
        let bracket = arr[index] + lastItem
        index += 1
        
        if brackets.contains(bracket) {
            results.append("Yes")
        } else {
            results.append("No")
        }
        
    }
    
return results

}

print(braces(values: ["{", "[", "}", "]", "}"]))

//
