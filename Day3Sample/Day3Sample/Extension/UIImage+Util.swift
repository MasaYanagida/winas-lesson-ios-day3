//
//  UIImage+Util.swift
//  Day3Sample
//
//  Created by 柳田昌弘 on 2020/11/29.
//

import UIKit

// MARK: - BrandIcon

enum BrandIcon {
    case twitter, reddit, instagram, snapchat, line, whatsapp, fbmessenger
    
    var text: String {
        switch self {
        case .twitter: return "\u{f099}"
        case .reddit: return "\u{f281}"
        case .instagram: return "\u{f16d}"
        case .snapchat: return "\u{f2ac}"
        case .line: return "\u{f3c0}"
        case .whatsapp: return "\u{f232}"
        case .fbmessenger: return "\u{f39f}"
        }
    }
    var color: UIColor {
        let code: Int
        switch self {
        case .twitter: code = 0x55acee
        case .reddit: code = 0xff4500
        case .instagram: code = 0xc13584
        case .snapchat: code = 0xfffc00
        case .line: code = 0x1dcd00
        case .whatsapp: code = 0x25d366
        case .fbmessenger: code = 0x0078FF
        }
        return UIColor.hexColor(code)
    }
    var name: String {
        switch self {
        case .twitter: return "Twitter"
        case .reddit: return "Reddit"
        case .instagram: return "Instagram"
        case .snapchat: return "Snapchat"
        case .line: return "LINE"
        case .whatsapp: return "Whatsapp"
        case .fbmessenger: return "Facebook Messenger"
        }
    }
}

// MARK: - UIImage

extension UIImage {
    
    class func brandIcon(
        icon: BrandIcon,
        color: UIColor,
        fontSize: CGFloat,
        size: CGSize? = nil
        ) -> UIImage? {
        let font = UIFont.faBrand(fontSize)
        return fontImage(font: font, name: icon.text, color: color, fontSize: fontSize, size: size)
    }
    
    class func fontImage(
        font: UIFont,
        name: String,
        color: UIColor,
        fontSize: CGFloat,
        size: CGSize? = nil
        ) -> UIImage? {
        var imageSize: CGSize = CGSize.zero
        if let size = size {
            imageSize = size
        } else {
            imageSize = CGSize(width: fontSize, height: fontSize)
        }
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        
        let attributes: [NSAttributedString.Key: AnyObject] = [
            NSAttributedString.Key.backgroundColor: UIColor.clear,
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        let attributeString = NSAttributedString(string: name, attributes: attributes)
        let ctx = NSStringDrawingContext()
        let boundingRect = attributeString.boundingRect(with: CGSize(width: fontSize, height: fontSize), options: .usesLineFragmentOrigin, context: ctx)
        attributeString.draw(in: CGRect(
            x: (imageSize.width/2.0) - boundingRect.size.width/2.0,
            y: (imageSize.height/2.0) - boundingRect.size.height/2.0,
            width: imageSize.width,
            height: imageSize.height
            )
        )
        if let iconImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return iconImage
        }
        return nil
    }
}
