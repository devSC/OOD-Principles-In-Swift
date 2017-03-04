import UIKit

/*:
 # 🔩 The Dependency Inversion Principle
 
 Depend on abstractions, not on concretions. ([read more](http://docs.google.com/a/cleancoder.com/viewer?a=v&pid=explorer&chrome=true&srcid=0BwhCYaYDn8EgMjdlMWIzNGUtZTQ0NC00ZjQ5LTkwYzQtZjRhMDRlNTQ3ZGMz&hl=en))
 
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
		