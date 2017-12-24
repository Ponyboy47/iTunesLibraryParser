import XCTest
@testable import iTunes_Library_Parser
import FileKit

class iTunes_Library_ParserTests: XCTestCase {
    func test() {
        let decoder = PropertyListDecoder()
        let iTunesLibraryPath = DataFile(path: Path.userMusic + "iTunes" + "iTunes Music Library.xml")
        XCTAssertNoThrow(try decoder.decode(iTunesLibrary.self, from: iTunesLibraryPath.read()))
    }


    static var allTests = [
        ("test", test),
    ]
}
