//: Playground - noun: a place where people can play

import UIKit

/*:
# 👥 The Liskov Substitution Principle.
 
 Drived classes must be substitution for their base classes  ([WIKI](https://zh.wikipedia.org/wiki/%E9%87%8C%E6%B0%8F%E6%9B%BF%E6%8D%A2%E5%8E%9F%E5%88%99))
 派生类（子类）对象能够替换其基类（超类）对象被使用
 
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


