//
//  ViewController.swift
//  ExampleProject
//
//  Created by Deyan Aleksandrov on 5/19/17.
//  Copyright © 2017 centroida. All rights reserved.
//

import UIKit
import SimpleOverlay

class ViewController: UIViewController {

    var simpleOverlayView: SimpleOverlayView!

    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        simpleOverlayView = SimpleOverlayView(viewsDescriptionsCouples: [(viewTwo, "This is view two, cool right? This is view two, cool right? This is view two, cool right? This is view two, cool right? This is view two, cool right? "), (segmentedControl, "this is segmented control"), (cleanButton, "this is the clean button, use it to clean stuff")], {
            (Bool) in
            print("Finished with overlay :-)")
        })

        view.addSubview(simpleOverlayView)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view.frame = UIScreen.main.bounds
        simpleOverlayView.setNeedsLayout()
        view.setNeedsLayout()
    }
}
