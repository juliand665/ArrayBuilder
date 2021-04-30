import XCTest
import ArrayBuilder

final class ArrayBuilderTests: XCTestCase {
	static var allTests = [
		("test basics with strings", testBasicStrings),
		("test closures with ints", testClosureInts),
	]
	
	func testBasicStrings() {
		XCTAssertEqual(Array<String> {
			"one"
			["two", "three"]
			
			let b = "a".count > 0
			
			if b {
				"true"
			}
			if b {
				"true"
			} else {
				"not true"
			}
			
			if !b {
				"false"
			}
			if !b {
				"false"
			} else {
				"not false"
			}
			
			let opt = "a".first
			opt.map { "\($0)" }
			
			let repeated = "repeated"
			repeated
			(1...3).map { "\(repeated) \($0)" }
		}, [
			"one",
			"two",
			"three",
			"true",
			"true",
			"not false",
			"a",
			"repeated",
			"repeated 1",
			"repeated 2",
			"repeated 3",
		])
	}
	
	func testClosureInts() {
		let build = { self.buildDynamically(arg: $0) { arg in
			arg
			
			if arg < 20 {
				[18, 19]
			} else {
				20
			}
		}}
		XCTAssertEqual(build(18), [
			18,
			18,
			19,
		])
		XCTAssertEqual(build(19), [
			19,
			18,
			19,
		])
		XCTAssertEqual(build(20), [
			20,
			20,
		])
		XCTAssertEqual(build(21), [
			21,
			20,
		])
	}
	
	func buildDynamically(arg: Int, @ArrayBuilder<Int> builder: (Int) -> [Int]) -> [Int] {
		builder(arg)
	}
}
