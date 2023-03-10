import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


class ElectricKettle {
    
    var timer: Timer?
    let limitTemperature: Int = 100
    var waterTemperature: Int = 0
    
    let limit: Int = 1000 // ml
    var water: Int? = nil
    
    enum WaterStatus {
        case empty, withinLimit, moreThanLimit
    }
    
    var kettleRemove = false {
        didSet {
            water = nil
            print("取り外されました。")
            timer?.invalidate()
        }
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
        let status = getWaterStatus(water: )
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
        } else { water > limit
            return .moreThanLimit
        }
    }
}

let kettle = ElectricKettle()
kettle.start()
kettle.getWaterStatus(water: )
kettle.kettleRemove

