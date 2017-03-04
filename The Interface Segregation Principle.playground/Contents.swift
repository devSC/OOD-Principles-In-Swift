import UIKit

/*:
# 🍴 The Interface Segregation Principle
 
 Make fine grained interfaces that are client specific. ([read more](http://docs.google.com/a/cleancoder.com/viewer?a=v&pid=explorer&chrome=true&srcid=0BwhCYaYDn8EgOTViYjJhYzMtMzYxMC00MzFjLWJjMzYtOGJiMDc5N2JkYmJi&hl=en))
 
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

