//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class SignINModel{

    //static var token: String? = nil

    func subscribe(name: NSNotification.Name){
        NotificationCenter.default.addObserver(self, selector: #selector(catchingNotification(_:)), name: name, object: nil)
    }

    func unsubscript(){
        NotificationCenter.default.removeObserver(self)
    }
    @objc func catchingNotification(_ notification: NSNotification){
        _ = notification.userInfo!["idNumber"]
        //TO DO: Request to server
    }

}
