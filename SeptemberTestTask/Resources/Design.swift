//
//  Design.swift
//  SeptemberTestTask
//
//  Created by Денис Ледовский on 05.09.2023.
//

import Foundation
import UIKit

enum Design {

    enum Image {
        static let book = UIImage(systemName: "character.book.closed")
        static let fact = UIImage(systemName: "bubble.left.circle")
        static let web = UIImage(systemName: "globe")
    }

    enum Color {
        static let black = UIColor.black
        static let white = UIColor.white
        static let red = UIColor.systemRed
        static let gray = UIColor.systemGray
        static let grayLight = UIColor.systemGray.withAlphaComponent(0.2)
    }

    enum Font {
        static let h1 = UIFont.systemFont(ofSize: 18, weight: .bold)
        static let h2 = UIFont.systemFont(ofSize: 15, weight: .regular)
        static let t1 = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let button1 = UIFont.systemFont(ofSize: 15, weight: .medium)
        static let error = UIFont.systemFont(ofSize: 12, weight: .bold)
    }
}

