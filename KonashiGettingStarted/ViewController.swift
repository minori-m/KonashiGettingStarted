//
//  ViewController.swift
//  KonashiGettingStarted
//
//  Created by Minori Manabe on 2018/03/20.
//  Copyright © 2018年 Minori Manabe. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Konashi.shared().readyHandler = {() -> Void in
            Konashi.pinMode(KonashiDigitalIOPin.LED2, mode: KonashiPinMode.output)
            Konashi.digitalWrite(KonashiDigitalIOPin.LED2, value: KonashiLevel.high)
            Konashi.pinMode(KonashiDigitalIOPin.S1,mode:KonashiPinMode.input)
            Konashi.shared().digitalInputDidChangeValueHandler = {_,_  in
                print("sw=",  Konashi.digitalRead(KonashiDigitalIOPin.S1))
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func find(sender: UIButton) {
        Konashi.find()
    }
}
