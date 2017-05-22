//
//  ExampleProjectTests.swift
//  ExampleProjectTests
//
//  Created by Deyan Aleksandrov on 5/22/17.
//  Copyright © 2017 centroida. All rights reserved.
//

import XCTest
import SimpleOverlay
@testable import ExampleProject

class ExampleProjectTests: XCTestCase {

    var vc: ViewController!
    var simpleOverlayView: SimpleOverlayView!
    var paddingLabel: PaddingLabel!
    
    override func setUp() {
        super.setUp()

        // Setup storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateInitialViewController() as! ViewController
        // Trigger loadView() func in vc by doing the immediate bellow
        let _ = vc.view

        // Setup SimpleOverlayView
        simpleOverlayView = SimpleOverlayView(dismissDuration: 0.4, distanceFromScreenEdge: 20, height: 45, distanceFromViewDescribed: 31, viewsDescriptionsCouples: [(vc.cleanButton, "This is a clean button")], completionHandler: {_ in
            print("Finito")
        })

        // Setup Padding Label separately
        paddingLabel = PaddingLabel()
    }
    override func tearDown() {
        vc = nil
        simpleOverlayView = nil
        super.tearDown()
    }
    
    func testSimpleOverlayViewsGetSetProperly() {
        XCTAssert(simpleOverlayView.dismissDuration == 0.4)
        XCTAssert(simpleOverlayView.distanceFromScreenEdge == 20)
        XCTAssert(simpleOverlayView.height == 45)
        XCTAssert(simpleOverlayView.distanceFromViewDescribed == 31)

        XCTAssert(simpleOverlayView.viewsDescriptionsCouples != nil)
        XCTAssert(simpleOverlayView.viewsDescriptionsCouples.count == 1)
        XCTAssert(simpleOverlayView.viewsDescriptionsCouples[0].0 == vc.cleanButton)
        XCTAssert(simpleOverlayView.viewsDescriptionsCouples[0].1 == "This is a clean button")

        XCTAssert(simpleOverlayView.completionHandler != nil)
    }

    func testPaddingLabelClassInstrinsicContentSize() {
        XCTAssertTrue(paddingLabel.intrinsicContentSize.height == 8.0)
        XCTAssertTrue(paddingLabel.intrinsicContentSize.width == 14.0)
    }
}
