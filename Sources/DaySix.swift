import Foundation

public class DaySix {
    
    var content: String
    
    public init() {
        let fileURL = Bundle.main.url(forResource: "day-six", withExtension: "txt")
        self.content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    }
    
    public func partOne() {
        var buffer: [Character] = [];
        var count = 0;
        var found = false;

        self.content.forEach {
            count += 1;
            buffer.append($0);
    
            // Is the buffer full?
            if (buffer.count > 4) {
                buffer = Array(buffer.suffix(from: 1))
        
                if (Set(buffer).count == buffer.count && !found) {
                    found = true;
                    print(count);
                    return
                }
            }
        }
    }
    
    public func partTwo() {
        var buffer: [Character] = [];
        var count = 0;
        var found = false;

        self.content.forEach {
            count += 1;
            buffer.append($0);
    
            // Is the buffer full?
            if (buffer.count > 14) {
                buffer = Array(buffer.suffix(from: 1))
        
                if (Set(buffer).count == buffer.count && !found) {
                    found = true;
                    print(count);
                    return
                }
            }
        }
    }
}
