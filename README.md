# SFSymbolEnum

A Swift package that exposes SF Symbols as an enum instead of verbatim strings.

Build with Xcode 26 / Swift 6.2 or newer.

You can write now:
```swift
Image(systemImage:.person)
Label("Text",systemImage:.zlRectangleRoundedtopFill)
```

Or to see a list of all available symbols
```swift
struct SwiftUIView: View {
    var body: some View {
        VStack {
            List(SFSymbol.allCases,id:\.name) { symbol in
                Label(symbol.name,systemImage:symbol)
            }
        }
    }
}
```
<img src="Images/Example.allCases.png" width="300" style="max-width: 50%; display: block; margin-left: auto; margin-right: auto;" /> 

## Advantages

- Compiler error when you mistype a SFSymbol name
- Autocompletion and suggestion for all SFSymbols:

<img src="Images/Example.completion.png" width="500" style="max-width: 100%; display: block; margin-left: auto; margin-right: auto;" /> 


- Images are *available* depending on os and version like this:

<img src="Images/Example.availableError.png" width="500" style="max-width: 100%; display: block; margin-left: auto; margin-right: auto;" /> 

## Installation

- Add the package to your project: Xcode->Add Package Dependency add this url: https://github.com/jollyjinx/SFSymbolEnum
- Import in files like this:
```swift 
     import SFSymbolEnum
```


## Usage 

functions that are using the *systemImage* argument can be used as before, but instead with the dot notation. 
Symbol names translate to enums by replacing dots notation to camelcase and prefixing starting numbers with number.

Examples:
```swift
    Image(systemName:"arrow.down.left.circle.fill")
    Image(systemName:"0.circle")
    Image(systemName:"arrow.2.circlepath.circle")
```    
becomes to:
```swift
    Image(systemName:.arrowDownLeftCircleFill)    
    Image(systemName:.number0Circle)    
    Image(systemName:.arrow2CirclepathCircle)    
```

## How it's done

The generated code is created from `name_availability.plist` inside the SF Symbols application and looks like this:
```swift
public enum SFSymbol: String, Sendable {
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *) case number0Circle = "0.circle"
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *) case number0CircleFill = "0.circle.fill"
...
}

extension SFSymbol: CaseIterable {
    public static let allCases: [SFSymbol] = {
        var allCases: [SFSymbol] = []
        if #available(iOS 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *) {
            allCases.append(contentsOf: [.number0Circle, .number0CircleFill])
        }
...
        return allCases
    }()
}

```
