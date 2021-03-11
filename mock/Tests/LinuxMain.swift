import XCTest

import mockTests

var tests = [XCTestCaseEntry]()
tests += mockTests.allTests()
XCTMain(tests)
