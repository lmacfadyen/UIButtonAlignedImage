//
//  AlignedImageButton.swift
//  iOSActionIconUIButton
//
//  Created by Lawrence F MacFadyen on 2017-08-09.
//  Copyright © 2017 Lawrence F MacFadyen. All rights reserved.
//

import UIKit

class AlignedImageButton: UIButton {

    // Convenience initializer must delegate across not up
    // So we override init and call super.init to facilitate that
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // For storyboard
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // If button in storyboard is Custom, you'll need to set
        // title color for control states and optionally the font
        // I've set mine to System, so uncomment next three lines if Custom

        //self.setTitleColor(tintColor, for: .normal)
        //self.setTitleColor(tintColor.withAlphaComponent(0.3), for: .highlighted)
        //self.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        configure()
    }
    
    // Convenience initializer calling across to our init that calls super.init
    // Setting up the image for UIControlState then calling common configure
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        self.setImage(image, for: UIControlState.normal)
        let imageHighlight = image.alpha(0.3)?.withRenderingMode(.alwaysTemplate)
        self.setImage(imageHighlight, for: UIControlState.highlighted)
        configure()
    }
    
    func configure()
    {
        // Just in case they aren't set in a Storyboard
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
        
        guard let image = self.image(for: UIControlState.normal) else
        {
            return
        }
        
        // Inset the image based on left edge
        self.imageEdgeInsets = UIEdgeInsetsMake(0, self.bounds.size.width-image.size.width*1.7, 0, 0);
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.darkGray.cgColor
        // Inset top and bottom by 10
        self.contentEdgeInsets = UIEdgeInsetsMake(10,0,10,0)
    }
    
    // Configure button when bounds change since image inset has dependency on bounds
    override public var bounds: CGRect{
        didSet{
            configure()
        }
    }
    
}

// Credit to Peter Kreinz for this one (see link in tutorial)
extension UIImage {
    func alpha(_ value:CGFloat)->UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

