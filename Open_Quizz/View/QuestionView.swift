//
//  QuestionView.swift
//  Open_Quizz
//
//  Created by Bryan Valcasara on 23/03/2019.
//  Copyright © 2019 Bryan Valcasara. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!

    enum Style {
        case correct, incorrect, standard
    }
    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    var title = "" {
        didSet {
            label.text = title
        }
    }
    private func setStyle (_ style: Style)
    {
        switch style {
        case .correct:
            //backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)
            backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            //icon.image = UIImage(named: "Icon Correct")
            icon.image = #imageLiteral(resourceName: "Icon Correct")
            icon.isHidden = false
        case .incorrect:
            backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Error")
            icon.isHidden = false
        case .standard:
            backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            icon.isHidden = true
        }
    }
}
