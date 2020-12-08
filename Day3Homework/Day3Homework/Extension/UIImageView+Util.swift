//
//  UIImageView+Util.swift
//  Day3Homework
//
//  Created by Ahsan on 2020/12/08.
//

import UIKit
import Nuke

extension UIImageView {
    func loadNukeImage(_ url: URL) {
        Nuke.loadImage(
            with: url,
            options: ImageLoadingOptions(
                transition: .fadeIn(duration: 0.2)
            ),
            into: self
        )
    }
}
