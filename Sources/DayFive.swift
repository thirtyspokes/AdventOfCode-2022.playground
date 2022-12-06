import Foundation

public class Stack {
    var contents: [String]
    
    public init(initialContents: [String]) {
        self.contents = initialContents;
    }
    
    public func push(elem: String) {
        self.contents.append(elem);
    }
    
    public func popMany(amount: Int) -> [String] {
        let popped: [String] = self.contents.suffix(amount);
        self.contents = Array(self.contents.prefix(upTo: self.contents.count - amount))
        
        return popped;
    }
    
    public func pushMany(input: [String]) {
        input.forEach { self.contents.append($0) }
    }
    
    public func pop() -> String? {
        let last = self.contents.last;
        self.contents = Array(self.contents.prefix(upTo: self.contents.count - 1))
        return last;
    }
    
    public func peek() -> String? {
        return self.contents.last;
    }
}

public class DayFive {
    var instructions: [[Int]]
    
    public init() {
        let fileURL = Bundle.main.url(forResource: "day-five", withExtension: "txt")
        let content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        let lines = content.split(separator: "\n")
            .map { $0.split(separator: " ") };
        self.instructions = lines.map { return [Int($0[1])!, Int($0[3])!, Int($0[5])!] }
    }
    
    public func partOne() {
        var stacks: [Stack] = [];
        stacks.append(Stack(initialContents: ["H", "T", "Z", "D"]))
        stacks.append(Stack(initialContents: ["Q","R","W","T","G", "C","S"]))
        stacks.append(Stack(initialContents: ["P","B","F","Q","N","R","C","H"]))
        stacks.append(Stack(initialContents: ["L", "C", "N", "F","H","Z"]))
        stacks.append(Stack(initialContents: ["G","L","F","Q","S"]))
        stacks.append(Stack(initialContents: ["V","P","W","Z","B","R","C","S"]))
        stacks.append(Stack(initialContents: ["Z", "F", "J"]))
        stacks.append(Stack(initialContents: ["D","L", "V","Z","R","H","Q"]))
        stacks.append(Stack(initialContents: ["B", "H","G","N","F","Z","L","D"]))
        
        instructions.forEach {
            let amount = $0[0];
            let source = stacks[$0[1] - 1];
            let destination = stacks[$0[2] - 1];
            var count = 0;
    
            repeat {
                destination.push(elem: source.pop()!);
                count += 1;
            } while (count < amount)
        }

        print(stacks.map { $0.peek()! })
    }
    
    public func partTwo() {
        var stacks: [Stack] = [];
        stacks.append(Stack(initialContents: ["H", "T", "Z", "D"]))
        stacks.append(Stack(initialContents: ["Q","R","W","T","G", "C","S"]))
        stacks.append(Stack(initialContents: ["P","B","F","Q","N","R","C","H"]))
        stacks.append(Stack(initialContents: ["L", "C", "N", "F","H","Z"]))
        stacks.append(Stack(initialContents: ["G","L","F","Q","S"]))
        stacks.append(Stack(initialContents: ["V","P","W","Z","B","R","C","S"]))
        stacks.append(Stack(initialContents: ["Z", "F", "J"]))
        stacks.append(Stack(initialContents: ["D","L", "V","Z","R","H","Q"]))
        stacks.append(Stack(initialContents: ["B", "H","G","N","F","Z","L","D"]))
        
        instructions.forEach {
            let amount = $0[0];
            let source = stacks[$0[1] - 1];
            let destination = stacks[$0[2] - 1];
            let popped = source.popMany(amount: amount);
            destination.pushMany(input: popped);
        }

        print(stacks.map { $0.peek()! })
    }
}
