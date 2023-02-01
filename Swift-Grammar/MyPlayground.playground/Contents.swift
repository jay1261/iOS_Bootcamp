// Closures

// { (number1: Int, number2: Int) -> Int in
//
//     let result = number1 + number2
//     return result
//
// }


import UIKit

let array = [1, 2, 3, 4, 5, 6, 7]

let newarray = array.map({(n1: Int) -> Int in return n1+1})

print(newarray)
