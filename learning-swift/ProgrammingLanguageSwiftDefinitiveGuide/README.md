#Programming Language Swift Definitive Guide

## Requirements

* SwiftLint
* Tailor
* Alcatraz
* Alcatraz Plugins
    * OMQuickHelp 
    * SwiftCodeSnippets
    * VWInstantRun
    * SwiftLintXcode

## Project Setup

_How do I, as a developer, start working on the project?_ 

* Alcatraz

```
$ brew cask install alcatraz
```

* SwiftLint

```
$ brew install swiftlint
```

* Tailor

```
$ brew install tailor
```

## Usage

## Testing

### Unit Tests

### Integration Tests

## Deploying

### _How to setup the deployment environment_

### _How to deploy_

## Troubleshooting & Useful Tools

- Disable Violations within Source Code For Tailor

Violations on a specific line may be disabled with a trailing single-line comment.

```
import Foundation; // tailor:disable
Additionally, violations in a given block of code can be disabled by enclosing the block within tailor:off and tailor:on comments.

// tailor:off
import Foundation;
import UIKit;
import CoreData;
// tailor:on

class Demo() {
// Define public members here
}
```

* Disable a rule in code

Rules can be disabled with a comment inside a source file with the following format:

```
// swiftlint:disable <rule>
```

The rule will be disabled until the end of the file or until the linter sees a matching enable comment:

```
// swiftlint:enable <rule>
```

For example:

```

// swiftlint:disable colon
let noWarning :String = "" // No warning about colons immediately after variable names!
// swiftlint:enable colon
let hasWarning :String = "" // Warning generated about colons immediately after variable names
```
It's also possible to modify a disable or enable command by appending :previous, :this or :next for only applying the command to the previous, this (current) or next line respectively.

For example:

```
// swiftlint:disable:next force_cast
let noWarning = NSNumber() as! Int
let hasWarning = NSNumber() as! Int
let noWarning2 = NSNumber() as! Int // swiftlint:disable:this force_cast
let noWarning3 = NSNumber() as! Int
// swiftlint:disable:previous force_cast
```
Run swiftlint rules to print a list of all available rules and their identifiers.

## Contributing changes

## License