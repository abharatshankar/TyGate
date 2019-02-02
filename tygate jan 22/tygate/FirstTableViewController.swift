//
//  FirstTableViewController.swift
//  SJSegmentedScrollView
//
//  Created by Subins Jose on 13/06/16.
//  Copyright © 2016 Subins Jose. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    // MARK: - Table view data source

	override func viewDidLoad() {
		super.viewDidLoad()

		refreshControl?.addTarget(self,
		                          action: #selector(handleRefresh(_:)),
                                  for: UIControl.Event.valueChanged)
	}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView{
            statusBar.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = false
    }
	@objc func handleRefresh(_ refreshControl: UIRefreshControl) {

		self.perform(#selector(self.endRefresh), with: nil, afterDelay: 1.0)
	}

	@objc func endRefresh() {

		refreshControl?.endRefreshing()
	}

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        let cell : nearByCellTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "nearByCellTableViewCell", for: indexPath) as? nearByCellTableViewCell)!
        
        
       // cell.textLabel?.text = "Row " + String((indexPath as NSIndexPath).row)
        
        return cell
    }
    
    
    
    func viewForObserve() -> UIView{
        
        return self.tableView
    }
}
