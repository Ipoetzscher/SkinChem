//
//  Share.swift
//  TestApp
//
//  Created by India Poetzscher on 7/12/22.
//

import Foundation
import UIKit

func share(items: [Any],
                   excludedActivityTypes: [UIActivity.ActivityType]? = nil,
                   ipad: (forIpad: Bool, view: UIView?) = (false, nil)) -> UIActivityViewController {
    let activityViewController = UIActivityViewController(activityItems: items,
                                                          applicationActivities: nil)
    if ipad.forIpad {
        activityViewController.popoverPresentationController?.sourceView = ipad.view
    }
    
    if let excludedActivityTypes = excludedActivityTypes {
        activityViewController.excludedActivityTypes = excludedActivityTypes
    }
    
    return activityViewController
}
