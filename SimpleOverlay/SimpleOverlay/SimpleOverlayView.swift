//
//  SimpleOverlay.swift
//  SimpleOverlay
//
//  Created by Deyan Aleksandrov on 4/11/17.
//  Copyright © 2017 centroida. All rights reserved.
//

import UIKit

class SimpleOverlay: UIView {

    /// Time for which you get the bubbly description view dismissed on tap. Default is 0.4
    public var dismissDuration: Double!

    /// Sets the distance of the bubble description view label from the edges of the screen. Default is 15.
    public var distanceFromScreenEdge: CGFloat!

    /// Sets the bubble description view label height. Default is 40.
    public var height: CGFloat!

    /// Sets the bubble description view label from the view described. Default is 25
    public var distanceFromViewDescribed: CGFloat!

    /// A tuple to add the views and their descriptions. There is no default.
    public var viewsDescriptionsCouples: [(UIView, String)]!

    // MARK: - Initiliazers
    init(_ dismissDuration: Double = 0.4, _ distanceFromScreenEdge: CGFloat = 15, _ height: CGFloat = 40, _ distanceFromViewDescribed: CGFloat = 25, viewsDescriptionsCouples: [(UIView, String)]) {
        self.dismissDuration = dismissDuration
        self.distanceFromScreenEdge = distanceFromScreenEdge
        self.height = height
        self.distanceFromViewDescribed = distanceFromViewDescribed
        self.viewsDescriptionsCouples = viewsDescriptionsCouples
        super.init(frame: UIScreen.main.bounds)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// A tap function to dismiss current overlay view with bubble description
    ///
    /// - Parameter sender: the tap gesture recognizer
    func handleTap(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: dismissDuration,
                       animations: {
                        sender.view?.alpha = 0.0
        },
                       completion: { (Bool) in
                        sender.view?.removeFromSuperview()
                        if self.subviews.isEmpty {
                            self.removeFromSuperview()
                        }
        })

        if !viewsDescriptionsCouples.isEmpty {
            let lastViewDescriptionCouple = viewsDescriptionsCouples.popLast()
            if let lastViewDescribed = lastViewDescriptionCouple?.0 {
                lastViewDescribed.layer.shadowOpacity = 0
                lastViewDescribed.layer.zPosition = 0
            }
            if let couple = viewsDescriptionsCouples.last {
                addBubbleInfoView(couple.0, couple.1, height)
            }
        }
    }

    /// Add gesture recognizer to the view that needs to be tapped
    ///
    /// - Parameter viewToTap: that needs to be tapped
    fileprivate func addTapRecognizerToView(_ viewToTap: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        viewToTap.addGestureRecognizer(tap)
        viewToTap.isUserInteractionEnabled = true
    }

    /// Add overlay with description and info bubble
    ///
    /// - Parameters:
    ///   - viewDescribed: which gets highlighted and to which overlay is added
    ///   - description: the info bubble
    ///   - height: of the info bubble
    fileprivate func addBubbleInfoView(_ viewDescribed: UIView, _ description: String, _ height: CGFloat) {

        // Function variables needed locally
        let screenWidth = UIScreen.main.bounds.width

        // Setup overlayVIew
        let overlayView = UIView()
        overlayView.frame = frame
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.75)

        // Setup higlighted view to put over viewDescribed
        let viewHighlighted = UIView(frame: CGRect(x: viewDescribed.frame.minX - 10, y: viewDescribed.frame.minY - 10, width: viewDescribed.frame.width + 20, height: viewDescribed.frame.height + 20))
        viewHighlighted.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        viewHighlighted.layer.zPosition = 100
        viewDescribed.layer.zPosition = 101

        // Setup Arrow image
        let arrowImage = UIImageView()
        arrowImage.layer.zPosition = 100

        // Setup description label
        let descriptionLabel = PaddingLabel()
        descriptionLabel.backgroundColor = .white
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.minimumScaleFactor = 0.25
        descriptionLabel.text = description

        // Top and bottom possible maximum points for bubble info frame
        let maxY = viewHighlighted.frame.maxY + distanceFromViewDescribed
        let minY = viewHighlighted.frame.minY - height - distanceFromViewDescribed

        // Boolean check for bubble's frame top
        let isBubbleTopWithinFrame = frame.contains(CGPoint(x: 0, y: minY))

        if isBubbleTopWithinFrame {
            descriptionLabel.frame = CGRect(x: distanceFromScreenEdge, y: minY, width: screenWidth - (2 * distanceFromScreenEdge), height: height)
            arrowImage.frame = CGRect(x: viewHighlighted.frame.minX, y: viewHighlighted.frame.minY - distanceFromViewDescribed, width: viewHighlighted.frame.width, height: distanceFromViewDescribed)
            arrowImage.image = #imageLiteral(resourceName: "bracket up")
        } else {
            descriptionLabel.frame = CGRect(x: distanceFromScreenEdge, y: maxY, width: screenWidth - (2 * distanceFromScreenEdge), height: height)
            arrowImage.frame = CGRect(x: viewHighlighted.frame.minX, y: viewHighlighted.frame.maxY, width: viewHighlighted.frame.width, height: distanceFromViewDescribed)
            arrowImage.image = #imageLiteral(resourceName: "bracket down")
        }

        // Add subviews and gesture recognizer
        overlayView.addSubview(viewHighlighted)
        overlayView.addSubview(descriptionLabel)
        overlayView.addSubview(arrowImage)
        addTapRecognizerToView(overlayView)

        // Add overlay view to self with animation
        overlayView.alpha = 0
        addSubview(overlayView)
        UIView.animate(withDuration: dismissDuration) { _ in
            overlayView.alpha = 0.75
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if !subviews.isEmpty {
            for view in subviews {
                view.removeFromSuperview()
            }
        }
        frame = UIScreen.main.bounds
        if let couple = viewsDescriptionsCouples.last {
            addBubbleInfoView(couple.0, couple.1, height)
        }

    }
}
