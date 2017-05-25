# SimpleOverlay
 
SimpleOverlay is a super simple class inheriting from UIView provided to you as a framework that helps you add a shadowed layer view with description text bubbles. The idea of these description bubbles is to help direct the user of your app on how to make use of certain buttons, labels, textfields and etc. Anything you can think of basically.

- [Preview](#preview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)


## Preview

![](https://media.giphy.com/media/7jXYafkG3Yf96/giphy.gif)   

## Features

- Easily instantiated.
- Custom init with default values that can be updated.
- UIView - Description coupled to avoid missing on adding a description.
- Completion handler provided at the end to enable adding stuff precisely after SimpleOverlay has removed itself


## Requirements

- iOS 9.0+
- Swift 3.0+

## Installation 

### CocoaPods 

 - Cocoapods support to be added.

### Alternatively:

- Git submodule add https://github.com/Centroida/SimpleOverlay.git
- Drag the SimpleOverlay.xcodeproj file into your Xcode project (Xcode will ask to create a workspace file if your project does not have one already)
- Under the main app target, open the General tab and add SwiftImageCarousel under the Embedded Binaries section
- Build the SimpleOverlay as a target before you import it
- It is ready to be imported and used

<b>Or</b>

- Download directly from the github link https://github.com/Centroida/SimpleOverlay
- Run your project, right click on the name of your project in the files navigator and choose "Add Files to <i>NameOfYourProject</i>"
- Find SimpleOverlay.xcodeproj and add it
- Under the main app target, open the General tab and add SimpleOverlay under the Embedded Binaries section
- Build the SimpleOverlay as a target before you import it
- It is ready to be imported and used

## Usage

### Importing the framework 

```swift
import SimpleOverlay
```

### Using SimpleOverlay without setting all the variables but just the viewsDescriptionsCouples:

```swift
    /// Views declared in Main.Storyboard.    
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!    

     override func viewDidLoad() {
        super.viewDidLoad()
        let simpleOverlayView = SimpleOverlayView(viewsDescriptionsCouples:[(viewTwo, "This is view two, cool right? This is view two, cool right? "),
                                                                            (segmentedControl, "this is segmented control"),
                                                                            (cleanButton, "this is the clean button, use it to clean stuff")],
                                                  completionHandler: nil)
        view.addSubview(simpleOverlayView)
    }
```
  
## License

SwiftImageCarousel is released under the MIT license. See LICENSE for details.
