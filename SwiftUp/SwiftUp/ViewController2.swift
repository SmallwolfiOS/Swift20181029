//
//  ViewController2.swift
//  SwiftUp
//
//  Created by baidu on 2018/11/1.
//  Copyright © 2018 mahp. All rights reserved.
//

import UIKit
protocol Vc2Protocol {
    func protocolFunction(text:String,_ unNamed:String);
}

class ViewController2: UIViewController {
    var delegate :Vc2Protocol?;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction));
        self.view.addGestureRecognizer(tap);
        self.initButtons(num: 6);
        
    }
    
    @objc func tapAction(tap:UITapGestureRecognizer) -> Void {
        self.delegate?.protocolFunction(text: "这是有名字的参数", "这是没有名字的参数，屌不屌");
    }

    
    func initButtons(num:Int) -> Void {
        for i in 0...num{
            let btn = UIButton.init(frame: CGRect.init(x: 30, y: 40 + i * 80, width: Int(SCREEN_WIDTH - 60), height: 50));
            btn.backgroundColor = UIColor.blue;
            btn.tag = i;
            btn.addTarget(self, action: #selector(btnClick), for: UIControl.Event.touchUpInside);
            self.view .addSubview(btn);
        }
    }
    @objc func btnClick(btn:UIButton) -> Void {
        print(btn.tag);
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

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
