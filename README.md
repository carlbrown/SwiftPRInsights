# SwiftPRInsights

Supporting data for [my talk](https://github.com/carlbrown/SwiftPRInsights/tree/master/Presentation) at [2017 try!Swift NYC](https://www.tryswift.co/events/2017/nyc/)

These are excerpts from HTML files for Pull Requests for the following Swift language repos:

* https://github.com/Alamofire/Alamofire
* https://github.com/IBM-Swift/Kitura
* https://github.com/IBM-Swift/Kitura-net
* https://github.com/PerfectlySoft/Perfect
* https://github.com/SwiftyJSON/SwiftyJSON
* https://github.com/apple/swift
* https://github.com/apple/swift-corelibs-foundation
* https://github.com/danielgindi/Charts
* https://github.com/vapor/engine
* https://github.com/vapor/vapor

Each PR is organized into one of 10 categories (plus an 'unclear' category for things that weren't easily categorizable). Note that the category is determined by *the nature of the _fix_* and not the nature of the bug (unless the PR description clearly indicated a category, e.g. mentioned Performance).  

Note that each PR was categorized by hand, and contrived to fit in only one category.

The categories I found were:

* _[CodeOrganization/CodeOrdering](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/CodeOrganization)_: Fix involved moving code around in the same file.
* _[Counting](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Counting)_: Fix involved off-by-one changes, `NSRange`, `Array` bounds, etc.
* _[Encapsulation](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Encapsulation)_: Fix involved moving code or passing information from the caller into the method called, or vice-versa.
* _[Logic(App)](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Logic)_: Fix appeared to involve logic errors that were specific to the domain knowledge of the application space.
* _[Memory](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Memory)_: Fix involved `unowned` or `weak`, breaking reference cycles or otherwise attempting to fix memory leaks.
* _[Naming](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Naming)_: Fix involved renaming things or calling methods (or accessing types) with a different but similar name.
* _[Performance](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Performance)_: For this category, the bug description usually mentioned speed or performance.
* _[Threading/GCD](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Threading)_: Multi-threading fixes. Fixes tended to include `Dispatch`, `Semaphore`, `Lock`, etc.
* _[Typing/Casting](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Typing)_: Fixes involving casting things from one type to another (e.g. `as? NSString`) or changing Types.
* _[Unwrapping/Optionals](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Unwrapping)_: Fixes tended to involve `if let`, trailing `?`/`!` and or `nil`.
* _[Unclear](https://github.com/carlbrown/SwiftPRInsights/tree/master/Classified/Unclear)_: Catch-all bucket for things that couldn't be easily and quickly categorized (at least by me).
