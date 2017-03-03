//: Playground - noun: a place where people can play

import UIKit

/*:
# 👥 The Liskov Substitution Principle.
 
 Drived classes must be substitution for their base classes  ([read more](http://docs.google.com/a/cleancoder.com/viewer?a=v&pid=explorer&chrome=true&srcid=0BwhCYaYDn8EgNzAzZjA5ZmItNjU3NS00MzQ5LTkwYjMtMDJhNDU5ZTM0MTlh&hl=en))
 
 Example:
*/

let requestKey: NSString = "NSURLRequestKey"

class RequestError: NSError {

    var reuest: NSURLRequest? {
        return self.userInfo[requestKey] as? NSURLRequest
    }
}


func fetchData(request: NSURLRequest) -> (data: NSData?, error: RequestError?) {
    let userInfos: [NSObject: AnyObject] = [requestKey : request]
    return (nil, RequestError(domain: "Domain", code: 0, userInfo: userInfos))
}

func willReturnObjectOrError() -> (object: AnyObject?, error: NSError?) {
    let request = NSURLRequest()
    let result = fetchData(request: request)
    return (result.data, result.error)
}

let result = willReturnObjectOrError()

// Ok. This is a perfect NSError instance from my perspective.
let error: Int? = result.error?.code

// But hey!  What's that? It's also a RequestError! Nice!
if let requestError = result.error as? RequestError {
    requestError.reuest
}


