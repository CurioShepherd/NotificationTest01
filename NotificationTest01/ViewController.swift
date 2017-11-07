//
//  ViewController.swift
//  NotificationTest01
//
//  Created by Koulutus on 07/11/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func ButtonAAAlsTriggered(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: Notification.Name("TESTMESSAGEDISPATCH"), object: "AAA was pressed")
    }
    
    @IBAction func ButtonBBBisTriggered(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("MyDummyFunctionCall"),
            object: "Payload")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // let myqueue = NotificationQueue.default
        
        NotificationCenter.default.addObserver(forName: Notification.Name("TESTMESSAGEDISPATCH"),
            object: nil,
            queue: nil,
            using: {(notifivation) in NSLog("Check");
            NSLog(notifivation.object as! String)})
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(MyDummyFunction(notification:)),
            name: Notification.Name("MyDummyFunctionCall"),
            object: nil)
        
        var testnotification : Notification = Notification(name: Notification.Name("Pertsa"))
        testnotification.object = "Pertsa"
        MyDummyFunction(notification: testnotification)
        
        // 5 seconds delay
        let futuretime = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: futuretime, execute: {NSLog("Delayed time triggered")})
        
    }
    
    @objc func MyDummyFunction(notification: Notification) {
        NSLog("MyDummyFunction was called!")
        NSLog(notification.object as! String)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

