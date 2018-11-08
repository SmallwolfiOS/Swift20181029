//
//  ViewController3.swift
//  SwiftUp
//
//  Created by baidu on 2018/11/8.
//  Copyright © 2018 mahp. All rights reserved.
//

import UIKit

class ViewController3: UIViewController,UITableViewDelegate,UITableViewDataSource {
   private var tableView :UITableView!
    var dataSource:NSMutableArray = ["iOS","安卓","java","phyton","swift","Oojective-C","C++","linux","PHP","H5","JavaScript","C"]
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self .createTableView()
    }
    
    
    func createTableView()  {
        let tableView = UITableView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: SCREEN_WIDTH, height: SCREEN_HEIGHT)), style: UITableView.Style.plain)
        tableView.backgroundColor = UIColor.white
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedRowHeight = 0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifer")
        self.tableView = tableView
        self.view .addSubview(tableView)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifer", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dataSource .add(self.dataSource.object(at: indexPath.row))
        tableView .reloadData()
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
