//
//  Exercise1.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import Foundation

func sumOfEvenNumbers(_ numbers: [Int]) -> Int {
    var sum = 0
    
    for number in numbers {
        if number % 2 == 0 {
            sum += number
        }
    }
    return sum
}
