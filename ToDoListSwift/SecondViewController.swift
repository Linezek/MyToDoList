//
//  SecondViewController.swift
//  ToDoListSwift
//
//  Created by Antoine Galpin on 07/09/2016.
//  Copyright © 2016 Antoine Galpin. All rights reserved.
//

import UIKit

var myItemList = [String]()

class SecondViewController: UIViewController {

    @IBOutlet weak var textFielditem: UITextField!
    
    @IBAction func buttonAddItem(sender: AnyObject) {
        //valider que le text est bon
        //remplir le text
        //nettoyer le champ text
        
        
        if (textFielditem.text?.characters.count > 0) {
            myItemList.append(textFielditem.text!);
            textFielditem.text = "";
            self.view.endEditing(true);
            print(myItemList);
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleButton: UIButton = UIButton(frame: CGRectMake(0, 0, 100, 32))
        titleButton.setTitle("MyToDoList", forState: UIControlState.Normal)
        titleButton.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 25.0)
        titleButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        //titleButton.addTarget(self, action: "TitlePressed", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.titleView = titleButton
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}

