//
//  ViewController.swift
//  taxApp-sato
//
//  Created by 佐藤壮 on 2023/09/06.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var taxSwitchButton: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var prices: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "priceCell")
    }

    @IBAction func taxSwitchButton(_ sender: UISegmentedControl) {
        calculateTax()
    }
    @IBAction func addButton(_ sender: UIButton) {
        if let priceText = resultLabel.text, let price = Double(priceText) {
            prices.append(price)
            tableView.reloadData()
        }
    }
    
    @IBAction func totalButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showTotal", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTotal" {
            let destinationVC = segue.destination as! TotalTableViewController
            destinationVC.totalAmount = prices.reduce(0, +)
        }
    }
    
    func calculateTax() {
        guard let priceText = textField.text, let price = Double(priceText) else {
            return
        }
        let taxRate = taxSwitchButton.selectedSegmentIndex == 0 ? 0.10 : 0.08
        let taxAmount = price * taxRate
        let totalPrice = price + taxAmount
        resultLabel.text = String(totalPrice)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prices.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath)
        cell.textLabel?.text = String(prices[indexPath.row])
        return cell
    }
}

