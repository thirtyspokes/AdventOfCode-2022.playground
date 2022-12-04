import Foundation
import Cocoa

public class DayFour {
    var parsed: [[[Int]]]
    
    public init() {
        let fileURL = Bundle.main.url(forResource: "day-four", withExtension: "txt")
        let content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

        self.parsed = content.split(separator: "\n")
            .map {
                $0
                    .split(separator: ",")
                    .map { $0.split(separator: "-") }
                    .map { $0.map { Int($0)! } }
            }
    }
    
    public func partOne() {
        let partOne = self.parsed.map {
            let first = $0[0];
            let second = $0[1];
        
            if ((first[0] <= second[0]) && (first[1] >= second[1])) {
                return 1
            } else if ((first[0] >= second[0]) && (first[1] <= second[1])) {
                return 1
            } else {
                return 0
            }
        }
        .reduce(0, +)
        
        print(partOne)
    }
    
    public func partTwo() {
        let partTwo = self.parsed.map {
            let first = $0[0];
            let second = $0[1];
        
            if ((first[1] < second[0]) || (second[1] < first[0])) {
                return 0
            }
            return 1
        }
        .reduce(0, +)

        print(partTwo)
    }
}
