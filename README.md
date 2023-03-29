# FileScribePlugin

A  Scribe Plugin to save logs to a file.

## Usage

```swift
let scribe = Scribe(
    label: "Scribe.Tests",
    plugins: [
        FilePlugin(filename: "scribe.test") { payload in
            "\(payload.level.rawValue.uppercased()): \(payload.message)"
        }
    ]
)
```
