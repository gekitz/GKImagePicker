import XCTest
@testable import GKImagePicker

final class GKImagePickerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GKImagePicker().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
