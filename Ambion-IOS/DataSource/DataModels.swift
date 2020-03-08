//  Copyright © 2020 Ashot Martirosyan. All rights reserved.

import UIKit

class AuthenticationKey{
    private var securityToken: String? = nil
    
    func getToken() -> String? {
        return self.securityToken
    }
    
    func setToken(token securityToken:String){
        self.securityToken = securityToken
    }
}

protocol Person{
    var firstName: String { get }
    var middleName: String { get }
    var lastName: String { get }
}

struct Student: Person {
    let firstName: String
    let middleName: String
    let lastName: String
    let faculty: String
    let course: Double
    let flow: Double
    let group: Double
    let photo: UIImage?
}

struct Lecturer: Person{
    let firstName: String
    let middleName: String
    let lastName: String
    let facultyChair:String
    let photo: UIImage?
}
