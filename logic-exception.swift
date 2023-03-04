import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MicrowaveOven {
    
    var selectedWatt: Int? = nil
    var timerSeconds: Int? = nil
    var count: Int? = nil
    
    var timer: Timer?
    var limit: Int = 0
    
    enum Watt: Int {
        case watt_300 = 300
        case watt_500 = 500
        case watt_800 = 800
    }
    
    func setWatt(watt: Watt) {
        selectedWatt = watt.rawValue
    }
    
    func setTime(time: Int) {
        timerSeconds = time
        count = time
    }
    
    
    var isOpen = false {
        didSet {
            selectedWatt = nil
            count = nil
            timerSeconds = nil
            timer?.invalidate()
            print("強制終了しました。")
        }
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countup), userInfo: nil, repeats: true)
    }
    
    @objc func countup() {
        timerSeconds! -= 1
        print("残り\(timerSeconds!)秒です")
        
        if limit >= timerSeconds! {
            print("\(selectedWatt!)Wで\(count!)秒温めました。")
            timer?.invalidate()
        }
    }
}

let oven = MicrowaveOven()
oven.setWatt(watt: .watt_800)
oven.setTime(time: 30)
oven.start()
oven.isOpen

