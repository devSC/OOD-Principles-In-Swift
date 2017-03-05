import UIKit

/*:
# 🍴 接口隔离原则（interface-segregation principles， 缩写：ISP）
 指明没有客户（client）应该被迫依赖于它不使用方法。
 接口隔离原则(ISP)拆分非常庞大臃肿的接口成为更小的和更具体的接口，
 这样客户将会只需要知道他们感兴趣的方法。这种缩小的接口也被称为角色接口（role interfaces）。
 接口隔离原则(ISP)的目的是系统解开耦合，从而容易重构，更改和重新部署。
 接口隔离原则是在SOLID (面向对象设计)中五个面向对象设计(OOD)的原则之一，
 类似于在GRASP (面向对象设计)中的高内聚性。
 
 [WIKI](https://zh.wikipedia.org/wiki/%E6%8E%A5%E5%8F%A3%E9%9A%94%E7%A6%BB%E5%8E%9F%E5%88%99)
 
Example:
*/

//I have a landing site
protocol LandingSiteHaving {
    var landingState: String { get }
}

// I can land on LandingSiteHaving object
protocol Landing {
    func landOn(on: LandingSiteHaving) -> String
}

// I have payload
protocol PayloadHaving {
    var payload: String { get }
}

// I can fetch payload from vehicle (ex. via Canadarm)
final class InternationalSpaceStation {
    
    func fetchPayload(vehicle: PayloadHaving) -> String {
        return "Deployed \(vehicle.payload) at April 10, 2017, 10: 53 UTC"
    }
}


//I'm a barge - I have landing site ()
final class OfCourceIStillLoveYouBarge: LandingSiteHaving {
    var landingState: String = "a barge on the Atlantic Ocean"
}

//I have payload and can land on things having landing site
//I'm a very limited Space Vehicle, I kow
class SpaceXCRS8: Landing, PayloadHaving {
    
    let payload: String = "Beam and some Cube sats"
    
/*:
 > ⚠ CRS8 knows only about the landing site information.
 */
    func landOn(on: LandingSiteHaving) -> String {
        return "Landed on \(on.landingState) at April 8, 2017, 20:52 UTC"
    }
}

let crs8 = SpaceXCRS8()
let barge = OfCourceIStillLoveYouBarge()
let spaceStation = InternationalSpaceStation()

spaceStation.fetchPayload(vehicle: crs8)
crs8.landOn(on: barge)


/*:
 [MORE](http://www.cnblogs.com/landeanfen/p/5266209.html)
 */
