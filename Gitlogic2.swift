import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


class ElectricKettle {
    
    var timer: Timer?
    var temperature: Int = 100
    var count: Int = 0
    
    let limit: Int = 1000 // ml
    var water: Int? = nil
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
    }
    
    @objc func countup() {
        count += 5
        print("\(count)度です")
        
        if temperature <=  count{
            print("沸騰しました。")
            timer?.invalidate()
        }
    }
    func waterLimit(water: Int) {
          water <= limit
            print("\(water)ml入れました。")
    }
    
    
    func Temperature() {
        
    }
}

    let kettle = ElectricKettle()

kettle.start()
kettle.waterLimit(water: 1000)
