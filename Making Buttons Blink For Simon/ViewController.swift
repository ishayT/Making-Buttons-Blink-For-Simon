//
//  ViewController.swift
//  Making Buttons Blink For Simon
//
//  Created by Ishay on 3/16/18.
//  Copyright © 2018 Ishay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameTimer: Timer!
    var indexForComputer : Int = 0
    
    var arrayOfnumbers : [Int] = [1,2,3]
    var arrayOfButtons : [UIButton] = []
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var shadowGiver: UIButton!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfButtons = [button1, button2, button3, button4]
    }
    
    
    // Methods for computer turn
    @IBAction func btnForRunningComputerGame(_ sender: UIButton) {
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(usingButtonsArray), userInfo: nil, repeats: true)
    }
    
    
    @objc func usingButtonsArray() {
        
        makeComputerButtonFlash(buttons: arrayOfButtons)
    }
        
    func makeComputerButtonFlash(buttons: [UIButton]) {
        
        if indexForComputer == arrayOfnumbers.count - 1{
            
            buttons[arrayOfnumbers[indexForComputer] - 1].flash()
            gameTimer.invalidate()
            indexForComputer = 0
        }
        
        if indexForComputer < arrayOfnumbers.count - 1 {
            
            buttons[arrayOfnumbers[indexForComputer] - 1].flash()
            indexForComputer += 1
            print(buttons[arrayOfnumbers[indexForComputer] - 1])
        }
        
    }

    
    
    // Methods for user turn
    @IBAction func playButtons(_ sender: UIButton) {
        for i in 1...4 {
            if i == sender.tag {
                
                makeUserBtnFlash(btn: sender)
            }
        }
    }
    
    func makeUserBtnFlash(btn: UIButton){
        btn.flash()
    }
}



extension UIButton {
    
    func flash(){
        let flash = CABasicAnimation(keyPath: "shadowOpacity")
        flash.duration = 0.7
        flash.fromValue = 1
        flash.toValue = 0
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = false
        flash.repeatCount = 1
        
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        layer.add(flash, forKey: nil)
    }
}




//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//
// giving shadow for the buttons

//var currentButton = UIButton()
//        for index in 0...arrayOfnumbers.count - 1{
//
//            currentButton = (arrayOfButtons[arrayOfnumbers[index] - 1])
//
////            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(@objc makeButtonFlash(putButtonHere: currentButton)), userInfo: nil, repeats: true)
//
//            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
//                DispatchQueue.main.async {
//                    makeButtonFlash(btn: <#T##UIButton#>)
//                }
//            }
//        }
//        var index = 0
//        while index < arrayOfnumbers.count {
//            makeButtonFlash(btn: arrayOfButtons[arrayOfnumbers[index] - 1])
//
//            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
//                DispatchQueue.main.async {
//                    self.makeButtonFlash(btn: self.arrayOfButtons[self.arrayOfnumbers[index] - 1])
//                }
//                index += 1
//            }
//        }


//            UIView.animate(withDuration: 1.0, delay: 1.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//
//
//
//            }, completion: true)
//        var index = 0

//        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(callingButtons(index:)), userInfo: nil, repeats: true)
//        callingButtons(index: 0)



//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//
//calling buttons

//        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
//            while index < self.arrayOfnumbers.count - 1{
//                DispatchQueue.main.async {
//                    UIView.animate(withDuration: 1.0, delay: 1.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//                        self.makeButtonFlash(btn: self.arrayOfButtons[self.arrayOfnumbers[index] - 1])
//
//                    }, completion: { (true) in
//                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
//                            if index < self.arrayOfnumbers.count - 1 {
//                                self.callingButtons(index: index + 1)
//
//                            }
//                        })
//                    })
//                }
//            }
//        }
