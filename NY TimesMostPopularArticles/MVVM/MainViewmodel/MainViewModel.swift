//
//  MainViewModel.swift
//  NY TimesMostPopularArticles
//
//  Created by SaFaa Mohamed on 04/03/2022.
//

import Foundation
public enum State{
    case loading
    case populated
}
class MainViewModel {
    var updateLoadingStatus : (()->())?
    var showAlertClosure : (()->())?
    var state : State = .populated
    {
         didSet{
             self.updateLoadingStatus?()
         }
     }
    var alertMesage : String?{
        didSet{
            self.showAlertClosure?()
        }
    }
    
}
