//
//  DetailView.swift
//  Day3Sample
//
//  Created by 柳田昌弘 on 2020/12/02.
//

import UIKit

class DetailView: UIView {
    class func createFromNib() -> DetailView {
        let xib = UINib(nibName: "DetailView", bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "Xib Load Error!!")
        }
        return view!
    }
}
