//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 허성필 on 3/20/25.
//

import Foundation

// BaseballGame.swift 파일 생성
class BaseballGame {
    private let checker = BaseballNumberChecker()
    private let number = Number()
    
    func start() {
        let answer = number.makeNumber() // 정답을 만드는 함수
        print(answer)
        print("< 게임을 시작합니다 >")
        
        while true {
            // 1. 유저에게 입력값을 받음
            print("숫자를 입력하세요")
            
            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            // guard 를 사용하여 옵셔널 바인딩 처리
            guard let inputString = readLine(),
                  let inputNumber = Int(inputString) else {
                print("세자리 정수를 입력해주세요")
                continue
            }
            
            print("입력한 숫자 : \(inputNumber)")
            
            // 3. 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            if String(inputNumber).count != 3  { // 숫자가 세자리인지 검사
                print("올바르지 않은 입력값입니다.")
            //            } else if String(inputNumber).contains("0") { // 입력값에 0 포함 검사
            //                print("숫자에 0이 포함되어 있습니다.")
            } else if checker.alreadyHasNumber(inputNumber) { // 중복 숫자 검사 함수
                print("중복된 입력값이 있습니다.")
            } else {
                // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
                // 만약 정답이라면 break 호출하여 반복문 탈출
                if checker.compareNumber(answer, inputNumber) {
                    break
                }
            }
            
        }
    }
    
}
