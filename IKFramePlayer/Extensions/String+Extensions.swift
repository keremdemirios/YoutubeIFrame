//
//  String+Extensions.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 20.09.2023.
//

import Foundation

extension String {
    func getYoutubeId() -> String? {
        return URLComponents(string: self)?.queryItems?.first(where: { $0.name == "v" })?.value
    }
}


// url : https://www.youtube.com/watch?v=WxR3CMyMl1c
