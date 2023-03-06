import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


class ElectricKettle {
    
    var timer: Timer?
    let limitTemperature: Int = 100
    var waterTemperature: Int = 0
    
    let limit: Int = 1000 // ml
    var water: Int? = nil
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
    }
    
    @objc func countup() {
        waterTemperature += 5
        print("\(waterTemperature)度です")
        
        if limitTemperature <=  waterTemperature {
            print("沸騰しました。")
            timer?.invalidate()
        }
    }
    func waterLimit(water: Int) {
        water <= limit
        print("\(water)ml入れました。")
    }
    
}

let kettle = ElectricKettle()

kettle.start()
kettle.waterLimit(water: 1000)

