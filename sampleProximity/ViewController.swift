//  sampleProximity
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    // 何回センサーが反応したか
    var cnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 近接センサーをONにする
        UIDevice.current.isProximityMonitoringEnabled = true
        
        // 近接センサーが反応した時にどうするかの監視設定
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(proximitySensorStateDidChange),
            name: UIDevice.proximityStateDidChangeNotification,
            object: nil)
    }
    
    // センサーが反応した時に行いたい処理
    @objc func proximitySensorStateDidChange() {
        // .proximityStateはtrue/falseの値を返す
        // 近接距離は測れません
        // センサーがオンだったら
        if UIDevice.current.proximityState {
            cnt = cnt + 1
            label.text = "\(cnt)"
        }
    }

}
