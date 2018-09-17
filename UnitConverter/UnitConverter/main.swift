//
//  main.swift
//  UnitConverter
//
//  Created by 윤지영 on 2018. 9. 11..
//  Copyright © 2018년 윤지영. All rights reserved.
//

// -----------------------------------
// 단위변환기 5단계 - 무게 단위 변환
// -----------------------------------

// 입력값을 값과 단위로 분리하여 문자열 배열로 리턴
func separateInput(valueAndUnit:String) -> [String] {
    let numberSet = ".0123456789"
    var valueAndUnitSeparated = ["",""]
    for char in valueAndUnit {
        if (numberSet.contains(char)) {valueAndUnitSeparated[0].append(char)}
        else {valueAndUnitSeparated[1].append(char)}
    }
    return valueAndUnitSeparated
}

// 변환함수
func convert(value:Double, unit:String, unitToChange:String) -> (value:Double, unitConverted:String, error:Bool) {
    var valueConverted = value, unitConverted = unitToChange, error = false
    let units = ["cm":1,"m":100,"inch":2.54,"yard":91.44,"g":0.001,"kg":1,"oz":0.0283495,"lb":0.453592,"none":1]
    if(units[unitToChange] == nil) {
        error = true
        return (valueConverted, unitConverted, error)
    }
    if(unitToChange=="none"){
        switch unit {
        case "m", "inch":
            valueConverted = value * units[unit]!
            unitConverted = "cm"
        case "cm", "yard":
            valueConverted = (value * units[unit]!)/units["m"]!
            unitConverted = "m"
        default:
            error = true
        }
    } else {
        valueConverted = (value * units[unit]!)/units[unitToChange]!
    }
    return (valueConverted, unitConverted, error)
}

// 변환 실행 함수
func executeConvert(_ input:String) -> String {
    let inputValues = input.split(separator: " ")
    let value = separateInput(valueAndUnit: String(inputValues[0]))[0]
    let unit = separateInput(valueAndUnit: String(inputValues[0]))[1]
    var message = String()
    
    if (inputValues.count==1) {
        let result = convert(value: Double(value)!, unit: unit, unitToChange: "none")
        if (result.error) { message = "지원하지않는 단위입니다." }
        else { message = String(result.value) + result.unitConverted }
    }
    else if (inputValues.count==2) {
        let unitConverted = String(inputValues[1])
        let result = convert(value: Double(value)!, unit: unit, unitToChange: unitConverted)
        if (result.error) { message = "지원하지않는 단위입니다." }
        else { message = String(result.value) + result.unitConverted }
    }
    else { message = "잘못된 형식입니다." }
    return message
}

// q, quit 입력 전까지 executeConvert Loop
func executeTilQuit() {
    while (true) {
        print("단위값과 변환하고싶은 단위를 띄어서 입력하세요.")
        let input = readLine()!
        if (input=="q"||input=="quit") {
            print("단위변환기 종료")
            break
        }
        print(executeConvert(input))
    }
}

// 실행
executeTilQuit()
