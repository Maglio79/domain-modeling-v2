//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

public func testMe() -> String {
    return "I have been tested"
}

public class TestMe {
    public func Please() -> String {
        return "I have been tested"
    }
}

protocol CustomStringConvertible {
    func toString2() -> String
}

protocol Mathmatics {
    func addition(other: Money) -> Money
    func subtraction(other: Money) -> Money
}
func + (left: Money, right : Money) -> Money {
    return left.addition(right)
}

func - (left: Money, right : Money) -> Money {
    return left.subtraction(right)
}

extension Double {
    var EUR : Money { return Money(amount: Int(self), currency: "EUR") }
    var GBP : Money { return Money(amount: Int(self), currency: "GBP") }
    var USD : Money { return Money(amount: Int(self), currency: "USD") }
    var CAN : Money { return Money(amount: Int(self), currency: "CAN") }
}

////////////////////////////////////
// Money
//
public struct Money : CustomStringConvertible, Mathmatics{
    public var amount : Int
    public var currency : String

    public func toString2() -> String {
        return "\(self.currency, self.amount)"
    }
    
    public func addition(other: Money) -> Money {
        if(self.currency != other.currency) {
            other.convert(self.currency)
        }
        return Money(amount: (self.amount + other.amount), currency: self.currency)
    }
    
    public func subtraction(other: Money) -> Money {
        if(self.currency != other.currency) {
            other.convert(self.currency)
        }
        return Money(amount: (self.amount - other.amount), currency: self.currency)
    }
    
    public func convert(to: String) -> Money {
        var v = Double(self.amount)
        let b = self.currency
        if ((to == "GBP"  || to == "gbp" || to == "Gbp") && (b == "USD" || b == "usd" || b == "Usd")) {
            v = Double(v) * (1 / 2)
            return Money(amount : Int(v), currency : "GBP")
        } else if ((to == "EUR" || to == "eur" || to == "Eur") && (b == "USD" || b == "usd" || b == "Usd")) {
            v = Double(v) * (3 / 2)
            return Money(amount : Int(v), currency : "EUR")
        } else if ((to == "CAN" || to == "can" || to == "Can") && (b == "USD" || b == "usd" || b == "Usd")) {
            v = Double(v) * (5 / 4)
            return Money(amount : Int(v), currency : "CAN")
        } else if ((b == "GBP"  || b == "gbp" || b == "Gbp") && (to == "USD" || to == "usd" || to == "Usd")) {
            v = Double(v) * (2)
            return Money(amount : Int(v), currency : "USD")
        } else if ((b == "GBP"  || b == "gbp" || b == "Gbp") && (to == "CAN" || to == "can" || to == "Can")) {
            v = Double(v) * (5 / 2)
            return Money(amount : Int(v), currency : "CAN")
        } else if ((b == "GBP"  || b == "gbp" || b == "Gbp") && (to == "EUR" || to == "eur" || to == "Eur")) {
            v = Double(v) * (3)
            return Money(amount : Int(v), currency : "EUR")
        } else if ((b == "EUR" || b == "eur" || b == "Eur") && (to == "USD" || to == "usd" || to == "Usd")) {
            v = Double(v) * (2 / 3)
            return Money(amount : Int(v), currency : "USD")
        } else if ((b == "EUR" || b == "eur" || b == "Eur") && (to == "GBP" || to == "gbp" || to == "Gbp")) {
            v = Double(v) * (1 / 3)
            return Money(amount : Int(v), currency : "GBP")
        } else if ((b == "EUR" || b == "eur" || b == "Eur") && (to == "CAN" || to == "can" || to == "Can")) {
            v = Double(v) * (0.83)
            return Money(amount : Int(v), currency : "CAN")
        } else if ((b == "CAN" || b == "can" || b == "Can") && (to == "USD" || to == "usd" || to == "Usd")) {
            v = Double(v) * (8 / 10)
            return Money(amount : Int(v), currency : "USD")
        } else if ((b == "CAN" || b == "can" || b == "Can") && (to == "EUR" || to == "eur" || to == "Eur")) {
            v = Double(v) * (12 / 10)
            return Money(amount : Int(v), currency : "EUR")
        } else if ((b == "CAN" || b == "can" || b == "Can") && (to == "GBP" || to == "gbp" || to == "Gbp")) {
            v = Double(v) * (4 / 10)
            return Money(amount : Int(v), currency : "GBP")
        } else {
            print("Money type invalid please choose CAN, GBP, USA, or EUR as selected currency for conversion")
            return Money(amount: self.amount, currency : self.currency)
        }
    }
    
