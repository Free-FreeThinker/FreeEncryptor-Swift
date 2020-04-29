import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FreeEncryptor_SwiftTests.allTests),
    ]
}
#endif
