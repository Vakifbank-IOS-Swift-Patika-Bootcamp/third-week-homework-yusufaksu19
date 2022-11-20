//
//  ViewController.swift
//  ThirdWeek-ThirdHomework
//
//  Created by Yusuf Aksu on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var quoteLabel: UILabel!
  var quote: String?

  override func viewDidLoad() {
    super.viewDidLoad()
    Client.getQuotes { [weak self] quote, error in
      print(self!.quote)
      guard let newQuote = quote else { return }
                 print(newQuote)
      self.quote = newQuote.en
    }
    quoteLabel.text = self.quote
  }


  @IBAction func changeQuote(_ sender: Any) {
    Client.getQuotes { quote, error in
      guard let newQuote = quote else { return }
                 print(newQuote)
      self.quote = newQuote.en
    }

    quoteLabel.text = quote ?? "bozuk"
  }
}

