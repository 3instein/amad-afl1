//
//  main.swift
//  amad-afl1
//
//  Created by Reynaldi Kindarto on 10/03/22.
//

import Foundation
import OrderedCollections

var shop = true;

var fnb: OrderedDictionary = [
    "F03": "Gado-Gado",
    "F02": "Chicken Satay",
    "F01": "Nasi Padang",
    "B02": "Mineral Water",
    "B01": "Ice Tea"
    ]

var cart: OrderedDictionary = OrderedDictionary<String, Int>()

while(shop){
    print("============================")
    print("    Point of Sales (PoS)")
    print("============================\n")

    print("Options:")
    print("[1] Buy Food")
    print("[2] Shopping Cart")
    print("[x] Exit\n")

    print("Your choice? ", terminator: ""); let choice = Int(readLine()!)

    switch choice {
    case 1:
        print("Hi, we have " + String(fnb.count) + " Food and Beverage options for you!")
        print("------------------------------------------------")
        for(code, menu) in fnb{
            print("[\(code)] \(menu)")
        }
        print("[Q] Back to Main Menu")
        while(true){
            print("\nYour F&B choice? ", terminator: ""); let fnb_option = readLine()?.uppercased()
            if(fnb_option?.caseInsensitiveCompare("q") == .orderedSame){
                break
            } else if(fnb.keys.contains(fnb_option!)){
                print("How many " + fnb["\(fnb_option ?? "")"]! + " you want to buy? ", terminator: "")
                let amount = Int(readLine()!)
                cart[fnb["\(fnb_option ?? "")"]!] = amount
                print("Shopping Cart (\(cart.count) items):")
                for item in cart{
                    print(String(item.value) + " " + String(item.key))
                }
            } else {
                print("Menu not found!")
                break
            }
        }
    case 2:
        if(cart.isEmpty){
            print("Cart is empty")
        } else {
            print("Shopping Cart (\(cart.count) items):")
            for item in cart{
                print(String(item.value) + " " + String(item.key))
            }
        }
    default:
        shop = false
    }
}





