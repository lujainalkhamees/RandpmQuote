//
//  Favorite.swift
//  Quote App
//
//  Created by Lujain Alkhamees on 24/11/1441 AH.
//  Copyright © 1441 Lujain Alkhamees. All rights reserved.
//

import Foundation

// create struct ////
struct FarJson : Decodable {
    
    let JQuote:String?
    let JAuthorS:String?
}


class Favorite{

    var Quote: String
    var Author: String
    var ArrayWrite = [Favorite]()


    //init constructr
    init() {
        self.Quote = ""
        self.Author = ""
    }
    
    init(Quote: String, Author: String) {
        self.Quote = Quote
        self.Author = Author

    } // end constructr
    
    
    // Read data from Json File, All Favorits Quotes
    func ReadFromJson() -> [Favorite]{
        var ArrayJson = [Favorite]()
        do {
            let url = Bundle.main.path(forResource: "Favorite.json", ofType: nil)
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: url!), options: .alwaysMapped)
            let decoder = JSONDecoder()
            let QuotAndAuth = try decoder.decode([FarJson].self, from: jsonData)
            
            for y in QuotAndAuth{
               var obj : Favorite
                print(y.JQuote)
                print(y.JAuthorS)
                let Q = y.JQuote
                let Ath = y.JAuthorS
                obj = Favorite(Quote: Q!, Author: Ath!)
                ArrayJson.append(obj)
              }// end for lop
            
            let encoder = JSONEncoder()
            //var encodeData = try encoder.encode(QuotAndAuth)

        }//end do
        catch let err {
            print(err) }
        
        return ArrayJson
        
    } // end func ReadFromJson
    
    
    
    
    // Write data to Json File, add Favorite Quote to json
    func WritetoJson(data: Favorite){
        ArrayWrite.append(data)
        guard let file = Bundle.main.url(forResource: "Favorite.json", withExtension: nil) else { return }
        
            // Set the data we want to write
            do{
                let json = try JSONSerialization.data(withJSONObject: ArrayWrite, options: .prettyPrinted)
                if let jsonData = try JSONSerialization.data(withJSONObject: ArrayWrite, options: .init(rawValue: 0)) as? Data
                {
                    // Check if everything went well
                    print(jsonData)
                    print(NSString(data: jsonData, encoding: 1)!)
                    //try jsonData.write(to: file)
                    do {
                        try jsonData.write(to: file, options: .atomic)
                    }
                    catch {/* error handling here */}
                    
                    var mai = file.relativePath
                    // var mai = file.absoluteString
                }
            } // end do
            catch var err{
                print(err)
                 }
    
    }// end WritetoJson Func
}// end class 
