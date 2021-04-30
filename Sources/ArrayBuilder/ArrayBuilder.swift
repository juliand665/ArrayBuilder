public extension Array {
	init(@ArrayBuilder<Element> contents: () -> [Element]) {
		self = contents()
	}
}

@resultBuilder
public enum ArrayBuilder<Element> {
	public static func buildExpression(_ element: Element) -> [Element] {
		[element]
	}
	public static func buildExpression(_ element: Element?) -> [Element] {
		element.map { [$0] } ?? []
	}
	public static func buildExpression(_ elements: [Element]) -> [Element] {
		elements
	}
	
	public static func buildBlock(_ content: [Element]) -> [Element] {
		content
	}
	public static func buildBlock(_ contents: [Element]...) -> [Element] {
		Array(contents.joined())
	}
	
	public static func buildOptional(_ content: [Element]?) -> [Element] {
		content ?? []
	}
	
	public static func buildEither(first: [Element]) -> [Element] {
		first
	}
	public static func buildEither(second: [Element]) -> [Element] {
		second
	}
	
	public static func buildArray(_ contents: [[Element]]) -> [Element] {
		Array(contents.joined())
	}
}
