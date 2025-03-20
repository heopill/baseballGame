//
//  BaseballNumberChecker.swift
//  BaseballGame
//
//  Created by 허성필 on 3/20/25.
//

import Foundation

class BaseballNumberChecker {
    // 중복된 값을 확인하는 함수
    func alreadyHasNumber(_ number: Int) -> Bool {
        let digits = String(number)
        var already = Set<Character>()
        
        for digit in digits {
            if already.contains(digit) { // 중복일 때
                return true
            }
            already.insert(digit) // 중복이 아닐 때 Set에 저장
        }
        return false
    }
    
    // 정답과 사용자가 입력한 값을 비교하는 함수
    func compareNumber(_ answer: Int, _ inputNumber: Int) -> Bool {
        // [x, y, z] 형태로 변경
        let answerNumber = Array(String(answer)).map { Int(String($0))! }
        let userNumber = Array(String(inputNumber)).map { Int(String($0))! }
        
        // 스트라이크와 볼 판별
        let strikeCount = (0..<3).filter { answerNumber[$0] == userNumber[$0] }.count
        let ballCount = (0..<3).filter { answerNumber.contains(userNumber[$0]) && answerNumber[$0] != userNumber[$0] }.count

        if strikeCount == 3 {
            print("3스트라이크!! 정답입니다!!!")
            return true
        } else if strikeCount == 2 {
            print("2스트라이크")
        } else if strikeCount == 1 {
            if ballCount == 2 {
                print("1스트라이크 2볼")
            } else if ballCount == 1 {
                print("1스트라이크 1볼")
            } else {
                print("1스트라이크")
            }
        } else {
            if ballCount == 3 {
                print("3볼")
            } else if ballCount == 2 {
                print("2볼")
            } else if ballCount == 1 {
                print("1볼")
            } else {
                print("Nothing")
            }
        }
        return false
    }
}
