//
//  ViewController.swift
//  Quote App
//
//  Created by Lujain Alkhamees on 23/11/1441 AH.
//  Copyright © 1441 Lujain Alkhamees. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var quot : String = ""
    var author : String = ""
    var Quotes = [Favorite] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call func getData
        getData()
    }
    
    
    @IBOutlet weak var AuthorLabel: UILabel!
    @IBOutlet weak var QuoteLabel: UILabel!
    @IBAction func AllFavorites(_ sender: Any) {
        sendData()
        
    }
    
    // if user click Favorite button save the Quote and Author in Array
    @IBAction func favorButton(_ sender: Any) {
        // object of Favorite
        var obj : Favorite
        obj = Favorite(Quote: quot, Author: author)
      
        Quotes.append(obj)
        
        // use Json to Write
       //  Favorite().WritetoJson(data: obj)
        
    }
    
    // if user click other Quote
    @IBAction func OtherQuote(_ sender: Any) {
        getData()
    }
    
    
    // funcation for GET call
    func getData(){
        
        //URL API Random Quote
        let url = URL(string: "https://programming-quotes-api.herokuapp.com/quotes/random")!
        
        // Request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        //Session
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
         // Json data
            do{
                if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : String] {
                    
                    DispatchQueue.main.async {
                    if let Quote = json["en"]{
                        if let Author = json["author"]{
                            
                        self.QuoteLabel.text = Quote
                        self.AuthorLabel.text = "- \( Author)"

                           self.quot = Quote
                           self.author = Author
                       // print(Quote)
                       // print(Author)
                        }
                        }
                    }
                }
                
            }
            // error handler
            catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
            }.resume()
        
        
    }
    
    
   func sendData() {

     let SS = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteClass") as? FavoriteClass
     SS?.Quotes_1 = Quotes
     self.present(SS!, animated: false, completion: nil)
        
    }
    
    
    
    
    
} // end class

