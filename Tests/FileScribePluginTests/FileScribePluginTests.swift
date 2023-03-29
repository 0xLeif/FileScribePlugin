import o
import Scribe
import XCTest
@testable import FileScribePlugin

final class FileScribePluginTests: XCTestCase {
    func testExample() async throws {
        let filename = "scribe.test"

let scribe = Scribe(
    label: "Scribe.Tests",
    plugins: [
        FilePlugin(filename: "scribe.test") { payload in
            "\(payload.level.rawValue.uppercased()): \(payload.message)"
        }
    ]
)

        let pluginTask = scribe.info("Test")

        try await pluginTask.value

        let fileContents: [String] = (try? o.file.in(filename: filename)) ?? []

        XCTAssertEqual(fileContents.first, "INFO: Test")

        // Clean up and delete test file

        XCTAssertNoThrow(try o.file.string(filename: filename))

        try o.file.delete(filename: filename)

        XCTAssertThrowsError(try o.file.string(filename: filename))
    }
}
