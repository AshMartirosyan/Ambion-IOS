//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class Dispatcher{

    static func dispatch(name:NSNotification.Name, object:Any?, userInfo: [AnyHashable: Any]?){
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }

}
