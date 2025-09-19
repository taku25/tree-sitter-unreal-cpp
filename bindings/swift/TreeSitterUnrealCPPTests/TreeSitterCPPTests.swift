import XCTest
import SwiftTreeSitter
import TreeSitterUnrealCPP

final class TreeSitterUnrealCPPTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_unreal_cpp())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading C++ grammar")
    }
}
