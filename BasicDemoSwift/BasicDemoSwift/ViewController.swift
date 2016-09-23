//
//  ViewController.swift
//  BasicDemoSwift
//
//  Created by Reynes Martial on 01/02/2016.
//  Copyright © 2016 adactive. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, ADSumMapViewControllerDelegate {
    
    var adSumMapViewController: ADSumMapViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.adSumMapViewController = ADSumMapViewController(frame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        
        self.adSumMapViewController.delegate = self
        self.adSumMapViewController.view.backgroundColor = UIColor.whiteColor()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.adSumMapViewController.view)

        self.adSumMapViewController.update()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dataDidFinishUpdating(adSumViewController: AnyObject!) {
        self.adSumMapViewController.start()
    }
    
    func dataDidFinishUpdating(adSumViewController: AnyObject!, withError error: NSError!) {
        if(self.adSumMapViewController .isMapDataAvailable()) {
            self.adSumMapViewController.start()
        } else {
            let alert = UIAlertController(title: "Update finished with errors", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            let yesButton = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(yesButton)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func mapDidFinishLoading(adSumViewController: AnyObject!) {

        self.adSumMapViewController.setCameraMode(ObjectiveBridge().Get_CameraMode_FULL());

    }

    
    func OnPOIClicked(poiIds: [AnyObject]!, placeId: Int, adSumViewController: AnyObject!)
    {
        self.adSumMapViewController.unLightAll()
        self.adSumMapViewController.centerOnPlace(placeId)
        self.adSumMapViewController.highLightPlace(placeId, color: UIColor.greenColor())
    }


}
