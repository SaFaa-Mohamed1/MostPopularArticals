//
//  ArticalsMasterVC.swift
//  NY TimesMostPopularArticles
//
//  Created by SaFaa Mohamed on 04/03/2022.
//

import UIKit

class ArticalsMasterVC: MainViewController {
   
    //MARK:-
    lazy var viewModel : ArticalsMasterVM = {
        return ArticalsMasterVM()
    }()
   
    //MARK:-
    @IBOutlet weak var tableView: UITableView!
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        initVM()
        setupTableView()
        viewModel.getArticles()
        

    }

    
    func initVM() {
        viewModel.showAlertClosure = {
            if let message = self.viewModel.alertMesage{
                self.showAlert(title: "Error", message: message)
            }
        }
        viewModel.updateLoadingStatus = {
            
                switch self.viewModel.state{
                case .loading:
                    self.showLoading()
                case .populated:
                    self.hideLoading()
                }
        }
        viewModel.reloadTableViewClosure = {
            self.tableView.reloadData()
        }
    }
    func setupTableView() {
        let articleNib = UINib(nibName: "ArticleTableViewCell", bundle: nil)
        self.tableView.register(articleNib, forCellReuseIdentifier: viewModel.articleCellId)
     
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == viewModel.detailsSegueId {
            let detailsVC = segue.destination as! ArticalsDetailsVC
            detailsVC.articleModel = viewModel.selectedArticle
        }
    }

}
extension ArticalsMasterVC : UITableViewDelegate, UITableViewDataSource  {
 
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return viewModel.getListCount()
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let articleCell = tableView.dequeueReusableCell(withIdentifier: viewModel.articleCellId, for: indexPath) as! ArticleTableViewCell
         articleCell.articleViewModel = viewModel.getItemAtindex(index: indexPath.row)
        return articleCell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         viewModel.selectedArticle = viewModel.getItemAtindex(index: indexPath.row)
         performSegue(withIdentifier: viewModel.detailsSegueId, sender: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
