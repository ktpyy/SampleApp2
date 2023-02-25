import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MicrowaveOven {
    
    var selectedWatt: Int? = nil
    
    let watt_300 = 300
    let watt_500 = 500
    let watt_800 = 800
    
    var timerSeconds: Int? = nil
    
    var timer: Timer?
    var count: Int = 30
    var limit: Int = 0
    
    func setWatt(watt: Int) {}
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }
    
    @objc func setTime(time: Int) {
        count -= 1
        print("残り\(count)秒です")
        
        if limit >= count {
            print("で秒温めました。")
            timer?.invalidate()
        }
    }
}

let oven = MicrowaveOven()
oven.setWatt(watt: )
oven.setTime(time: )
oven.start()
