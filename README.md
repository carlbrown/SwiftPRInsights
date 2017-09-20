# SwiftPRInsights

Supporting data for my [2017 try!Swift NYC](https://www.tryswift.co/events/2017/nyc/) [talk](https://github.com/carlbrown/SwiftPRInsights/tree/master/Presentation)

These are excerpts from HTML files for Pull Requests for the following Swift language repos:

* https://api.github.com/repos/Alamofire/Alamofire
* https://api.github.com/repos/IBM-Swift/Kitura
* https://api.github.com/repos/IBM-Swift/Kitura-net
* https://api.github.com/repos/PerfectlySoft/Perfect
* https://api.github.com/repos/SwiftyJSON/SwiftyJSON
* https://api.github.com/repos/apple/swift
* https://api.github.com/repos/apple/swift-corelibs-foundation
* https://api.github.com/repos/danielgindi/Charts
* https://api.github.com/repos/vapor/engine
* https://api.github.com/repos/vapor/vapor

Each PR is organized into one of 10 categories (plus an 'unclear' category for things that weren't easily categorizable). Note that the category is determined by *the nature of the _fix_* and not the nature of the bug (unless the PR description clearly indicated a category, e.g. mentioned Performance).  

Note that each PR was categorized by hand, and contrived to fit in only one category.

The categories I found were:

* _CodeOrganization/CodeOrdering_: Fix involved moving code around in the same file.
* _Counting_: Fix involved off-by-one changes, `NSRange`, `Array` bounds, etc.
* _Encapsulation_: Fix involved moving code or passing information from the caller into the method called, or vice-versa.
* _Logic(App)_: Fix appeared to involve logic errors that were specific to the domain knowledge of the application space.
* _Memory_: Fix involved `unowned` or `weak`, breaking reference cycles or otherwise attempting to fix memory leaks.
* _Naming_: Fix involved renaming things or calling methods (or accessing types) with a different but similar name.
* _Performance_: For this category, the bug description usually mentioned speed or performance.
* _Threading/GCD_: Multi-threading fixes. Fixes tended to include `Dispatch`, `Semaphore`, `Lock`, etc.
* _Typing/Casting_: Fixes involving casting things from one type to another (e.g. `as? NSString`) or changing Types.
* _Unwrapping/Optionals_: Fixes tended to involve `if let`, trailing `?`/`!` and or `nil`.
* _Unclear_: Catch-all bucket for things that couldn't be easily and quickly categorized (at least by me).
