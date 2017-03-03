//: Playground - noun: a place where people can play

import UIKit
/*
 ==========
 S.O.L.I.D.
 ==========
 
 * [The Single Responsibility Principle](#-the-single-responsibility-principle)
 * [The Open Closed Principle](#-the-open-closed-principle)
 * [The Liskov Substitution Principle](#-the-liskov-substitution-principle)
 * [The Interface Segregation Principle](#-the-interface-segregation-principle)
 * [The Dependency Inversion Principle](#-the-dependency-inversion-principle)
 
 */

/*:
 # 🔐 The Single Responsibility Principle
 
 A class should have one, and only one, reason to change. ([read more](https://docs.google.com/open?id=0ByOwmqah_nuGNHEtcU5OekdDMkk))
 
 Example:
 */

protocol canBeOpen {
    func open()
}

protocol canBeClose {
    func close()
}

///I am a door, and can open and close
final class Door: canBeOpen, canBeClose {
    
    private enum State {
        case open
        case close
    }
    
    private var state: State = .close
    
    internal func open() {
        state = .open
    }

    internal func close() {
        state = .close
    }
}


/*:
 > ⚠ Only responsible for open door
 */
class DoorOpener {
    let door: canBeOpen
    
    init(door: canBeOpen) {
        self.door = door
    }
    
    func excute() -> Void {
        door.open()
    }
}


/*:
 > ⚠ Only responsible for close door
 */
class DoorCloser {
    let door: canBeClose
    
    init(door: canBeClose) {
        self.door = door
    }
    
    func excute() -> Void {
        door.close()
    }
}

let door = Door()

/*:
 > ⚠ Only the `DoorOpener` is responsible for opening the door.
 */
let doorOpener = DoorOpener(door: door)
doorOpener.excute()

/*:
 > ⚠ If another operation should be made upon closing the door,
 > like switching on the alarm, you don't have to change the `DoorOpener` class.
 */
let doorCloser = DoorCloser(door: door)
doorCloser.excute()
