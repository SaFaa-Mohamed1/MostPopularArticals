//
//  ArticalsDetailsVC.swift
//  NY TimesMostPopularArticles
//
//  Created by SaFaa Mohamed on 04/03/2022.
//

import UIKit
 
class ArticalsDetailsVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    lazy var viewModel : ArticlesDetailsVM = {
        return ArticlesDetailsVM()
    }()
    var articleModel: ArticleModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.load(withImageUrl: articleModel.imageUrlString)
        titleLabel.text = articleModel.title
        abstractLabel.text = articleModel.abstract
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
