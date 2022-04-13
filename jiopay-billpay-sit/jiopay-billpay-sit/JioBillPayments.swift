//
//  WebViewFile.swift
//  Bill-Payments-SDK
//
//  Created by Rishav4 Kumar on 04/04/22.
//

import Foundation
import UIKit
import WebKit

let BILL_PAY_SIT_URL : String = "https://psp-mandate-merchant-sit.jiomoney.com:3003/billpay"
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

@objc public protocol JioPayDelegate {
    func onWebViewClose()
}

public class JioBillPayments: UIViewController, WKNavigationDelegate, WKUIDelegate {
    var webView: WKWebView!
    var rootController: UIViewController?
    var activityView: UIActivityIndicatorView?
    var delegate: JioPayDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        configureWebView()
        closeButtonOnTopRight()
    }
    
    public func initiateBillPayment(viewController: UIViewController, delegate jioPayDelegate: JioPayDelegate) {
        DispatchQueue.main.async {
                 self.rootController = viewController
                 self.modalPresentationStyle = .fullScreen
                 self.delegate = jioPayDelegate
                 self.rootController?.present(self, animated: true, completion: nil)
                 self.loadWebView(envUrl: BILL_PAY_SIT_URL)
              }
   }
    
    
    public func onDismissBillPayment(webView: WKWebView) {
               self.webView = nil
               rootController?.dismiss(animated: true, completion: nil)
   }
    
    
    func configureWebView() {
        let contentController = WKUserContentController()
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = contentController
        
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), configuration: webConfiguration)
        webView.allowsBackForwardNavigationGestures = true
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view.addSubview(webView)
        self.view.layoutSubviews()
    }
 
    
    func loadWebView(envUrl:String) {
        let url = URL(string: envUrl)
        webView.load(URLRequest(url: url!))
        hideActivityIndicator()
     }
    
    
    func showActivityIndicator() {
        if #available(iOS 13.0, *) {
            activityView = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
        }
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    
    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }

    @objc public func onCloseButtonPress(sender: UIButton!) {
           let buttonTag: UIButton = sender
           if buttonTag.tag == 1 {
               onDismissBillPayment(webView : webView)
               dismiss(animated: true, completion: nil)
               self.delegate?.onWebViewClose()
           }
       }
    
    func closeButtonOnTopRight(){
        let closeButton: UIButton = UIButton(frame: CGRect(x: SCREEN_WIDTH-60, y: 20, width: 50, height: 35))
        closeButton.backgroundColor = UIColor.red
        closeButton.setTitle("Close", for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .bold)
        closeButton.addTarget(self, action: #selector(onCloseButtonPress), for: .touchUpInside)
        closeButton.tag = 1
        self.view.addSubview(closeButton)
    }
}
