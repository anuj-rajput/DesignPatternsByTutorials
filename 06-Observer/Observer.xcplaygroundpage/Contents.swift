/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Observer
 - - - - - - - - - -
 ![Observer Diagram](Observer_Diagram.png)
 
 The observer pattern lets one object observe changes on another object. It involves three types:
 
 (1) The **subscriber** is the "observer" object and receives updates.
 
 (2) The **publisher** is the "observable" object and sends updates.
 
 (3) The **value** is the underlying object that's changed.
 
 ## Code Example
 */
import Foundation

// MARK: - KVO
@objcMembers public class KVOUser: NSObject {
    dynamic var name: String
    
    public init(name: String) {
        self.name = name
    }
}

print("-- KVO Example --")
let kvoUser = KVOUser(name: "Anuj")

var kvoObserver: NSKeyValueObservation? = kvoUser.observe(\.name, options: [.initial, .new]) { (user, change) in
    print("User's name is \(user.name)")
}

kvoUser.name = "Raj"
kvoObserver = nil
kvoUser.name = "Anuj was ejected"

print("")
print("-- Observable Example --")

let user = User(name: "Rajput")

var observer: Observer? = Observer()
user.name.addObserver(observer!, options: [.initial, .new]) { (name, change) in
    print("User's name is \(name)")
}

user.name.value = "AJ"
observer = nil
user.name.value = "AJ is ejected!"
