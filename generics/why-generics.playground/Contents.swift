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
*/

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
