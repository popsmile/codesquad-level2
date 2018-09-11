//
//  main.swift
//  UnitConverter
//
//  Created by 윤지영 on 2018. 9. 11..
//  Copyright © 2018년 윤지영. All rights reserved.
//


// 단위 인식하기
func isCM(value:String) -> Bool {
    if(value.contains("c")) {
        return true
    } else {
        return false
    }
}

// 단위 분리하여 double로 형변환
func removeUnit(value:String) -> Double {
    if (isCM(value: value)) {
        return Double(value.dropLast(2))!
    } else {
        return Double(value.dropLast())!
    }
}

// cm --> m
func convertCMtoM(cm:Double) -> Double {
    return cm/100
}

// m --> cm
func convertMtoCM(m:Double) -> Int {
    return Int(m*100)
}

// 단위 붙여주기
func addUnit(value:String) -> String {
    if (value.contains(".")) {
        return "\(value)m"
    } else {
        return "\(value)cm"
    }
}

// 실행 부분
func execute(input:String) {
    var str = ""
    if(isCM(value:input)) {
        str = String(convertCMtoM(cm: removeUnit(value: input)))
    } else {
        str = String(convertMtoCM(m: removeUnit(value: input)))
    }
    print(addUnit(value: str))
}

execute(input: "180cm")
execute(input: "1.2m")
