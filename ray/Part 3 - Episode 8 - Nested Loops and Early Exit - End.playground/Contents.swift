//: ## Episode 08: Nested Loops and Early Exit

let daysOfTheWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

let poolTemperature: [Int] = [78, 81, 74, 80, 79, 83, 84]

for i in 0..<daysOfTheWeek.count {
    if daysOfTheWeek[i] == "Thursday" {
        break
    }
    print("\(daysOfTheWeek[i]): \(poolTemperature[i])")
}

print("---")

for i in 0..<daysOfTheWeek.count {
    if daysOfTheWeek[i] == "Friday" {
        print("I'm in love")
        continue
    }
    print("\(daysOfTheWeek[i]): \(poolTemperature[i])")
}

print("---")

floor_loop: for floor in 11...15 {
    if floor == 13 {
        continue
    }
    room_loop: for room in 1...4 {
        if room == 1 {
            continue
        }
        if floor == 12 && room == 3 {
            continue floor_loop
        }
        print("\(floor)-\(room)")
    }
}


for _ in 1...5 {
    for _ in 1...10 {
        print("*", terminator: "")
    }
    print("\n")
}

print("_______")

var pastriest: [String] = ["cookie", "danish", "cupcake", "donut", "pie", "brownie", "fritter"]

for i in 1..<pastriest.count {
    if pastriest[i].count <= 5 {
        print("\(pastriest[i])")
    }
    else { continue }
    
}

print("_______")

var daysOfWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

for day in daysOfTheWeek {
    if day == "Sunday" {
        continue
    }
        print(day)
    if day == "Friday" {
        break
    }
}

var emptyDic: [String: Int] = [:]
var namesAndPets = ["Ron": "Rat",
                    "bill": "pig",
                    "Jack": "Horse",
                    "Vanda": "Cat",
                    "Sara": "Dog",
                    "Goku": "Giraffe"
]
print(namesAndPets)
namesAndPets.updateValue("Mango", forKey: "Vanda")
print(namesAndPets)

namesAndPets["bill"] = "Tiger"
namesAndPets.updateValue("Qwl", forKey: "Sara")
print(namesAndPets)

namesAndPets ["Vanda"]

let tuplet = namesAndPets["captain anab"] ?? "No white whale for"
namesAndPets.isEmpty
namesAndPets.count
namesAndPets.removeValue(forKey: "Ron")
print(namesAndPets)

namesAndPets["Goku"] = nil
print(namesAndPets)

for (ch, pe) in namesAndPets {
    print("\(ch) has a \(pe)")
}

for (name, _) in namesAndPets {
    print(name)
}

print("________")

for name in namesAndPets.keys {
    print(name)
}

for pet in namesAndPets.values {
    print(pet)
}

print("________")

var soma = [
    "name": "Soma",
    "profession": "designer",
    "country": "Hungary",
    "city": "Debrecen"
]
print(soma)

soma["country"] = "USA"
soma["city"] = "Boston"
soma["state"] = "Hajdu-bihar"
print(soma)

soma["city"] = nil
print(soma)

for (att, som) in soma {
    print("Soma's \(att) is \(som)")
}
print("Sets ________")


// SETS ------------------------->

var someSet: Set<Int> = [1, 2, 3, 1]
someSet.contains(1)
someSet.insert(5)
let removed = someSet.remove(3)
let nilElement = someSet.remove(23)
print(someSet)
let anotherSet: Set<Int> = [2, 32, 4, 3]
let intersection = someSet.intersection(anotherSet)
someSet.formUnion(anotherSet)
print(someSet)
print(anotherSet)

print("________\n\n")

var myth: Set<String> = [
"owl",
"Hammer",
"Luggage",
"Toothless",
"Nimbus"
]

var animalPets = Set<String>()
animalPets.insert("owl")
animalPets.insert("Mango")
animalPets.insert("Tréfa")
animalPets.insert("Zizi")

print("The union is \(myth.union(animalPets))")
print("\(myth.intersection(animalPets))")

let removedPet = animalPets.remove("Mango")

print("\(myth.formUnion(animalPets))")
print(myth)

print("\n\n------- Functions ------\n\n")

func printFullName(_ firstName: String, _ lastName: String) {
    print(firstName + " " + lastName)
}

printFullName("Soma", "Szoboszlai")

func calculateFullName(_ firstName: String, _ lastName: String) -> String {
    return firstName + " " + lastName
}

let name = calculateFullName("Some", "Szoboszlai")

print("\n\n------- Struct ------\n\n")

struct Student1 {
    let name: String
    var grade: Int
    var pet: String?
    func getPassStatus(lowestPass: Int = 50) -> Bool{
        return grade >= lowestPass
    }
    mutating func earnExtra() {
        grade += 10
    }
}

var somaa = Student1(name: "Soma Szoboszlai", grade: 47, pet: "Mango")
let sam = Student1(name: "Sam Szoai", grade: 24, pet: "Dog")
let Vanda = Student1(name: "Vanda", grade: 62, pet: "Frog")


somaa.earnExtra()
somaa.getPassStatus()

var evilSoma = Vanda

evilSoma.grade = 200
evilSoma.pet = "Ozma"

print(Vanda)
print(evilSoma)

print("\nchallege\n")

struct Student {
    let firstName: String
    let lastName: String
    var grade: Int
}

struct ClassRoom {
    let subject: String
    var students: [Student]
    
    func highest() -> Int? {
        var grades: [Int] = []
        for student in students {
            grades.append(student.grade)
        }
        return grades.max()
    }
}

let classroom = ClassRoom(subject: "design", students: [
        Student(firstName: "Vanda", lastName: "Guba", grade: 5),
        Student(firstName: "Soma", lastName: "Szoboszlai", grade: 4),
        Student(firstName: "Ákos", lastName: "Porcsin", grade: 3)
        ])

classroom.highest()
print("\n\n------- Classes ------\n\n")

class Actor {
    let name: String
    var filmography: [String] = []
    init(name: String, filmography: [String]) {
        self.name = name
        self.filmography = filmography
    }
    
    func signOnForSequel(franchiseName: String) {
        
        filmography.append("Upcoming \(franchiseName) sequel")
    }
}

let lotrStar = Actor(name: "Soma Szoboszlai", filmography: ["LoTR", "Hero"])
lotrStar.filmography.append("Avatar")
let starTrekStar = lotrStar
starTrekStar.filmography.append("StarTrek")
var avatarStar = starTrekStar
for franchiseName in avatarStar.filmography {
    avatarStar.signOnForSequel(franchiseName: franchiseName)
}

class Tanulo {
  let name: String
  var grade: Int
  var pet: String?
    
    init(name: String, grade: Int, pet: String? = nil) {
        self.name = name
        self.grade = grade
        self.pet = pet
    }

  func getPassStatus(lowestPass: Int = 50) -> Bool {
    grade >= lowestPass
    }

    func earnExtraCredit() {
    grade += 10
  }
}

let chris = Tanulo(name: "Chris", grade: 49, pet: "Mango")
let samy = Tanulo(name: "Same", grade: 32)
chris.getPassStatus()
chris.earnExtraCredit()
chris.getPassStatus()
