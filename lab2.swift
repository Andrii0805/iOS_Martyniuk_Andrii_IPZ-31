import Foundation

enum HouseType {
    case apartment
    case detached
    case semiDetached
    func description() -> String {
        switch self {
        case .apartment:
            return "квартира"
        case .detached:
            return "окремий будинок"
        case .semiDetached:
            return "півдуплекс"
        }
    }
}

struct House {
    var rooms: Int?
    var area: Double
    var hasPool: Bool?
    var type: HouseType
    
    func typeName() -> String {
        switch self.type {
        case .apartment:
            return "квартира"
        case .detached:
            return "оеремий будинок"
        case .semiDetached:
            return "півдуплекс"
        }
    }
}

//func typeName(_ type: HouseType) -> String {
//    switch type {
//    case .apartment:
//        return "квартира"
//    case .detached:
//        return "окремий будинок"
//    case .semiDetached:
//        return "півдуплекс"
//    }
//}

//    func describeHouse(house: House) {
//    print("Тип: \(house.type.description())")
//    print("Площа: \(house.area) м²")
//
//    if let rooms = house.rooms {
//        print("Кімнат: \(rooms)")
//    } else {
//        print("Кімнат: невідомо")
//    }
//
//    let pool = house.hasPool ?? false
//    if house.hasPool == nil {
//        print("Басейн: інформації немає")
//    } else {
//        print("Басейн: \(pool ? "є" : "немає")")
//    }
//}

func describeHouse(house: House) {
    print("Тип: \(house.typeName())")
    print("Площа: \(house.area) м²")

    if let rooms = house.rooms {
        print("Кімнат: \(rooms)")
    } else {
        print("Кімнат: невідомо")
    }

    let pool = house.hasPool ?? false
    if house.hasPool == nil {
        print("Басейн: інформації немає")
    } else {
        print("Басейн: \(pool ? "є" : "немає")")
    }
}

class Owner {
    var name: String
    var house: House

    init(name: String, house: House) {
        self.name = name
        self.house = house
    }

    func printHouseInfo() {
        print("Власник: \(name)")
        describeHouse(house: house)
    }
}

let houses = [
    House(rooms: 3, area: 75.5, hasPool: false, type: .apartment),
    House(rooms: 6, area: 210.0, hasPool: true, type: .detached),
]

for house in houses {
    describeHouse(house: house)
    print("____")
}

let owner = Owner(name: "Олег", house: houses[1])
owner.printHouseInfo()
print("___________________________________")
//Написати функцію, яка приймає масив обєктів класу House та повертає площе найбільшого із них
func toparea(houses: [House]) -> Double?  {
    guard var maxValue = houses.first?.area else {
        return nil
    }
    for house in houses {
        if house.area > maxValue {
            maxValue = house.area
        }
    }
    return maxValue
}

if let result = toparea(houses: houses) {
    print("найбільша площа: \(result) м^2")
}
