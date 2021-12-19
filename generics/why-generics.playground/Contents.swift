import UIKit

/*
let numbers = [1,2,3,5,6,7,10]

func firstLast(_ numbers: [Int]) -> (Int, Int) {
    return (numbers[0], numbers[numbers.count - 1])
}

let (first, last) = firstLast(numbers)

print(first)
print(last)

// 만약 배열 요소들의 타입이 문자열이라면?
// 해결방법 1. 매개변수, 반환값의 타입이 다른 함수를 만든다

let names = ["Alex", "John", "Mary", "Steve"]

func firstLast(_ names: [String]) -> (String, String) {
    return (names[0], names[names.count - 1])
}

let (first2, last2) = firstLast(names)

print(first2)
print(last2)

// 해결방법 2. 행동은 같으나 타입만 다를 때 제네릭을 활용해 하나의 함수로 해결한다

func firstLastGeneric<T>(_ list: [T]) -> (T, T) {
    return (list[0], list[list.count - 1])
}

let (first3, last3) = firstLastGeneric(numbers)
let (first4, last4) = firstLastGeneric(names)

print(first3)
print(last3)

print(first4)
print(last4)

struct Movie {
    let name: String
}

let movies = [Movie(name: "Batman"), Movie(name: "Superman"), Movie(name: "Spiderman")]

let (first5, last5) = firstLastGeneric(movies)

print(first5)
print(last5)

struct Movie: Equatable {
    let name: String
}

let numbers = [1,2,3,5,6,7,10]
let names = ["Alex", "John", "Mary", "Steve"]
let movies = [Movie(name: "Batman"), Movie(name: "Superman"), Movie(name: "Spiderman")]

func findIndex<T: Equatable>(from list: [T], valueToFind: T) -> Int? {
    list.firstIndex { $0 == valueToFind }
}

print(findIndex(from: numbers, valueToFind: 7))
print(findIndex(from: names, valueToFind: "Mary"))

let batman = Movie(name: "Batman")
print(findIndex(from: movies, valueToFind: batman))

func serializeToData<T: Encodable>(_ value: T) -> Data? {
    return try? JSONEncoder().encode(value)
}

print(serializeToData("Hello World"))

struct Movie: Encodable {
    let name: String
}

print(serializeToData(Movie(name: "Batman")))

protocol Fly { func fly() }
protocol Teleport { func teleport() }
protocol Strength { func throwObject() }

typealias SuperHero = Fly & Teleport & Strength

struct ElectronMan: SuperHero {
    func fly() { }
    func teleport() { }
    func throwObject() { }
}

struct SuperMan: Fly {
    func fly() { }
}

func attack<T: SuperHero>(value: T) {
    
}

let electronMan = ElectronMan()
attack(value: electronMan)

let superman = SuperMan()
// attack(value: superman) Superman은 Fly는 충족하지만 Teleport와 Strength가 충족되지 않으므로 이 상태로는 사용할 수 없다

enum Card: Comparable {
    case ace
    case king
    case queen
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        switch(lhs, rhs) {
            case (king, ace): return true
            case (queen, king): return true
            case (queen, ace): return true
            default: return false
        }
    }
    
}

func lowest<T: Comparable>(list: [T]) -> T? {
    let sortedList = list.sorted { $0 < $1 }
    
    return sortedList.first
}

print(lowest(list: [4,5,6,1,200,-100,999]))
print(lowest(list: ["b","c","a","z"]))

let ace = Card.ace
let queen = Card.queen

if queen < ace {
    print("queen < ace")
}

print(lowest(list: [Card.ace, Card.queen, Card.king]))
 */

enum NetworkError: Error {
    case badUrl
}

struct Post: Codable {
    let title: String
}

enum Callback<T: Codable, K: Error> {
    case success(T)
    case failure(K)
}

func getPosts(completion: (Callback<[Post], NetworkError>) -> Void) {
    // get all posts
    let posts = [Post(title: "Hello World"), Post(title: "Introduction to Swift")]
    completion(.success(posts))
    completion(.failure(.badUrl))
}

getPosts { (result) in
    switch result {
    case .success(let posts):
        print(posts)
    case .failure(let error):
        print(error)
    }
}
