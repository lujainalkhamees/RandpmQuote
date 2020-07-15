//
//  SingleQuoteF.swift
//  Quote App
//
//  Created by Lujain Alkhamees on 24/11/1441 AH.
//  Copyright © 1441 Lujain Alkhamees. All rights reserved.
//

import UIKit

class SingleQuoteF: UIViewController {
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var AuthLabel: UILabel!
    
    var Quote: String = ""
    var Author: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QLabel.text = Quote
        AuthLabel.text = "- \(Author)"
    }

   
}
