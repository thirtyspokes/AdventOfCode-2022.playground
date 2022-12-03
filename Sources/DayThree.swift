import Foundation
import Cocoa

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
    
public class DayThree {
    var lookup: [String: Int]
    var content: String

    public init() {
        let fileURL = Bundle.main.url(forResource: "day-three", withExtension: "txt")
        self.content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        
        self.lookup = [:];
        for (index, value) in letters.enumerated() {
            self.lookup[String(value)] = index + 1;
        }
    }
    
    public func partOne() {
        let partOne = content
            .split(separator: "\n")
            .map { $0.split(separator: "").map { String($0) } }
            .map {
                let pivot = $0.count / 2;
                
                let leftSplit = Set($0[0 ..< pivot]);
                let rightSplit = Set($0[pivot ..< $0.count]);
                
                return leftSplit.intersection(rightSplit).first!;
            }
            .map { return lookup[$0]! }
            .reduce(0, +);
        
        print(partOne);
    }
    
    public func partTwo() {
        let partTwo = content
            .split(separator: "\n")
            .chunked(into: 3)
            .map {
                Set($0[0]).intersection(Set($0[1])).intersection(Set($0[2])).first!
            }
            .map { return lookup[String($0)]! }
            .reduce(0, +);
        
        print(partTwo);
    }
}
