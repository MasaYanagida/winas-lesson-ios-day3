//
//  DetailView.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import BonMot

protocol DetailViewDelegate: class {
    func buttonTouchUpInside(_ view: DetailView)
}

class DetailView: UIView {
    
    // TODO : implement this
    weak var delegate: DetailViewDelegate?
        
    var content: Content? {
        didSet{
            update()
        }
    }
    
    func update(){
        guard let content = self.content else {return}
        
        // name
        let text = "<bold>\(content.name)</bold>"
        var attributedString: NSAttributedString = text.styled(with: StringStyle(
                .font(UIFont.default(20)),
                .color(.black),
                .lineSpacing(6),
                .xmlRules([
                    .style("bold", StringStyle(
                        .font(UIFont.defaultBold(20)),
                        .color(.black)
                    )),
                ])
            ))
        nameLabel.attributedText = attributedString
        
        //TODO Loop
        //twitter
        var favoriteApp = BrandIcon.twitter
        var textbrands = "<brand>\(favoriteApp.text)</brand>"
        var iconString : NSAttributedString = textbrands.styled(with: StringStyle(
                .font(UIFont.default(20)),
                .color(.black),
                .lineSpacing(6),
                .xmlRules([
                    .style("brand", StringStyle(
                        .font(UIFont.faBrand(20)),
                        .color(favoriteApp.color)
                    ))
                ])
            ))
        
        var textString = "@Sugiura1".styled(with: StringStyle(
            .font(UIFont.default(15)),
            .color(.gray)
        ))
        twitterLabel.attributedText = NSAttributedString.composed(of: [iconString, textString], baseStyle: StringStyle(), separator: "   ")
       
        //insta
        favoriteApp = BrandIcon.instagram
        textbrands = "<brand>\(favoriteApp.text)</brand>"
        iconString = textbrands.styled(with: StringStyle(
                .font(UIFont.default(20)),
                .color(.black),
                .lineSpacing(6),
                .xmlRules([
                    .style("brand", StringStyle(
                        .font(UIFont.faBrand(20)),
                        .color(favoriteApp.color)
                    ))
                ])
            ))
        
        textString = "@Sugiura1".styled(with: StringStyle(
            .font(UIFont.default(15)),
            .color(.gray)
        ))
        instaLabel.attributedText = NSAttributedString.composed(of: [iconString, textString], baseStyle: StringStyle(), separator: "   ")
        
        //reddit
        favoriteApp = BrandIcon.reddit
                textbrands = "<brand>\(favoriteApp.text)</brand>"
                iconString = textbrands.styled(with: StringStyle(
                        .font(UIFont.default(20)),
                        .color(.black),
                        .lineSpacing(6),
                        .xmlRules([
                            .style("brand", StringStyle(
                                .font(UIFont.faBrand(20)),
                                .color(favoriteApp.color)
                            ))
                        ])
                    ))
                
                textString = "@Sugiura1".styled(with: StringStyle(
                    .font(UIFont.default(15)),
                    .color(.gray)
                ))
        redditLabel.attributedText = NSAttributedString.composed(of: [iconString, textString], baseStyle: StringStyle(), separator: "   ")
        // nameLabel.text  = content.name
        introLabel.text = content.introduction
        mainImage.image = UIImage(named: content.imageName)
        
    }
    
    
    class func createFromNib() -> DetailView {
        let xib = UINib(nibName: "DetailView", bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "Xib Load Error!!")
        }
        return view!
    }
    
    @IBOutlet private dynamic weak var iconImage: UIImageView!
    @IBOutlet private dynamic weak var nameLabel: UILabel!
    @IBOutlet private dynamic weak var introLabel: UILabel!
    @IBOutlet private dynamic weak var mainImage: UIImageView!
    @IBOutlet private dynamic weak var brandView: UIView!
    @IBOutlet private dynamic weak var twitterLabel: UILabel!
    @IBOutlet private dynamic weak var instaLabel: UILabel!
    @IBOutlet private dynamic weak var redditLabel: UILabel!
    
    @IBAction private func buttonTouchUpInside(_ sender: UIButton){
        delegate?.buttonTouchUpInside(self)
    }
}
