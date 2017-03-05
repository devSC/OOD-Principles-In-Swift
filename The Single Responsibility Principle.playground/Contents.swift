import UIKit
/*:
 S.O.L.I.D.
 ==========
 
 * [The Single Responsibility Principle](#-the-single-responsibility-principle)
 * [The Open Closed Principle](#-the-open-closed-principle)
 * [The Liskov Substitution Principle](#-the-liskov-substitution-principle)
 * [The Interface Segregation Principle](#-the-interface-segregation-principle)
 * [The Dependency Inversion Principle](#-the-dependency-inversion-principle)
*/

/*:
 # 🔐 单一功能原则（Single responsibility principle）
 
 There should never be more than one reason for a class to change。
 
 应该有且仅有一个原因引起类的变更。简单点说，一个类，最好只负责一件事，只有一个引起它变化的原因。
 
 在OOP里面，高内聚、低耦合是软件设计追求的目标，而单一职责原则可以看做是高内聚、低耦合的引申，
 将职责定义为引起变化的原因，以提高内聚性，以此来减少引起变化的原因。
 职责过多，可能引起变化的原因就越多，这将是导致职责依赖，相互之间就产生影响，从而极大的损伤其内聚性和耦合度。
 单一职责通常意味着单一的功能，因此不要为类实现过多的功能点，以保证实体只有一个引起它变化的原因。
 
 
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
