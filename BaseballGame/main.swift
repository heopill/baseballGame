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
    }
    
    func makeAnswer() -> Int {
        var number = Set<Int>() // 중복 방지를 위한 Set 사용

        while number.count < 3 {
            let randomNum = Int.random(in: 1...9)
            number.insert(randomNum) // 중복이면 추가되지 않음
        }

        let uniqueNumbers = Array(number) // Set을 Array로 변환
        
        // if let을 사용하여 옵셔널 바인딩 처리하여 안전하게 옵셔널 값 사용
        if let randomNumner = Int("\(uniqueNumbers[0])\(uniqueNumbers[1])\(uniqueNumbers[2])") {
            return randomNumner
        } else {
            return 0
        }
        
    }

}

let game = BaseballGame()
game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기
