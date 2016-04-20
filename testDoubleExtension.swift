//
//  testDoubleExtension.swift
//  SimpleDomainModel
//
//  Created by Chris Maglio on 4/19/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

import XCTest

import SimpleDomainModel

class testDoubleExtension: XCTestCase {
    
    func testIt() {
        let money = 3.0.USD
        XCTAssert(money.toString2() == money.toString2())
    }
    
    func testIt2() {
        let money = 5.0.EUR
        XCTAssert(money.toString2() == money.toString2())
    }
}
