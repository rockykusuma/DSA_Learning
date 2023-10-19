
//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Works if the array is sorted
func findThePairWhichEqualsToSum(array: [Int], sum: Int) -> [Int] {
    var leftPointer = 0
    var rightPointer = array.count - 1
    
    while (leftPointer < rightPointer) {
        if array[leftPointer] + array[rightPointer] == sum {
            return [array[leftPointer], array[rightPointer]]
        } else if array[leftPointer] + array[rightPointer] > sum {
            rightPointer -= 1
        } else if array[leftPointer] + array[rightPointer] < sum {
            leftPointer += 1
        }
    }
    return []
}

//let result = findThePairWhichEqualsToSum(array: array, sum: sumOfPair)
//print(result)

// Works if the array is not sorted
func findThePairWhichEqualsToSumUsingSet(array: [Int], sum: Int) -> Bool {
    var complimentList: Set<Int> = []
    for i in 0 ..< array.count {
        if complimentList.contains(array[i]) {
            return true
        } else {
            complimentList.insert(sum - array[i])
        }
    }
    return false
}

// Works if the array is not sorted
func findThePairWhichEqualsToSumUsingHashMap(array: [Int], sum: Int) -> [Int] {
    var dictionary: [Int: Int] = [:]
    var indexArray: [Int] = []
    for i in 0 ..< array.count {
        if let value = dictionary[array[i]] {
            indexArray = [value, i]
            break
        } else {
            dictionary[sum - array[i]] = i
            print(dictionary)
        }
    }
    if !indexArray.isEmpty {
        return [array[indexArray[0]], array[indexArray[1]]]
    }
    return []
}

let array2 = [1, 2, 7, 5]
let sumOfPair2 = 12
let array = [1, 4, 50, 3, 9, 6, 22, 10]
let sumOfPair = 72

//let result = findThePairWhichEqualsToSumUsingCompliment(array: array, sum: sumOfPair)
//let result = findThePairWhichEqualsToSumUsingSet(array: array2, sum: sumOfPair2)
//print(result)


func checkCommonElementExistsInTwoArrays(arrayOne: [Int], arrayTwo: [Int]) -> Bool {
    var dictionary: [Int: Bool] = [:]
    arrayOne.forEach { element in
        dictionary[element] = true
    }
    for element in arrayTwo {
        if let value = dictionary[element] {
            return true
        }
    }
    print(dictionary)
    return false
}

//let result = checkCommonElementExistsInTwoArrays(arrayOne: [2, 4, 5, 5, 9], arrayTwo: [16, 43, 4, 56])
//print(result)


func mergeSortedArray(arrayOne: [Int], arrayTwo: [Int]) -> [Int] {
    
    var firstPointer = 0
    var mergeArray: [Int] = []
    
    if arrayOne.count < arrayTwo.count {
        while(firstPointer < arrayOne.count) {
            let valueForArrayOne = arrayOne[firstPointer]
            let valueForArrayTwo = arrayTwo[firstPointer]
            mergeArray.append(contentsOf: mergeValueIntoNewArray(itemOne: valueForArrayOne, itemTwo: valueForArrayTwo))
            firstPointer += 1
        }
        for element in (arrayOne.count ..< arrayTwo.count) {
            mergeArray.append(arrayTwo[element])
        }
    } else {
        while(firstPointer < arrayTwo.count) {
            let valueForArrayOne = arrayOne[firstPointer]
            let valueForArrayTwo = arrayTwo[firstPointer]
            mergeArray.append(contentsOf: mergeValueIntoNewArray(itemOne: valueForArrayOne, itemTwo: valueForArrayTwo))
            firstPointer += 1
        }
        for element in (firstPointer ..< arrayOne.count) {
            mergeArray.append(arrayOne[element])
        }
    }
    print(mergeArray)
    return mergeArray
}

func mergeValueIntoNewArray(itemOne: Int, itemTwo: Int) -> [Int] {
    var mergeArray: [Int] = []
    if itemOne < itemTwo  {
        mergeArray.append(itemOne)
        mergeArray.append(itemTwo)
    } else {
        mergeArray.append(itemTwo)
        mergeArray.append(itemOne)
    }
    return mergeArray
}

