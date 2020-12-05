//
//  main.swift
//  test_1
//
//  Created by YZH on 2020/11/27.
//

import Foundation


func function_task(name: String, classL: Int)->(String,Int){
    return (name,classL)
}

var (n, c) = function_task(name: "yzh",classL: 1)
print("n:",n,"c:",c)
print(type(of: n))