    public func add(to: Money) -> Money {
        if to.currency == self.currency {
            let v = to.amount + self.amount
            return Money(amount: v, currency: to.currency)
        } else {
            let v = to.currency
            let b = self.convert(v)
            let h = to.amount + b.amount
            return Money(amount : h, currency : v)
        }
    }
    public func subtract(from: Money) -> Money {
        if from.currency == self.currency {
            let v = from.amount - self.amount
            return Money(amount: v, currency: from.currency)
        } else {
            let v = from.currency
            let b = self.convert(v)
            let h = from.amount - b.amount
            return Money(amount : h, currency : v)
        }
    }
}

////////////////////////////////////
// Job
//
public class Job : CustomStringConvertible {
    public var title : String
    public var type : JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
    public func toString2() -> String {
        return "\(self.title) is a \(self.type) position making \(self.calculateIncome(2000)) a year"
    }
    
    public func calculateIncome(hours: Int) -> Int {
        switch(self.type) {
        case .Hourly(let v)  : return Int(Double(hours) * v)
        case .Salary(let b) : return b
        }
    }
    
    public func raise(amt : Double) {
        switch(self.type) {
        case .Hourly(let v)  : self.type = JobType.Hourly(v + amt)
        case .Salary(let b) : self.type = JobType.Salary(b + Int(amt))
        }
    }
}

////////////////////////////////////
// Person
//
public class Person : CustomStringConvertible {
    public var firstName : String = ""
    public var lastName : String = ""
    public var age : Int = 0
    
    private var _job : Job?
    private var _spouse : Person?
    
    public var job : Job? {
        get { return self._job }
        set(value) {
            if age < 17 {
                print("This youngin cannot have a job he/she is too young")
            } else {
                _job = value
            }
        }
    }
    
    public func toString2() -> String {
        return "\(self.firstName, self.lastName) is \(self.age) and if they have a job it is \(self.job) and if they have a spouse he/she is \(self.spouse)"
    }
    
    public var spouse : Person? {
        get { return self._spouse }
        set(value) {
            if age >= 18 {
                _spouse = value
            }
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    public func toString() -> String {
        return ("[Person: firstName:\(self.firstName) lastName:\(lastName) age:\(age) job:\(job) spouse:\(spouse)]")
    }
}

////////////////////////////////////
// Family
//
public class Family : CustomStringConvertible {
    private var members : [Person] = []
    
    public init(spouse1: Person, spouse2: Person) {
        if spouse1.spouse == nil && spouse2.spouse == nil {
            spouse1.spouse = spouse2
            spouse2.spouse = spouse1
            members.append(spouse1)
            members.append(spouse2)
        }
    }
    public func toString2() -> String {
       var cummulative = ""
        for person in members { cummulative += "\(person.firstName) " }
        return ("This is a family of \(members.endIndex + 1).  The people in it are \(cummulative) and the household income is \(self.householdIncome())")
            
    }
    public func haveChild(child: Person) -> Bool {
        if(members[0].age > 20 || members[1].age > 20) {
            members.append(child)
        }
        return(members[0].age > 20 || members[1].age > 20)
    }
    
    public func householdIncome() -> Int {
        var total = 0
        for person in members {
            if (person.job != nil) {
                total = total + Int(person.job!.calculateIncome(2000))
            }
        }
        return Int(total)
    }
}
