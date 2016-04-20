//
//  test_convertablestring.swift
//  test convertablestring
//
//  Created by Chris Maglio on 4/19/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel

class test_convertablestring: XCTestCase {
    
    func testConvertabletoStringMoney() {
        let money = Money(amount: 5, currency : "USD")
        XCTAssert(money.toString2() == money.toString2())
    }
    
    func testConvertabletoStringJob() {
        let job = Job(title: "Barista", type : Job.JobType.Hourly(10.0))
        XCTAssert(job.toString2() == job.toString2())
    }
    
    func testConvertabletoStringJob2() {
        let job = Job(title: "Developer", type : Job.JobType.Salary(100000))
        XCTAssert(job.toString2() == job.toString2())
    }
    
    func testConvertabletoStringPerson() {
        let person = Person(firstName: "Bob", lastName: "Saget", age: 80)
        XCTAssert(person.toString2() == person.toString2())
    }
    
    func testConvertabletoStringFamily() {
        let barista = Job(title : "Barista", type : Job.JobType.Hourly(10.0))
        let spouse1 = Person(firstName: "bob", lastName : "Saget", age : 80)
        spouse1.job = barista
        let spouse2 = Person(firstName: "sally", lastName : "field", age : 79)
        spouse2.job = Job(title : "burger flipper", type : Job.JobType.Hourly(15.0))
        let family = Family(spouse1: spouse1, spouse2: spouse2)
        XCTAssert(family.toString2() == family.toString2())
    }
    
}
