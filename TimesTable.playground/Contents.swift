//: Playground - noun: a place where people can play


// i를 1씩 증가시키는 for문 활용
func gugu1(number:Int, gugudan: inout [Int]) {
    for i in 0..<9 {
        gugudan[i] = number * (i+1)
    }
}

// 배열의 인덱스와 요소값을 모두 가져오는 enumerated 활용
// --> 요소값을 사용하지 않는 문제점
func gugu2(number:Int, gugudan: inout [Int]) {
    for (index, i) in gugudan.enumerated() {
        gugudan[index] = number * (index+1)
    }
}

// 배열의 인덱스를 가져오는 indices 활용
func gugu3(number:Int, gugudan: inout [Int]) {
    for i in gugudan.indices {
        gugudan[i] = number * (i+1)
    }
}

// 배열 요소값을 0이 아닌 1부터 9로 채워서 시작 (Hngfu github 참고하여 추가함)
func gugu4(number:Int, gugudan: inout [Int]) {
    for i in gugudan {
        gugudan[i-1] = gugudan[i-1] * number
    }
}

// gugudan 배열과 사용한 방법명을 프린트
func printGugu(gugudan:[Int]) {
    for i in gugudan {
        print(i)
    }
}

// 배열계산함수 + 프린트함수 동시실행
func execute() {
    let num = 2
    
    var gugudan = [Int].init(repeating:0, count:9)
    gugu1(number:num, gugudan:&gugudan)
    gugu2(number:num, gugudan:&gugudan)
    gugu3(number:num, gugudan:&gugudan)
    printGugu(gugudan:gugudan)
    
    var gugudan2 = Array(1...9)
    gugu4(number:num, gugudan:&gugudan2)
    printGugu(gugudan:gugudan2)
}

// 실행
execute()

//-------------------------------

// 배열의 인덱스를 가져오는 indices 활용
func gugudan1(number:Int) -> [Int] {
    var gugudan = [Int].init(repeating:0, count:9)
    for i in gugudan.indices {
        gugudan[i] = number * (i+1)
    }
    return gugudan
}

// 배열 요소값을 0이 아닌 1부터 9로 채워서 시작
func gugudan2(number:Int) -> [Int] {
    var gugudan = Array(1...9)
    for i in gugudan {
        gugudan[i-1] = gugudan[i-1] * number
    }
    return gugudan
}

// gugudan 배열 프린트하여 확인
func printGugudan(gugudan:[Int]) {
    for i in gugudan {
        print(i)
    }
}

// 위 방법 두 가지로 각각 구구단결과값 확인해보기
printGugudan(gugudan: gugudan1(number: 9))
printGugudan(gugudan: gugudan2(number: 9))
