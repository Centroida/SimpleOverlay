//
//  ExampleViewController.swift
//  SimpleOverlay
//
//  Created by Deyan Aleksandrov on 5/18/17.
//  Copyright © 2017 centroida. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    var simpleOverlay: SimpleOverlay!

    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        simpleOverlay = SimpleOverlay(viewsDescriptionsCouples: [(viewTwo, "This is view two, cool right? This is view two, cool right? This is view two, cool right? This is view two, cool right? This is view two, cool right? "), (segmentedControl, "this is segmented control"), (cleanButton, "this is the clean button, use it to clean stuff")])

        view.addSubview(simpleOverlay)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view.frame = UIScreen.main.bounds
        simpleOverlay.setNeedsLayout()
        view.setNeedsLayout()
    }


}
