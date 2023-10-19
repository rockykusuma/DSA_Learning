//: [Previous](@previous)

import Foundation

func calculateElectricityBill(units: Int) -> Int {
    if units <= 100 {
        return units * 2
    } else if units <= 200 {
        return (100 * 2) + (units - 100) * 3
    } else if units <= 300 {
        return (100 * 2) + (100 * 3) + (units - 200) * 5
    } else if units > 300 {
        return (100 * 2) + (100 * 3) + (100 * 5) + (units - 300) * 5
    }
    return 0
}


let result = calculateElectricityBill(units: 400)
print(result)
