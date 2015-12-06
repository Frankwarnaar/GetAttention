//
//  SettingsViewController.swift
//  GetFocus
//
//  Created by Frank Warnaar on 12-11-15.
//  Copyright © 2015 Frank Warnaar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
    @IBOutlet weak var switchColor1: UISegmentedControl!
    @IBOutlet weak var switchColor2: UISegmentedControl!
    @IBOutlet weak var switchColor3: UISegmentedControl!
    @IBOutlet weak var switchColor4: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    
    var color1: Colors = .ColorA
    var color2: Colors = .ColorA
    var color3: Colors = .ColorA
    var color4: Colors = .ColorA
    var speed: Double?
    
    var color1FromView: Colors?
    var color2FromView: Colors?
    var color3FromView: Colors?
    var color4FromView: Colors?
    var speedFromView: Double?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 1, green: 0.1, blue: 0.3, alpha: 1.0)
        
        if color1FromView != nil{
            color1 = color1FromView!
            if color1FromView == .ColorA{
                switchColor1.selectedSegmentIndex = 0
            } else {
                switchColor1.selectedSegmentIndex = 1
            }
        } else {
            color1 = .ColorA
        }
        
        if color2FromView != nil{
            color2 = color2FromView!
            if color2FromView == .ColorA{
                switchColor2.selectedSegmentIndex = 0
            } else {
                switchColor2.selectedSegmentIndex = 1
            }
        } else {
            color2 = .ColorA
        }
        if color3FromView != nil{
            color3 = color3FromView!
            if color3FromView == .ColorA{
                switchColor3.selectedSegmentIndex = 0
            } else {
                switchColor3.selectedSegmentIndex = 1
            }
        } else {
            color3 = .ColorA
        }
        
        if color4FromView != nil{
            color4 = color4FromView!
            if color4FromView == .ColorA{
                switchColor4.selectedSegmentIndex = 0
            } else {
                switchColor4.selectedSegmentIndex = 1
            }
        } else {
            color4 = .ColorA
        }
        
        if speedFromView != nil{
            speed = speedFromView
            slider.value = Float(1) / Float(speed!)
        } else {
            speed = 0.14
        }
    }
    
    @IBAction func color1Changed(sender: AnyObject) {
        if color1 == .ColorA{
            color1 = .ColorB
        } else {
            color1 = .ColorA
        }
    }
    
    @IBAction func color2Changed(sender: AnyObject) {
        if color2 == .ColorA{
            color2 = .ColorB
        } else {
            color2 = .ColorA
        }
    }
    
    @IBAction func color3Changed(sender: AnyObject) {
        if color3 == .ColorA{
            color3 = .ColorB
        } else {
            color3 = .ColorA
        }
    }
    @IBAction func color4Changed(sender: AnyObject) {
        if color4 == .ColorA{
            color4 = .ColorB
        } else {
            color4 = .ColorA
        }
    }
    
    @IBAction func backPressed(sender: AnyObject) {
        performSegueWithIdentifier("SettingsSend", sender: nil)
    }
    
    
    
    @IBAction func sliderValueChangedInside(sender: UISlider) {
        let selectedValue = Float(sender.value)
        speed = Double(1) / Double(selectedValue)
        
    }
    @IBAction func SliderValueChangedOutside(sender: UISlider) {
        let selectedValue = Float(sender.value)
        speed = Double(1) / Double(selectedValue)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? ViewController{
            destination.resultColor1 = color1
            destination.resultColor2 = color2
            destination.resultColor3 = color3
            destination.resultColor4 = color4
            destination.resultSpeed = speed
        }
    }

}
