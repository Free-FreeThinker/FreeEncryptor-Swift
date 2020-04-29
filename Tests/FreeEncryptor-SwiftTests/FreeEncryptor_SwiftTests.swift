import XCTest
@testable import FreeEncryptor_Swift

final class FreeEncryptor_SwiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FreeEncryptor_Swift().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
