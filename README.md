# ArrayBuilder

A very simple function builder that lets you build arrays with conditional content. In the closure, you can incorporate single elements, arrays of elements, or even optionals.

## Example

```swift
@ArrayBuilder<AssetProperties>
var selectedAssets: [AssetProperties] {
	if includeMac {
		stylizeMac ? .macMasked : .mac
	}
	
	if includeiPhone { .iPhone }
	if includeiPad { .iPad }
	if includeiOSMarketing { .iOSMarketing }
}
```

Without function builders, this would get noisy, repetitive, and hard-to-read (albeit shorter with this formatting):

```swift
var selectedAssets: [AssetProperties] {
	(includeMac ? (stylizeMac ? .macMasked : .mac) : [])
		+ (includeiPhone ? .iPhone : [])
		+ (includeiPad ? .iPad : [])
		+ (includeiOSMarketing ? .iOSMarketing : [])
}
```

The package also includes an initializer for `Array` taking a function builder closure:

```swift
let text = Array {
	if let amount = amount {
		Self.formatter.string(from: amount as NSNumber)!
	}
    // unlike SwiftUI, this works with optionals too, no need to unwrap or nil-coalesce with []
	unit.map(\.symbol)
}.joined(separator: " ") // e.g. "250 mL", "3", "some"
```

