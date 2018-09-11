//: Playground - noun: a place where people can play

var gugudan = [Int].init(repeating:0, count:9)
var method = "적용전"

// i를 1씩 증가시키는 for문 활용
func gugu1(number : Int) {
    for i in 0..<9 {
        gugudan[i] = number * (i+1)
    }
    method = "방법1"
}

// 배열의 인덱스와 요소값을 모두 가져오는 enumerated 활용
// --> 요소값을 사용하지 않는 문제점
func gugu2(number : Int) {
    for (index, i) in gugudan.enumerated() {
        gugudan[index] = number * (index+1)
    }
    method = "방법2"
}

// 배열의 인덱스를 가져오는 indices 활용
func gugu3(number : Int) {
    for i in gugudan.indices {
        gugudan[i] = number * (i+1)
    }
    method = "방법3"
}

// gugudan 배열과 사용한 방법명을 프린트
func printGugu() {
    print(method)
    for i in gugudan {
        print(i)
    }
}

// 배열계산함수 + 프린트함수 동시실행
func execute() {
    var num = 2
//    gugu1(number:num)
//    gugu2(number:num)
    gugu3(number:num)
    printGugu()
}

// 실행
execute()
