//
//  FavoriteClass.swift
//  Quote App
//
//  Created by Lujain Alkhamees on 24/11/1441 AH.
//  Copyright © 1441 Lujain Alkhamees. All rights reserved.
//

import UIKit

class FavoriteClass: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var Quotes_1 = [Favorite] ()

    @IBOutlet weak var TableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableView.reloadData()
        print("befor")
        getDataOfArray()
        print("after")
        //TableView.dataSource = self
        //TableView.dataSource = self
    }
    
   
    
    func getDataOfArray() {
        
        // use json to Read form Json, Display All Faforites Quotes
       // Quotes_1 = Favorite().ReadFromJson()
        
        print(Quotes_1.count)
        print("la aalm")
        for num in Quotes_1 {
            print(num.Quote)
            print(num.Author)
           }
        
    }
    
   
    
    // table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Quotes_1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = Quotes_1[indexPath.row].Quote
        // cell.textLabel?.text = Quotes_1[indexPath.row].Author
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SS = storyboard?.instantiateViewController(withIdentifier: "SingleQuoteF") as? SingleQuoteF
        SS?.Quote = Quotes_1[indexPath.row].Quote
        SS?.Author = Quotes_1[indexPath.row].Author
        self.present(SS!, animated: false, completion: nil)
    }
    


} // end class
