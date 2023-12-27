//
//  Excercise1Test.swift
//  Swift AssessmentTests
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import XCTest

final class Excercise1Test: XCTestCase {
    
    func sumOfEvenNumbers(_ numbers: [Int]) -> Int {
        var sum = 0
        
        for number in numbers {
            if number % 2 == 0 {
                sum += number
            }
        }
        
        return sum
    }

    func testSumOfEvenNumbers() {
        // Arrange
        let numbers1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let numbers2 = [11, 13, 15, 17, 19]
        let numbers3 = [2, 4, 6, 8, 10]
        
        // Act
        let result1 = sumOfEvenNumbers(numbers1)
        let result2 = sumOfEvenNumbers(numbers2)
        let result3 = sumOfEvenNumbers(numbers3)
        
        // Assert
        XCTAssertEqual(result1, 30, "Sum of even numbers for numbers1 should be 30")
        XCTAssertEqual(result2, 0, "Sum of even numbers for numbers2 should be 0")
        XCTAssertEqual(result3, 30, "Sum of even numbers for numbers3 should be 30")
    }
}
