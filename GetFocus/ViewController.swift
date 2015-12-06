//
//  ViewController.swift
//  GetFocus
//
//  Created by Frank Warnaar on 10-11-15.
//  Copyright © 2015 Frank Warnaar. All rights reserved.
//

import UIKit

enum Colors {
    case ColorA
    case ColorB
}

class ViewController: UIViewController {
    @IBOutlet weak var Button: UIButton!
    
    var timer: NSTimer?
    var teller = 4
    
    var color1: Colors = .ColorA
    var color2: Colors = .ColorA
    var color3: Colors = .ColorA
    var color4: Colors = .ColorA
    
    var resultColor1: Colors?
    var resultColor2: Colors?
    var resultColor3: Colors?
    var resultColor4: Colors?
    var resultSpeed: Double?

    
    var speed = 1 / 6.66
    
    @IBOutlet weak var Slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 1, green: 0.1, blue: 0.3, alpha: 1.0)
        Button.layer.cornerRadius = 20
        Button.layer.borderWidth = 1.5
        Button.layer.borderColor = UIColor.whiteColor().CGColor
        if resultColor1 != nil{
            color1 = resultColor1!
        } else {
            color1 = .ColorA
        }
        
        if resultColor2 != nil{
            color2 = resultColor2!
        } else {
            color2 = .ColorA
        }
        
        if resultColor3 != nil{
            color3 = resultColor3!
        } else {
            color3 = .ColorA
        }
        
        if resultColor4 != nil{
            color4 = resultColor4!
        } else {
            color4 = .ColorA
        }
        if resultSpeed != nil{
            speed = resultSpeed!
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func count(){
        teller--
        if teller==3{
            if color1 == .ColorA{
                self.view.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0.6, alpha: 1.0)
            } else {
                self.view.backgroundColor = UIColor(red: 1, green: 0, blue: 0.8, alpha: 1.0)
            }
        } else if teller==2{
            if color2 == .ColorA{
                self.view.backgroundColor = UIColor(red: 1, green: 0.1, blue: 0.3, alpha: 1.0)
            } else {
                self.view.backgroundColor = UIColor(red: 1, green: 0.0, blue: 0.5, alpha: 1.0)
            }
        } else if teller==1{
            if color3 == .ColorA{
                self.view.backgroundColor = UIColor(red: 0.1, green: 0.5, blue: 1, alpha: 1.0)
            } else {
                self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 0.6, alpha: 1.0)
            }
        } else {
            if color4 == .ColorA{
                self.view.backgroundColor = UIColor(red: 1, green: 0.8, blue: 0.3, alpha: 1.0)
            } else {
                self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 13, alpha: 1.0)
            }
            teller = 4
        }
    }
    
    func start(){
        timer?.invalidate()
        timer =  NSTimer.scheduledTimerWithTimeInterval(speed, target: self, selector: "count", userInfo: nil, repeats: true)
    }
    
    
    @IBAction func start(sender: AnyObject) {
        if timer == nil{
            start()
            Button.setTitle("Stop", forState: .Normal)
        } else {
            timer?.invalidate()
            timer = nil
            Button.setTitle("Start", forState: .Normal)
            self.view.backgroundColor = UIColor(red: 1, green: 0.1, blue: 0.3, alpha: 1.0)
        }
    }
    
    
    @IBAction func SliderValueChangedInside(sender: UISlider) {
        let selectedValue = Float(sender.value)
        speed = Double(1) / Double(selectedValue)
        if timer != nil{
            start()
        }
    }
    
    @IBAction func ValueSliderChangedOutside(sender: UISlider) {
        let selectedValue = Float(sender.value)
        speed = Double(1) / Double(selectedValue)
        if timer != nil{
            start()
        }
    }
    
    @IBAction func InstellingenPressed(sender: AnyObject) {
        timer?.invalidate()
        performSegueWithIdentifier("toSettings", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? SettingsViewController{
            destination.color1FromView = color1
            destination.color2FromView = color2
            destination.color3FromView = color3
            destination.color4FromView = color4
            destination.speedFromView = speed
        }
    }
    
}

