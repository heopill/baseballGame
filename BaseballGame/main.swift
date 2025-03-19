//
//  main.swift
//  BaseballGame
//
//  Created by 허성필 on 3/19/25.
//

let game = BaseballGame()
game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기


// BaseballGame.swift 파일 생성
class BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
    }
    
    func makeAnswer() -> Int {
        // 함수 내부를 구현하기
        return 0
    }
}
