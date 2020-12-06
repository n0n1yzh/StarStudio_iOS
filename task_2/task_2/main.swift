//
//  main.swift
//  task_2
//
//  Created by YZH on 2020/12/4.
//

import Foundation

class Human{
    var sex: String = ""
    var age: String = ""
    var name: String = ""
    func humanOut(){
        print("sex:",sex,", age:",age,", name:",name)
    }
}


class Student: Human{
    var school: String = ""
    var faculty: String = ""
    var grade: String = ""
    var classindex: String = ""
    private var number: String = ""
    
    func setNumber(number: String){
        self.number = number
    }
    
    func studentOut(){
        print("sex:",sex,", age:",age,", name:",name,", school:",school,", faculty:",faculty,", grade:",grade,", class:",classindex,", number:",number)
    }
}

var human = Human()
var student = Student()

human.sex = "Male"
human.age = "37"
human.name = "David"
human.humanOut()

student.sex = "Female"
student.age = "19"
student.name = "Lily"
student.school = "UESTC"
student.faculty = "SICE"
student.grade = "2020"
student.classindex = "01"
student.setNumber(number: "2020011201021")
student.studentOut()
