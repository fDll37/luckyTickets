//
//  Test.swift
//  luckyTickets
//
//  Created by Данил Менделев on 09.08.2024.
//
import Foundation

class Test {
    
    enum File: String {
        case input = "in"
        case output = "out"
    }
    
    static let shared: Test = Test()
    private let fileManager = FileManager.default
    
    private init() {}
    
    func run() {
        
        for index in 0...9 {
            let inputTestValue = getDataFrom(path: "Tickets/test.\(index).\(File.input.rawValue)")
            let intInput = Int(inputTestValue)
            
            let result = LuckyTicket.getSum(userLevel: intInput!)
            
            var outputTestValue = getDataFrom(path: "Tickets/test.\(index).\(File.output.rawValue)")
            outputTestValue = outputTestValue.replacingOccurrences(of: "\r\n", with: "", options: .caseInsensitive)
            let outInput = Int(outputTestValue)!
           
            if result == outInput {
                print("Test №\(index + 1) in: \(inputTestValue) out: \(outputTestValue)")
            } else {
                print("Test \(index + 1) is failed")
                break
            }
        }
    }
    
    private func getDataFrom(path: String) -> String {
        if fileManager.fileExists(atPath: path) {
            do {
                var fileContents = try String(contentsOfFile: path, encoding: .utf8)
                return fileContents
            } catch {
                print("Error reading file: \(error.localizedDescription)")
                return "-2"
            }
        } else {
            print("File does not exist")
            return "-1"
        }
    }
}






