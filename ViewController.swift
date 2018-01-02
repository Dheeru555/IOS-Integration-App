//
//  ViewController.swift
//  IntegrationApp
//
//  Created by Devineni, Sai Dheeraj on 6/15/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var Accval: UILabel!
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var q: UITextField!
    @IBOutlet weak var p: UITextField!
    @IBOutlet weak var Valq: UILabel!
    @IBOutlet weak var Valp: UILabel!
    @IBOutlet weak var SignificantDigits: UISegmentedControl!
    @IBOutlet weak var IntegralHeader: UILabel!
    @IBOutlet weak var AccuSlider: UISlider!
    @IBOutlet weak var Accuracy: UILabel!
    @IBOutlet weak var Vald: UILabel!
    @IBOutlet weak var Valc: UILabel!
    @IBOutlet weak var Valb: UILabel!
    @IBOutlet weak var Vala: UILabel!
    @IBOutlet weak var d: UITextField!
    @IBOutlet weak var c: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var Welcum: UILabel!
    
    var curvalue : Int = 0
    
    @IBAction func SliderValue(_ sender: UISlider) {
        curvalue = Int(sender.value)
        
        Accval.text = "\(curvalue)"
    }
    
    @IBAction func Integrate(_ sender: UIButton) {
        
        
        
        if let chk = Float(a.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)) as? Float, let chk1 = Float(b.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)) as? Float, let chk2 = Float(c.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)) as? Float, let chk3 = Float(d.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)) as? Float, let chk4 = Float(p.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)) as? Float, let chk5 = Float(q.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)) as? Float
        {
            func pow (_ base:Float,_ power:UInt) -> Float
            {
                var res : Float = 1
                for _ in 0..<power { res *= base }
                return res
            }
            
            a.text! = a.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            b.text! = b.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            c.text! = c.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            d.text! = d.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            p.text! = p.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            q.text! = q.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            
            
            
            
            var x = Float(p.text!)!
            var startValue = Int(p.text!)!
            var endValue = Int(q.text!)!
            
            let accuracy = Float(Accval.text!)!
            
            var deltax : Float = 0.0
            
            deltax = (Float(q.text!)!-Float(p.text!)!)/Float(accuracy)
            
            print(deltax)
            var val : Float = 0
            
            while x <= Float(q.text!)!
            
            {
                
                if x == Float(p.text!)! || x == Float(q.text!)!
                {
                    val += (Float(a.text!)!*pow(x,3))+(Float(b.text!)!*pow(x,2))+(Float(c.text!)!*x)+Float(d.text!)!
                    print(val)
                }
                else
                {
                    val += 2*((Float(a.text!)!*pow(x,3))+(Float(b.text!)!*pow(x,2))+(Float(c.text!)!*x)+Float(d.text!)!)
                    print(val)
                }
                
                x=x+Float(deltax)
            }
            
            print(val)
            val =  val * (Float(deltax)/Float(2))
            
            //var val = Int(p.text!)! + Int(q.text!)!
            
            if SignificantDigits.selectedSegmentIndex == 0
            {
                Result.text = "The value of Integral is  " + String(format: "%.2f",val)
                Result.isHidden = false
            }
            if SignificantDigits.selectedSegmentIndex == 1
            {
                Result.text = "The value of Integral is  " + String(format: "%.3f",val)
                Result.isHidden = false
            }
            if SignificantDigits.selectedSegmentIndex == 2
            {
                Result.text = "The value of Integral is  " + String(format: "%.4f",val)
                Result.isHidden = false
            }
            
           
            
            //et chk : Float
        }
        else
        {
            var value = 1
            var str : String = ""
            var nt : String = ""
            switch value {
            case 1:
                if let shw1 = Float(a.text!) as? Float
                {
                   nt = ""
                }
                else
                {
                    str+=" a"
                }
                fallthrough
            case 2:
                if let shw2 = Float(b.text!) as? Float
                {
                    nt = ""
                }
                else
                {
                    str+=" b"
                }
                fallthrough
            case 3:
                if let shw3 = Float(c.text!) as? Float
                {
                    nt = ""
                }
                else
                {
                    str+=" c"
                }
                fallthrough
            case 4:
                if let shw4 = Float(d.text!) as? Float
                {
                    nt = ""
                }
                else
                {
                    str+=" d"
                }
                fallthrough
            case 5:
                if let shw5 = Float(p.text!) as? Float
                {
                    nt = ""
                }
                else
                {
                    str+=" p"
                }
                fallthrough
            case 6:
                if let shw6 = Float(q.text!) as? Float
                {
                    nt = ""
                }
                else
                {
                    str+=" q"
                }
                fallthrough
            default:
                print("Nothing")
            }
            
            
            
            
            let alert = UIAlertController(title: "Bad value entered ", message: "Please check if given values of \(str) is float or it is blank value in all text labels", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.q
        {
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.q.delegate = self
        Result.isHidden = true
        a.becomeFirstResponder()
        
        var ll = Int(AccuSlider.value)
        Accval.text = String(format: "%d",ll)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

