import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


class ElectricKettle {
    
    var timer: Timer?
    let limitTemperature: Int = 100
    var waterTemperature: Int = 0
    
    let limit: Int = 1000 // ml
    var water: Int = 0
    
    enum WaterStatus {
        case empty, withinLimit, moreThanLimit
    }
    
    var kettleRemove = false {
        didSet {
            water = 0
            print("取り外されました。")
            timer?.invalidate()
        }
    }
    
    func start() {
        let status = getWaterStatus(water: water)
        switch status {
        case .empty:
            print("水が入っていません。")
        case .withinLimit:
            timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
            print("\(water)ml入れました。")
        case .moreThanLimit:
            print("規定量を超えました。")
        }
    }
    
    @objc func countup() {
        waterTemperature += 5
        print("\(waterTemperature)度です")
        if limitTemperature <=  waterTemperature {
            print("沸騰しました。")
            timer?.invalidate()
        }
    }
    
    func getWaterStatus(water: Int) -> WaterStatus {
        if water <= 0 {
            return .empty
        } else if water <= limit {
            return .withinLimit
        } else {
            return .moreThanLimit
        }
    }
}

let kettle = ElectricKettle()
kettle.water = 800
kettle.start()

DispatchQueue.main.asyncAfter(deadline: .now() + 14) {
    kettle.kettleRemove
}


