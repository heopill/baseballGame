# 스파르타 코딩 클럽 내일배움캠프 2주차 개인 과제
<br/>

## __Swift로 야구 게임 만들기__

<p align="center">
<img width="1022" alt="Image" src="https://github.com/user-attachments/assets/5ea27691-97f4-4949-9827-e6fdab57adb4" />
</p>

#### 숫자 야구 게임은 두 명이 즐길 수 있는 추리 게임으로, 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다. 각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다. 예를 들어, 상대방의 숫자가 123일 때 132를 추리하면 1스트라이크 2볼이 됩니다. 이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다.
<br/>

## 📋 프로젝트 개요
Swift를 활용하여 로직 구현에 활용해봅시다 🔥
지금까지 배운 Swift 문법을 응용해서 숫자 야구 게임을 만들어 봅니다!<br/>
<br/>

## 🛠️ 사용 기술
- 언어: Swift 5.9
- 개발 환경: Xcode 16+
- Xcode command line tool 을 이용하여 직접 입력값 받기
<br/>

## 📝 요구사항 설명
- 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다. 정답은 랜덤으로 만듭니다 ( Lv 1 )
- 정답을 맞추기 위해 3자리 수를 입력하고, 힌트를 받습니다. ( Lv 2 )
- 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요. 맨 앞자리에 0이 오는 것은 불가능 합니다. ( Lv 3 )
- 프로그램이 시작할 때 안내문구를 보여주세요. ( Lv 4 )
- 2번 게임 기록 보기의 경우 완료한 게임들에 대한 시도 횟수를 보여줍니다. ( Lv 5 )
- 3번 종료하기의 경우 프로그램이 종료됩니다. 이전의 게임 기록들도 초기화 됩니다. ( Lv 6 )
<br/>

## 🧑‍💻 코드 예시
### main.swift 
``` swift
let game = BaseballGame()
game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기
```
<br/>

### BaseballGame.swift 
``` swift
import Foundation

// BaseballGame.swift 파일 생성
class BaseballGame {
    private let checker = BaseballNumberChecker()
    private let number = Number()
    private let recordManager = RecordManager()
    
    func start() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            guard let inputString = readLine(),
                  let inputMenu = Int(inputString) else {
                print("올바른 숫자를 입력해주세요")
                break
            }
            
            switch inputMenu {
            case 1:
                print("\n< 게임을 시작합니다 >")
                let count = startGame()
                // return된 count를 recordManager.add 함수로 전달하여 시도 횟수 저장
                recordManager.add(count)
                continue
            case 2:
                recordManager.showRecords() // 시도 횟수 출력
                continue
            case 3:
                print("\n< 숫자 야구 게임을 종료합니다 >")
            default:
                print("올바를 숫자를 입력해주세요!\n")
                continue
            }
            break
            
        } // while문 끝
        
    } // start() 끝
    
    func startGame() -> Int {
        let answer = number.makeNumber() // 정답을 만드는 함수
        var trialCount = 1
        
        while true {
            // 1. 유저에게 입력값을 받음
            print("숫자를 입력하세요")
            
            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            // guard 를 사용하여 옵셔널 바인딩 처리
            guard let inputString2 = readLine(),
                  let inputNumber = Int(inputString2) else {
                print("세자리 정수를 입력해주세요")
                continue
            }
            
            print("입력한 숫자 : \(inputNumber)")
            
            // 3. 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            if String(inputNumber).count != 3  { // 숫자가 세자리인지 검사
                print("\n올바르지 않은 입력값입니다")
            // } else if String(inputNumber).contains("0") { // 입력값에 0 포함 검사
            //  print("숫자에 0이 포함되어 있습니다.")
            } else if checker.alreadyHasNumber(inputNumber) { // 중복 숫자 검사 함수
                print("\n중복된 입력값이 있습니다")
            } else {
                // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
                // 만약 정답이라면 break 호출하여 반복문 탈출
                if checker.compareNumber(answer, inputNumber) {
                    break
                }
            }
            trialCount += 1
        }
        return trialCount
    }
}

```
<br/>

## 예외 처리
- makeAnswer() : 0부터 9까지의 중복되지 않은 3자리 랜덤 숫자 만들기
- alreadyHasNumber() : 입력받은 숫자의 중복 검사
- 입력받은 숫자가 3자리인지 검사
<br/>


## 과제 요구사항 반영 여부
* [x] Lv1 - 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다. 정답은 랜덤으로 만듭니다
* [x] Lv2 - 정답을 맞추기 위해 3자리 수를 입력하고, 힌트를 받습니다.
* [x] Lv3 - 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요. 맨 앞자리에 0이 오는 것은 불가능 합니다.
* [x] Lv4 - 프로그램이 시작할 때 안내문구를 보여주세요.
* [x] Lv5 - 2번 게임 기록 보기의 경우 완료한 게임들에 대한 시도 횟수를 보여줍니다.
* [x] Lv6 - 3번 종료하기의 경우 프로그램이 종료됩니다. 이전의 게임 기록들도 초기화 됩니다.

