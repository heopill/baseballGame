//
//  main.swift
//  BaseballGame
//
//  Created by 허성필 on 3/19/25.
//

// BaseballGame.swift 파일 생성
class BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
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
            if inputNumber > 999 || inputNumber <= 99 { // 숫자가 세자리인지 검사
                print("올바르지 않은 입력값입니다.")
//            } else if String(inputNumber).contains("0") { // 입력값에 0 포함 검사
//                print("숫자에 0이 포함되어 있습니다.")
            } else if alreadyHasNumber(inputNumber) { // 중복 숫자 검사 함수
                print("중복된 입력값이 있습니다.")
            } else {
                // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
                // 만약 정답이라면 break 호출하여 반복문 탈출
                if compareNumber(answer, inputNumber) {
                    break
                }
            }
            
            
        }
    }
    
    // 세자리 랜덤 숫자를 생성하는 함수
    func makeAnswer() -> Int {
        var number = Set<Int>()
        
        repeat {
            number = Set<Int>() // 중복 방지를 위한 Set 사용
            
            while number.count < 3 {
                let randomNum = Int.random(in: 0...9)
                number.insert(randomNum) // 중복이면 추가되지 않음
            }
        } while number.first == 0 // 첫 번째 숫자가 0이면 다시 만들기
        
        let uniqueNumbers = Array(number) // Set을 Array로 변환
        
        // if let을 사용하여 옵셔널 바인딩 처리하여 안전하게 옵셔널 값 사용
        if let randomNumner = Int("\(uniqueNumbers[0])\(uniqueNumbers[1])\(uniqueNumbers[2])") {
            return randomNumner
        } else {
            return 0
        }
        
    }
    
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

let game = BaseballGame()
game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기
