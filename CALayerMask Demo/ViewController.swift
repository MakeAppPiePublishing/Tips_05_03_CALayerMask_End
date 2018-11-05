//
//  ViewController.swift
//  CALayerMask Demo
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit

class ViewController: UIViewController {
    let upImage = UIImage(named:"thumb_up_48pt")
    let downImage = UIImage(named: "thumb_down_48pt")
    let inverseUpImage = UIImage(named: "invert_thumb_up_48pt")
    let inverseDownImage = UIImage(named: "invert_thumb_down_48pt")

   
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    @IBAction func upButton(_ sender: UIButton) {
       sender.layer.mask?.contents = inverseUpImage?.cgImage
        downButton.layer.mask?.contents = downImage?.cgImage
    }
    
    @IBAction func downButton(_ sender: UIButton) {
        configureMask(button: upButton, with: upImage)
        configureMask(button: downButton, with: inverseDownImage)
    }
    
    func configureMask(button:UIButton, with image:UIImage!){
        let masklayer = CALayer()
        masklayer.frame.origin = CGPoint(x: 0, y: 0 )
        masklayer.frame.size = button.frame.size
        masklayer.contents = image.cgImage
        button.layer.mask = masklayer
    }
    
    override func viewDidLayoutSubviews() {
        configureMask(button: upButton, with: upImage)
        configureMask(button: downButton, with: downImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}

