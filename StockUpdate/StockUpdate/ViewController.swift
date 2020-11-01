//
//  ViewController.swift
//  StockUpdate
//
//  Created by Danni Chen on 10/31/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner


class ViewController: UIViewController {
    
    let apiKey = "6ea500b4e10d8296e43253603aa9666e"
    let baseUrl = "https://financialmodelingprep.com/api/v3/profile/"

    @IBOutlet weak var textCompany: UITextField!
    
    @IBOutlet weak var lblCEO: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStock(_ sender: Any) {
        guard let companyName = textCompany.text else { return }
        
        SwiftSpinner.show("Getting Company Data for \(companyName)")
        let url = "\(baseUrl)\(companyName)?apikey=\(apiKey)"
        Alamofire.request(url)
            .responseJSON{(response) in
            SwiftSpinner.hide()
                let jsonResult = JSON(response.result.value!)
                if jsonResult.count < 1 {
                    self.lblCEO.text = nil
                    self.lblPrice.text = nil
                }else{
                    let ceoName = jsonResult[0]["ceo"].string!
                    let price = jsonResult[0]["price"].double!
                    self.lblCEO.text = "\(ceoName)"
                    self.lblPrice.text = "\(price)"
                }
        }
    }
}

