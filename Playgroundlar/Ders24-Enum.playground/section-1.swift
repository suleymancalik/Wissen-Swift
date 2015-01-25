// Playground - noun: a place where people can play

import UIKit

enum PaymentType {
    case Cash
    case CreditCard
    case Ticket
    case Check
    
    
    func print() {
        switch self {
        case .Cash:
            println("Cash")
        default:
            println("Other")
        }
    }
}


class Payment {
    
    var amount:Double
    var paymentType:PaymentType
    
    init(amount:Double , type:PaymentType) {
        self.amount = amount
        self.paymentType = type
    }
}



var newPayment = Payment(amount: 10, type: PaymentType.Cash)


newPayment.paymentType.print()



