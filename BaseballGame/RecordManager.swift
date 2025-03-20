//
//  RecordManager.swift
//  BaseballGame
//
//  Created by 허성필 on 3/20/25.
//

import Foundation

class RecordManager {
    var trialCount: [Int] = []
    
    func add (_ count:Int){
        trialCount.append(count)
    }
    
    func showRecords() {
        print("\n< 게임 기록 보기 >")
        for i in 0...trialCount.count-1 {
            print("\(i+1)번째 게임 : 시도 횟수 - \(trialCount[i])")
        }
        print("")
    }
}
