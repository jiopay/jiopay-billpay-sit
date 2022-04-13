import UIKit
import jiopay_billpay_sit
import WebKit


class ViewController: UIViewController, JioPayDelegate {

    @objc func onWebViewClose(){
        print("CLOSED WEB VIEW!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let instockVC = self
        
        let sdkInit = JioBillPayments()
        sdkInit.initiateBillPayment(viewController: instockVC, delegate: self)
    }

}

