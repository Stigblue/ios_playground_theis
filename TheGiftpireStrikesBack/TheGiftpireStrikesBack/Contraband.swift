
import Foundation

enum Nut {
    case almond, pecan
}

func randomIdentifier(count: Int = 5) -> String {
    .init((0..<count).map { _ in "ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement() ?? "0" })
}

struct Chocolate: Identifiable {
    let id: String = randomIdentifier()
    var brand:String
    var cocoaPercentage:Int
    var nuts:[Nut]
    var raisins:Bool
    
    static let lindt90 = Chocolate(brand: "Lindt", cocoaPercentage: 90, nuts: [], raisins: false)
    static let ritterRumRaisins = Chocolate(brand: "Ritter Sport", cocoaPercentage: 40, nuts: [.almond], raisins: true)
    
}

struct Wine: Identifiable {
    
    enum WineColor:String {
        case red, white
    }
    
    let id: String = randomIdentifier()
    var color:WineColor
    var year:Int
    var castle:String
    
    static let dracula = Wine(color: .red, year: 2004, castle: "Chateau de Sang")
    static let dessert = Wine(color: .white, year: 1994, castle: "Castel de Lago")
    
}

enum Gift: Identifiable {
    #warning("The Empire doesn't like unidentified contraband, to get through the check points we need to make `Gift` Identifable!")
    var id: String {
        return randomIdentifier()
    }
    
    case wine(Wine)
    case chocolate(Chocolate)
}

public struct PresentWrapped {
    let gift: Gift
    
    static let presentWineGift = PresentWrapped(gift: .wine(.dessert))
    static let presentChocolateGift = PresentWrapped(gift: .chocolate(.lindt90))
}
