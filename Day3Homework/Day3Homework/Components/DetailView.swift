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
    
    weak var delegate: DetailViewDelegate?
    
    @IBOutlet private dynamic weak var nameLabel: UILabel!
    @IBOutlet private dynamic weak var iconImageView: UIImageView!
    @IBOutlet private dynamic weak var introductionLabel: UILabel!
    @IBOutlet private dynamic weak var twitterLabel: UILabel!
    @IBOutlet private dynamic weak var instagramLabel: UILabel!
    @IBOutlet private dynamic weak var snapChatLabel: UILabel!
    @IBOutlet private dynamic weak var redditLabel: UILabel!
    @IBOutlet private dynamic weak var lineLabel: UILabel!
    @IBOutlet private dynamic weak var whatsAppLabel: UILabel!
    @IBOutlet private dynamic weak var messangerLabel: UILabel!
    @IBOutlet private dynamic weak var sampleImageView: UIImageView!
    
    var content: Content? {
        didSet {
            updateContent()
        }
    }
    
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        delegate?.buttonTouchUpInside(self)
    }
    
    class func createFromNib() -> DetailView {
        let xib = UINib(nibName: "DetailView", bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "Xib Load Error!!")
        }
        return view!
    }
    
    func updateContent() {
        guard let content = self.content else { return }
        nameLabel.text = content.name
        introductionLabel.text = content.introduction
        iconImageView.image = UIImage(named: content.iconName)
        setupMediaList(content)
    }
    
    private func setupMediaList(_ content: Content) {
        //TODO Replace with TableView
        for media in content.media {
            switch media {
            case .twitter:
                twitterLabel.isHidden = false
                setupMediaContent(media, twitterLabel)
            case .instagram:
                instagramLabel.isHidden = false
                setupMediaContent(media, instagramLabel)
            case .snapchat:
                snapChatLabel.isHidden = false
                setupMediaContent(media, snapChatLabel)
            case .reddit:
                redditLabel.isHidden = false
                setupMediaContent(media, redditLabel)
            case .line:
                lineLabel.isHidden = false
                setupMediaContent(media, lineLabel)
            case .whatsapp:
                whatsAppLabel.isHidden = false
                setupMediaContent(media, whatsAppLabel)
            case .fbmessenger:
                messangerLabel.isHidden = false
                setupMediaContent(media, messangerLabel)
            }
        }
    }
    
    private func setupMediaContent(_ brand: BrandIcon, _ label: UILabel) {
        let titleText = "<brand>\(brand.text)</brand> <bold>@\(brand.name)</bold>"
        let attributedString: NSAttributedString = titleText.styled(with: StringStyle(
            .font(UIFont.default(20)),
            .color(.black),
            .lineSpacing(6),
            .xmlRules([
                .style("bold", StringStyle(
                    .font(UIFont.defaultBold(20)),
                    .color(.lightGray)
                )),
                .style("brand", StringStyle(
                    .font(UIFont.faBrand(20)),
                    .color(brand.color)
                ))
            ])
        ))
        
        label.attributedText = attributedString
    }
}
