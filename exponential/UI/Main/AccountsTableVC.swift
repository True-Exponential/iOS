//
//  AccountsTableVC.swift
//  LinkDemo-Swift
//
//  Created by Omer Paran on 05/12/2021.
//  Copyright © 2021 True-Exp. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class AccountsTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {Globals.accounts.NumAccountTypes}
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Globals.accounts.getAccountGroupCaption(section)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Globals.accounts.getNumAccountType(section)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        if let label = header.textLabel {
            label.textColor = UIColor.blue
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.frame = header.frame
            //label.textAlignment = NSTextAlignment.center
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let plaidAccount = Globals.accounts[indexPath.section, indexPath.row] {
            if plaidAccount.getTransactions().isEmpty {
                let dispatch = DispatchGroup()
                dispatch.enter()
                
                Globals.plaidHandler.loadTransactions(dispatch, [plaidAccount.getId()])
                
                dispatch.notify(queue: .main) {
                    TransactionsTableVC.account = plaidAccount
                    if !plaidAccount.getTransactions().isEmpty {
                        self.performSegue(withIdentifier: "switchToTransactionsView", sender: plaidAccount)
                    }
                }
            }
            else {
                TransactionsTableVC.account = plaidAccount
                self.performSegue(withIdentifier: "switchToTransactionsView", sender: plaidAccount)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if cell.detailTextLabel == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        }
        
        if let plaidAccount = Globals.accounts[indexPath.section, indexPath.row] {
            cell.textLabel!.text = plaidAccount.getName()
            cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
            cell.detailTextLabel!.text = "Balance: " + plaidAccount.balance
        }
        
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

}
