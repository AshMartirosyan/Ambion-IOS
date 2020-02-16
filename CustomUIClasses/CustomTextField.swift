//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class CustomTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
