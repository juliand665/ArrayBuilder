// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "ArrayBuilder",
	products: [
		.library(
			name: "ArrayBuilder",
			targets: ["ArrayBuilder"]
		),
	],
	dependencies: [],
	targets: [
		.target(
			name: "ArrayBuilder",
			dependencies: []
		),
		.testTarget(
			name: "ArrayBuilderTests",
			dependencies: ["ArrayBuilder"]
		),
	]
)