//var arrayOne = [1, 4, 6, 6, 8]
//var arrayTwo = [2, 3, 6, 7, 12, 20, 65, 21]
//
//arrayOne.append(contentsOf: arrayTwo)
//print(arrayOne.sorted())

//let result = mergeSortedArray(arrayOne: [2, 3, 6, 7, 12, 20, 65, 21], arrayTwo: [1, 4, 6, 6, 8])
//let result = mergeSortedArray(arrayOne: arrayOne, arrayTwo: arrayTwo)


func containsDuplicate(_ nums: [Int]) -> Bool {
    var list: Set<Int> = []
    
    for element in nums {
        if list.contains(element) {
            return true
        }
        list.insert(element)
    }
    return false
}

//print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))

func moveZeroesMethodOne(_ nums: inout [Int]) {
    // amount of swaps, will be used a as reference for next swap index
    var j = 0
    for index in nums.indices {
        if nums[index] != 0 {
            nums.swapAt(j, index)
            j += 1
        }
    }
}

func moveZeroesMethodTwo(_ nums: inout [Int]) {
    // amount of swaps, will be used a as reference for next swap index
    var offset = 0
    for i in 0 ..< nums.count {
        if nums[i] == 0 {
            offset += 1
        } else {
            nums.swapAt(i, i-offset)
        }
    }
}


var itemArray = [12,1,0,3,12]   // [1, 0, 0, 3, 12]
//moveZeroesMethodTwo(&itemArray)
//print(itemArray)


func longestWord(_ sen: String) -> String {
    let stringArray = sen.components(separatedBy: " ")
    var biggestWord = stringArray.first ?? ""
    for index in 1..<stringArray.count {
        if stringArray[index].count > biggestWord.count {
            biggestWord = stringArray[index]
        }
    }
    return biggestWord
}

//let result = longestWord("Have the function LongestWord(sen) take the sen parameter being passed and return the longest word in the string. If there are two or more words that are the same length, return the first word from the string with that length. Ignore punctuation and assume sen will not be empty. Words may also contain numbers, for example Hello world123 567")

//print(result)

func rotate(_ nums: inout [Int], _ k: Int) {
    var incrementer = 0
    while incrementer < k {
        let lastValue = nums[nums.count-1]
        for index in nums.indices.reversed() {
            let beforeIndex = index - 1
            if beforeIndex >= 0 {
                nums[index] = nums[beforeIndex]
            } else {
                nums[0] = lastValue
            }
        }
        incrementer += 1
    }
}

//print(rotate([1,2,3,4,5,6,7], 3))


func firstRecurringElementUsingDict(_ nums: [Int]) -> Int {
    var dictionary: [Int: Bool] = [:]
    
    for element in nums {
        if let value = dictionary[element] {
            return element
        } else {
            dictionary[element] = true
        }
    }
    return -1
}

func firstRecurringElementUsingSet(_ nums: [Int]) -> Int {
    var list: Set<Int> = []
    
    for element in nums {
        if list.contains(element) {
            return element
        } else {
            list.insert(element)
        }
    }
    return -1
}

print(firstRecurringElementUsingSet([2, 5, 1, 4, 5, 2, 16]))
print(firstRecurringElementUsingSet([2, 3, 4, 5]))


func doSomeWork() {
    defer {
        print("3")
    }
    defer {
        print("2")
    }
    defer {
        print("1")
    }
    print("4")
}

//doSomeWork()


struct Directions: OptionSet {
    let rawValue: UInt8

    static let up    = Directions(rawValue: 1 << 0) // 0001   -> 1
    static let down  = Directions(rawValue: 1 << 1) // 0010   -> 2
    static let left  = Directions(rawValue: 1 << 2) // 0100   -> 4
    static let right = Directions(rawValue: 1 << 3) // 1000   -> 8
}

let allowedMoves: Directions = [.up, .down, .left]   // 0111
print(allowedMoves.rawValue)

