import Foundation
import Cocoa

public class DayOne {
    var chunked: [Int]
    
    public init() {
        let fileURL = Bundle.main.url(forResource: "day-one", withExtension: "txt")
        let content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        
        self.chunked = content
            .split(separator: "\n\n")
            .map { $0.split(separator: "\n").map { Int($0) ?? 0 } }
            .map { $0.reduce(0, +) }
    }
    
    public func partOne() {
        print(self.chunked.max()!)
    }
    
    public func partTwo() {
        let partTwo = self.chunked.sorted { $1 < $0 }.prefix(3).reduce(0, +)
        print(partTwo)
    }
}
