//: Playground - noun: a place where people can play

var gugudan = [Int].init(repeating:0, count:9)

func gugu(number : Int) {
    for i in 0..<9 {
        gugudan[i] = number * (i+1)
    }
    for i in gugudan {
        print(i)
    }
}

gugu(number:9)
