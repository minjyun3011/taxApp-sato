//
//  TotalTableViewController.swift
//  taxApp-sato
//
//  Created by 佐藤壮 on 2023/09/06.
//

import UIKit

class TotalTableViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    var totalAmount: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "￥" + String(format: "%.2f", totalAmount)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
}
