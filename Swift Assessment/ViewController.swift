//
//  ViewController.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = sumOfEvenNumbers(numbers)
        print("Sum of even numbers: \(result)")
    }


}

