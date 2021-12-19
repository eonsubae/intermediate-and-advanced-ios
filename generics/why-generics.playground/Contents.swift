import UIKit

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
