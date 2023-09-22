//
//  AddSubViews+Extension.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 22.09.2023.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
