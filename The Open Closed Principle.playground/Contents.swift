//: Playground - noun: a place where people can play

import UIKit

/*:
 # ✋ The Open Closed Principle
 
 You should be able to extend a classes behavior, without modifying it. ([WIKI](https://zh.wikipedia.org/wiki/%E5%BC%80%E9%97%AD%E5%8E%9F%E5%88%99))
 
 开闭原则规定“软件中的对象（类，模块，函数等等）应该对于扩展是开放的，但是对于修改是封闭的
 
 这里可以联想到Swift语言的设计, 她允许添加给所有类添加extension来满足特定需求,
 但对系统类的修改却是不允许的, 其实这里也符合开闭原则.
 
 Example:
 */


protocol CanShoot {
    func shoot() -> String
}

//I'm a laser beam, I can shoot
final class LaserBeam: CanShoot {
    func shoot() -> String {
        return "Ziiiiiiiiip!"
    }
}

//I have weapons and trust me i can fire them all at once. Boom! Boom! Boom!
final class WeaponsComposite {
    
    let weapons: [CanShoot]
    
    init(weapons: [CanShoot]) {
        self.weapons = weapons
    }
    
    func shoot() -> [String] {
        return weapons.map { $0.shoot() }
    }
}

let laser = LaserBeam()
var weapons = WeaponsComposite(weapons: [laser])
weapons.shoot()

/*:
 I'm a rocket launcher, I can shoot a rocket.
 > ⚠️ To add rocket launcher support I don't need to change anything in existing classes.
*/

final class RocketLauncher: CanShoot {
    func shoot() -> String {
        return "Whoosh..."
    }
}

let rocket = RocketLauncher()
weapons = WeaponsComposite(weapons: [laser, rocket])
weapons.shoot()


/*:
 [MORE](http://www.cnblogs.com/landeanfen/p/5272144.html)
*/
