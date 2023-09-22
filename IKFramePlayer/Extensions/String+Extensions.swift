//
//  String+Extensions.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 20.09.2023.
//

import Foundation

extension String {
    // MARK : Get Youtube ID
    func getYoutubeId() -> String? {
        return URLComponents(string: self)?.queryItems?.first(where: { $0.name == "v" })?.value
    }
    
}
