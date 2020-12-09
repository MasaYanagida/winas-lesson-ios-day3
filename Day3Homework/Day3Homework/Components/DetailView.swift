//
//  DetailView.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import BonMot

protocol DetailViewProtocol: class {
    func didTapOnFavoriteButton(_ view: DetailView)
}

class DetailView: UIView {
    
    weak var delegate: DetailViewProtocol?
    
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
    @IBOutlet private dynamic weak var displayImage: UIImageView!
    
    var content: Content? {
        didSet {
            guard let content = self.content else { return }
            nameLabel.text = content.name
            introductionLabel.text = content.introduction
            iconImageView.image = UIImage(named: content.iconName)
            setMediaInfo(content)
        }
    }
    
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.didTapOnFavoriteButton(self)
    }
    
    class func createFromNib() -> DetailView {
        let xib = UINib(nibName: "DetailView", bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "Xib Load Error!!")
        }
        return view!
    }
    
    private func setMediaInfo(_ content: Content) {
        for media in content.media {
            switch media {
                case .twitter:
                    twitterLabel.isHidden = false
                    setMediaContent(for: media, with: twitterLabel)
                case .instagram:
                    instagramLabel.isHidden = false
                    setMediaContent(for: media, with: instagramLabel)
                case .snapchat:
                    snapChatLabel.isHidden = false
                    setMediaContent(for: media, with: snapChatLabel)
                case .reddit:
                    redditLabel.isHidden = false
                    setMediaContent(for: media, with: redditLabel)
                case .line:
                    lineLabel.isHidden = false
                    setMediaContent(for: media, with: lineLabel)
                case .whatsapp:
                    whatsAppLabel.isHidden = false
                    setMediaContent(for: media, with: whatsAppLabel)
                case .fbmessenger:
                    messangerLabel.isHidden = false
                    setMediaContent(for: media, with: messangerLabel)
            }
        }
    }
    
    private func setMediaContent(for brand: BrandIcon, with label: UILabel) {
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

