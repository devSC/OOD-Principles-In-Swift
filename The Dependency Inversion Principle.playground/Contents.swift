import UIKit

/*:
 # 🔩 The Dependency Inversion Principle
 
 High level modules should not depend upon low level modules. Both should depend upon abstractions. Abstractions should not depend upon details. Details should depend upon abstractions。 [WIKI](https://zh.wikipedia.org/wiki/%E4%BE%9D%E8%B5%96%E5%8F%8D%E8%BD%AC%E5%8E%9F%E5%88%99)
 
 高层模块不应该依赖低层模块，两者都应该依赖其抽象；抽象不应该依赖细节，细节应该依赖抽象
 
 对于OC来说, 更多的使用Protocol来定义接口, 使各个对象只通过依赖抽象接口来实现事件传递
 而Swift的现代语言来说, 其语言设计时就吸取了POP的编程模式, 所以发挥Swift的优点即可.
 
 Example:
*/
protocol TimeTraveling {
    func travelInTime(time: TimeInterval) -> String
}

final class DeLorean: TimeTraveling {
    func travelInTime(time: TimeInterval) -> String {
        return "Used Flux Capacitor and travelled in time by: \(time)s"
    }
}

final class EmmettBrow {
    private let timeMachine: TimeTraveling
/*:
> ⚠ Emmet Brow is given the `DoLorean` as a `TimeTraveling` device, not the concrete
     class `Dolorean`
     
*/
    init(timeMachine: TimeTraveling) {
        self.timeMachine = timeMachine
    }
    
    func travelInTime(time: TimeInterval) -> String {
        return timeMachine.travelInTime(time: time)
    }
}

let timeMachine = DeLorean()

let mastermind = EmmettBrow(timeMachine: timeMachine)
mastermind.travelInTime(time: -2600 * 8760)


/*:
 [MORE](http://www.cnblogs.com/landeanfen/p/5169163.html)
*/
