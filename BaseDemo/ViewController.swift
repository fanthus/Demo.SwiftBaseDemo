//
//  ViewController.swift
//  BaseDemo
//
//  Created by xiushan.fan on 29/7/15.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var fan:FanModel! = FanModel()
    var fanArray:Array<FanModel>! = Array()
    
    var tableView:UITableView! = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height), style: UITableViewStyle.Grouped)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for var index:Int = 0; index < 3;index++ {
            var tFan:FanModel! = FanModel()
            tFan.age = index
            fanArray.append(tFan)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fanArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId : String = "fancell"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        let fanModel = fanArray[indexPath.row]
        cell?.textLabel?.text = fanModel.name + String(fanModel.age!)
        return cell!;
    }
}

