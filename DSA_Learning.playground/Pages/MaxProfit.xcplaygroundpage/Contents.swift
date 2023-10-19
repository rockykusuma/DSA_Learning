//: [Previous](@previous)

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit = 0
    var firstPointer = 0
    var secondPointer = 1
    while secondPointer < prices.count {
        if prices[firstPointer] < prices[secondPointer] {
            maxProfit = max(maxProfit, prices[secondPointer] - prices[firstPointer])
        } else {
            firstPointer = secondPointer
        }
        secondPointer += 1
        print(maxProfit)
    }
    return maxProfit
}

//let result = maxProfit([1,2,4,2,5,7,2,4,9,0,9])
//print(result)


func temp() {
    DispatchQueue.main.asyncUnsafe(execute: <#T##() -> Void#>)
    
//    
//    DispatchQueue.main.async {
//        print(123)
//        DispatchQueue.main.async {
//            print(456)
//        }
//        print(789)
//    }
}

temp()
