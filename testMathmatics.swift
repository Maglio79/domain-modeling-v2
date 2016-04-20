//
//  MathmaticsTest.swift
//  SimpleDomainModel
//
//  Created by Chris Maglio on 4/19/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

import XCTest

import SimpleDomainModel

class testMathmatics: XCTestCase {
    
    func test1() {
        let u = Money(amount: 9, currency : "USD")
        XCTAssert((u.addition(Money(amount: 10, currency : "EUR"))).amount == (u.addition(Money(amount: 10, currency : "EUR"))).amount && (u.addition(Money(amount: 10, currency : "EUR"))).currency == (u.addition(Money(amount: 10, currency : "EUR"))).currency)
    }
    
    func test2() {
        let u = Money(amount: 15, currency : "USD")
        XCTAssert((u.subtraction(Money(amount: 1, currency : "GBP"))).amount == (u.subtraction(Money(amount: 1, currency : "GBP"))).amount && (u.subtraction(Money(amount: 1, currency : "GBP")
            )).currency == (u.subtraction(Money(amount: 1, currency : "GBP"))).currency)
    }
}