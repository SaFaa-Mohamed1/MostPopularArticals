//
//  UimageView-Extention.swift
//  NY TimesMostPopularArticles
//
//  Created by SaFaa Mohamed on 04/03/2022.
//

import Kingfisher
extension UIImageView {
    func load(withImageUrl urlString: String?) {
        if let urlString = urlString, let url = URL(string: urlString) {
            let imageResource = ImageResource(downloadURL: url)
            self.kf.setImage(with: imageResource, placeholder: nil, options:  [.transition(.fade(0.3))])
        } else {
            self.image = nil
        }
    }
}
