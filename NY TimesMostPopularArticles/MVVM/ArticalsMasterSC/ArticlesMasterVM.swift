//
//  ArticalsMasterVM.swift
//  NY TimesMostPopularArticles
//
//  Created by SaFaa Mohamed on 04/03/2022.
//

import Foundation
class ArticalsMasterVM  : MainViewModel
{
    var selectedArticle: ArticleModel!
    let detailsSegueId = "showArticleDetail"
    var articleViewModels = [ArticleModel]()
    let articleCellId = "ArticleCellId"
    var reloadTableViewClosure : (()->())?
    func getListCount() -> Int {
        articleViewModels.count
    }
    
    func getItemAtindex(index : Int) ->  ArticleModel{
        return articleViewModels[index]
    }
    func getArticles() {
        self.state = .loading
        ApiManager.getArticles(period: .week, success: { articles in
           
            self.articleViewModels = articles.map{ArticleModel(article: $0)}
          
            self.state = .populated
            self.reloadTableViewClosure?()
        }, failure: { errorMessage in
            self.state = .populated
            self.alertMesage = errorMessage
            
        })
    }
}
 
