//
//  ViewController.swift
//  Mario Kart Gestures
//
//  Created by Michael Mcmanus on 3/8/19.
//  Copyright © 2019 Michael Mcmanus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//These are outlets for the ImageViews that are later used to store their default position.
    @IBOutlet weak var kartView0: UIImageView!
    @IBOutlet weak var kartView1: UIImageView!
    @IBOutlet weak var kartView2: UIImageView!
    @IBOutlet weak var kartView3: UIImageView!
    @IBOutlet weak var kartView4: UIImageView!
 
    //These are the variables that store the starting position itself.
    var startingPointKartView0 = CGPoint()
    var startingPointKartView1 = CGPoint()
    var startingPointKartView2 = CGPoint()
    var startingPointKartView3 = CGPoint()
    var startingPointKartView4 = CGPoint()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //The starting point is where the imageviews are placed once the view loads.
        startingPointKartView0 = kartView0.center
        startingPointKartView1 = kartView1.center
        startingPointKartView2 = kartView2.center
        startingPointKartView3 = kartView3.center
        startingPointKartView4 = kartView4.center
     
        
    }

    //Allows you to pan the kart view
    @IBAction func didPanKartView(_ sender: Any) {
     
      //Sets the location as any location that is tapped in the view
        let location = (sender as AnyObject).location(in: view)
        
     //Prints the x,y coords for the location of the tap
        print("Location: x: \(location.x), y: \(location.y)")
     
     //Each gesture recognizer knows the view it's attached to. We can ask the gesture recognizer (sender) for it's view in order to access the specific view that was panned (i.e. which kart image view).
        let kartView = (sender as AnyObject).view!
        kartView.center = location
        
        
        
    }
    
    //Allows you to pinch and scale the kart view
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        
        let scale = sender.scale
        print("scale: \(scale)")
        
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
        
    }
    
    //Allows you to rotate the kart view
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        
        let rotation = sender.rotation
        print("rotation: \(rotation)")
        
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
        
        
        
    }
    
    //Allows you to double tap the kart view and trigger the off-screen race animation.
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        
        let kartView = sender.view!
        print("Double tap recognized")
        
        UIView.animate(withDuration: 0.8) {
            kartView.center.x += 400
        }
        
    }
    
    //Allows you to long press the background view and reset the position of the kart views.
    @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
        
        
        UIView.animate(withDuration: 0.8) {
            self.kartView0.center = self.startingPointKartView0
            self.kartView1.center = self.startingPointKartView1
            self.kartView2.center = self.startingPointKartView2
            self.kartView3.center = self.startingPointKartView3
            self.kartView4.center = self.startingPointKartView4
        }
        
        self.kartView0.transform = CGAffineTransform.identity
        self.kartView1.transform = CGAffineTransform.identity
        self.kartView2.transform = CGAffineTransform.identity
        self.kartView3.transform = CGAffineTransform.identity
        self.kartView4.transform = CGAffineTransform.identity
        
    }
    
    
    
}

