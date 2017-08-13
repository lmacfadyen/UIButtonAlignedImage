//
//  ViewController.swift
//  iOSActionIconUIButton
//
//  Created by Lawrence F MacFadyen on 2017-08-06.
//  Copyright © 2017 Lawrence F MacFadyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "EditIcon")?.withRenderingMode(.alwaysTemplate) else
        {
            return
        }
        
        let button: UIButton = AlignedImageButton(frame: .zero, image: image)
        
        button.setTitle("Button From Code", for: .normal)
        // Button is Custom by default so need to set its title color for normal/highlighted
        button.setTitleColor(button.tintColor, for: .normal)
        button.setTitleColor(button.tintColor.withAlphaComponent(0.3), for: .highlighted)
        // Set font and background color the same as storyboard button
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        button.backgroundColor = UIColor.lightText
        
        stackView.addArrangedSubview(button);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
