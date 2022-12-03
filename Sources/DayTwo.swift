import Foundation
import Cocoa

public class DayTwo {
    var results: [[String]: Int]
    var resultsTwo: [[String]: Int]
    var chunked: [[String]]
    
    public init() {
        let fileURL = Bundle.main.url(forResource: "day-two", withExtension: "txt")
        let content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        
        results = [
            ["A", "Y"]: 2 + 6,
            ["A", "X"]: 1 + 3,
            ["A", "Z"]: 3 + 0,
            ["B", "Y"]: 2 + 3,
            ["B", "X"]: 1 + 0,
            ["B", "Z"]: 3 + 6,
            ["C", "X"]: 1 + 6,
            ["C", "Y"]: 2 + 0,
            ["C", "Z"]: 3 + 3
        ]
        
        resultsTwo = [
            ["A", "Y"]: 1 + 3,
            ["A", "X"]: 3 + 0,
            ["A", "Z"]: 2 + 6,
            ["B", "Y"]: 2 + 3,
            ["B", "X"]: 1 + 0,
            ["B", "Z"]: 3 + 6,
            ["C", "X"]: 2 + 0,
            ["C", "Y"]: 3 + 3,
            ["C", "Z"]: 1 + 6
        ]
        
        chunked = content
            .split(separator: "\n")
            .map { $0.split(separator: " ").map { String($0) } }
    }
    
    public func partOne() {
        let partOne = chunked.map { results[$0]! }.reduce(0, +)
        print(partOne)
    }
    
    public func partTwo() {
        let partTwo = chunked.map { resultsTwo[$0]! }.reduce(0, +)
        print(partTwo)
    }
}
