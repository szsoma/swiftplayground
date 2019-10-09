import UIKit

// Dictionaries

var carDB2 = Dictionary<String, String>()
//Declaring a new Dictionary
var carDB = [String:String]()

// Adding key value pairs
carDB["JSD 238"] = "Blue Ferrari"
carDB["LAM 100"] = "Green Lamborghini"

//Retrieving data
carDB["JSD 238"]

// Update a value for a key
carDB["JSD 238"] = "Red Ferrari"

// Remove key value pair
//carDB["JSD 238"] = nil

// Iterate over it
for (license, car) in carDB {
    print("\(car) has a license: \(license)")
}

