import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MicrowaveOven {
    
    var selectedWatt: Int? = nil
    var timerSeconds: Int? = nil
    
    var timer: Timer?
    var limit: Int = 0
    
    let watt_300 = 300
    let watt_500 = 500
    let watt_800 = 800
    
    func setWatt(watt: Int) {
        selectedWatt = watt
    }
    
    func setTime(time: Int) {
        timerSeconds = time
    }
    
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
    }
    
    @objc func countup() {
        timerSeconds! -= 1
        print("残り\(timerSeconds!)秒です")
        
        if limit >= timerSeconds! {
            print("\(selectedWatt!)Wで\(timerSeconds!)秒温めました。")
            timer?.invalidate()
        }
    }
}

let oven = MicrowaveOven()
oven.setWatt(watt: oven.watt_800)
oven.setTime(time: 5)
oven.start()


