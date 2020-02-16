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

class Student: Person {
    let firstName: String
    let middleName: String
    let lastName: String
    let faculty: String
    let course: Double
    let flow: Double
    let group: Double
    let photo: UIImage?

    required init(FirstName firstName: String,
                  MiddleName middleName: String,
                  LastName lastName: String,
                  Faculty faculty: String,
                  Course course: Double,
                  Flow flow: Double,
                  Group group: Double,
                  Photo photo: UIImage){
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.faculty = faculty
        self.course = course
        self.flow = flow
        self.group = group
        self.photo = photo
    }
}

class Lecturer: Person{
    let firstName: String
    let middleName: String
    let lastName: String
    let facultyChair:String
    let photo: UIImage?
    
    required init(FirstName firstName: String,
                  MiddleName middleName: String,
                  LastName lastName: String,
                  FacultyChair facultyChair: String,
                  Photo photo: UIImage){
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.facultyChair = facultyChair
        self.photo = photo
    }
}
