//
//  MakeAnswer.swift
//  BaseballGame
//
//  Created by 허성필 on 3/20/25.
//

import Foundation

class Number {
    // 세자리 랜덤 숫자를 생성하는 함수
    func makeNumber() -> Int {
        var number = Set<Int>()
        
        repeat {
            number = Set<Int>() // 중복 방지를 위한 Set 사용
            
            while number.count < 3 {
                let randomNum = Int.random(in: 0...9)
                number.insert(randomNum) // 중복이면 추가되지 않음
            }
        } while number.first == 0 // 첫 번째 숫자가 0이면 다시 만들기
        
        let uniqueNumbers = Array(number) // Set을 Array로 변환
        
        // ?? 연산자를 사용하여 안전하게 옵셔널 값 사용
        return Int("\(uniqueNumbers[0])\(uniqueNumbers[1])\(uniqueNumbers[2])") ?? 0
        
    }
}

