//
//  ViewController2.swift
//  SwiftUp
//
//  Created by baidu on 2018/11/1.
//  Copyright © 2018 mahp. All rights reserved.
//

import UIKit


protocol Vc2Protocol:class {//这里，我们必须让协议继承:class，从而使用一个类协议将代理属性标记为weak。
    func protocolFunction(text:String,_ unNamed:String);
}

typealias funcBlock = ()->()
typealias funcBlockA = (Int,Int)->String


class ViewController2: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    var delegate :Vc2Protocol?
    var tableView:UITableView?
    var dataSource:NSMutableArray = ["iOS","安卓","java","phyton","swift","Oojective-C","C++","linux","PHP","H5","JavaScript","C"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
//        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
//        self.view.addGestureRecognizer(tap);
        self.initButtons(num: 1)
        self.initTableView()
        self.tableView?.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            print("刷新了数据")
        });
        self.tableView?.mj_header .beginRefreshing();
    }
    
    @objc func tapAction(tap:UITapGestureRecognizer) -> Void {
        self.delegate?.protocolFunction(text: "这是有名字的参数", "这是没有名字的参数，屌不屌")
    }

    
    func initButtons(num:Int) -> Void {
        for i in 0..<num{
            let btn = UIButton.init(frame: CGRect.init(x: 30, y: 34 + i * 80, width: Int(SCREEN_WIDTH - 60), height: 50));
            btn.backgroundColor = UIColor.blue;
            btn.tag = i;
            btn.setTitle("这是创建的第\(i)个按钮", for: UIControl.State.normal)
            btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
            btn.addTarget(self, action: #selector(btnClick), for: UIControl.Event.touchUpInside)
            self.view .addSubview(btn)
        }
    }
    @objc func btnClick(btn:UIButton) -> Void {
        print(btn.tag);
        self.tableView?.selectRow(at:NSIndexPath.init(row: 0, section: 0) as IndexPath, animated: true, scrollPosition: UITableView.ScrollPosition.top)
    }
    
    /*   这是在swift 4.0新增加的方法
    OC中常用的普通for循环 for（int i=0；i<10;i++）{}在Swift3.0已经移除掉了，现在Swift用的for in 循环很具有Swift特色，举例如下：
    for i in 0...10 {
    //0...10表示包含头尾的0到10之间所有的整数
    //0..<10表示包含头不包含尾的0到9之间所有的整数
    //0...10这种条件区间内不能出现任何的空格
    }
    //如果不关心循环本身的索引，可以直接用下划线如下
    for _ in 0...10 {
    }
    //在遍历数组的时候，Swift还提供了一种特别方便的方式（利用元祖）
    for (index,value) in array.enumerated() {
    //index是下标，value是值
    //这样使得遍历数组能写的更加简洁优雅
    }*/

    func initTableView() -> Void {
        let tableView = UITableView.init(frame: CGRect.init(x: 30, y: 100, width: SCREEN_WIDTH - 60, height: SCREEN_WIDTH - 100))
        tableView.backgroundColor = UIColor.lightGray;
        tableView.delegate = self as UITableViewDelegate;
        tableView.dataSource = self as UITableViewDataSource
        tableView .register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifer")
        self.tableView = tableView;
        self.view.addSubview(tableView)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cellIdentifer"
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        cell.textLabel?.text = dataSource.object(at: indexPath.row) as?String
//        cell.textLabel?.text = "这就是第\(indexPath.row)个cell"
        cell.selectionStyle = UITableViewCell.SelectionStyle.none;
        return cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("哇塞，你居然点击了第\(indexPath.row)个cell")
        let vc = ViewController3()
        self.present(vc, animated: true, completion: nil)
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
