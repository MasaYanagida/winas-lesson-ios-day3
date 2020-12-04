//
//  UIImageView+Util.swift
//  Day3Sample
//
//  Created by 柳田昌弘 on 2020/12/04.
//

import UIKit
import Nuke

extension UIImageView {
    func loadNukeImage(_ url: URL) {
        Nuke.loadImage(
            with: url, //URL(string: ImageFileName)!,
            options: ImageLoadingOptions(
                transition: .fadeIn(duration: 0.2)
            ),
            into: self,
            progress: nil,
            completion: nil
        )
    }
}
