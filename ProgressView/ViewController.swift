//
//  ViewController.swift
//  ProgressView
//
//  Created by Fidel Gonzalez on 3/28/16.
//  Copyright © 2016 Fidel Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    var counter : Int = 0 {
            didSet {
                let fractionalProgress = Float(counter) / 100.0
                let animated = counter != 0
                
                progressView.setProgress(fractionalProgress, animated: animated)
                progressLabel.text = ("\(counter)%")
            }
        }
    
    
    @IBAction func startCount(sender: UIButton) {
        progressLabel.text = "0%"
        self.counter = 0
        for i in 0..<100 {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                sleep(1)
                dispatch_async(dispatch_get_main_queue(), {
                    self.counter++
                    return
                    })
                })
        }
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.setProgress(0, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

