//
//  TransactionsTableVC.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 28/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import UIKit

class TransactionsTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Transaction")

        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TransactionsTableVC.account!.getTransactions().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Transaction", for: indexPath)
        if cell.detailTextLabel == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Transaction")
        }
        
        let tranaction = TransactionsTableVC.account!.getTransactions()[indexPath.row]
        
        cell.textLabel!.text = tranaction.getName()
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        
        cell.detailTextLabel!.text = tranaction.categoryDesc
        
        //StrUtils.showNumberWithCurrency(number: tranaction.getAmount(), currencyCode: tranaction.getCurrencyCode())
        
/*        cell.detailTextLabel!.text = StrUtils.showNumberWithCurrency(number: tranaction.getAmount(), currencyCode: tranaction.getCurrencyCode()) */
 
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    static public var account : AccountEx? = nil
    
    //static public var account

}
