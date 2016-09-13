//
//  FirstViewController.swift
//  ToDoListSwift
//
//  Created by Antoine Galpin on 07/09/2016.
//  Copyright © 2016 Antoine Galpin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet weak var myTableView: UITableView!
    var filteredListItems = [String]();
    var resultSearchController = UISearchController();
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            myItemList.removeAtIndex(indexPath.row);
            myTableView.reloadData();
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.active) {
            return self.filteredListItems.count;
        }else {
        
            return myItemList.count;
        }
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let toDoListCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "toDoListCell");
        
        if (self.resultSearchController.active) {
        
        toDoListCell.textLabel?.text = filteredListItems[indexPath.row]
        } else {
        toDoListCell.textLabel?.text = myItemList[indexPath.row];
        }
        return toDoListCell;
    }

    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear");
        myTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let titleButton: UIButton = UIButton(frame: CGRectMake(0, 0, 100, 32))
        titleButton.setTitle("MyToDoList", forState: UIControlState.Normal)
        titleButton.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 25.0)
        titleButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        //titleButton.addTarget(self, action: "TitlePressed", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.titleView = titleButton
        
        
        self.resultSearchController = UISearchController(searchResultsController: nil);
        self.resultSearchController.searchResultsUpdater = self;
        self.resultSearchController.dimsBackgroundDuringPresentation = false;
        self.resultSearchController.searchBar.sizeToFit();
        self.myTableView.tableHeaderView = self.resultSearchController.searchBar;
        self.myTableView.reloadData();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredListItems.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (myItemList as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredListItems = array as! [String];
        self.myTableView.reloadData();
    }
    
    @IBAction func TitlePressed(sender: UIButton) {
        print("Vea Software")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

