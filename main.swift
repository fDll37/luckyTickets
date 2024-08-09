//
//  main.swift
//  luckyTickets
//
//  Created by Данил Менделев on 08.08.2024.
//

import Foundation

class LuckyTicket {

    private static let baseArray = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

    private static func createNewLevelArray(_ current: [Int]) -> [Int] {
        var temp: [Int] = current
        
        temp.append(contentsOf: Array(repeating: 0, count: 9))
        for (index, _) in current.enumerated() {
            for step in 0..<9 {
                temp[index + step + 1] += current[index]
            }
        }
        return temp
    }

    private static func getSumLuckyCases(_ array: [Int]) -> Int {
        var sum = 0
        
        for element in array {
            sum += element * element
        }
        return sum
    }
    
    static func getSum(userLevel: Int) -> Int {
        var temp: [Int] = baseArray
        for _ in 1..<userLevel {
            temp = createNewLevelArray(temp)
        }

        let result = getSumLuckyCases(temp)
        return result
    }
}


Test.shared.run()


