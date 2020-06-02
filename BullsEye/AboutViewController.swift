//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Godwin Addy on 6/2/20.
//  Copyright © 2020 Godwin Addy. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webkitView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initWebKitView()
    }
    
    func initWebKitView(){
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webkitView.load(request)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
    }
    
    @IBAction func closeAboutView() {
        dismiss(animated: true, completion: nil)
    }
}
