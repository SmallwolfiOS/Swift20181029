//
//  ViewController.swift
//  SwiftUp
//
//  Created by baidu on 2018/10/30.
//  Copyright © 2018 mahp. All rights reserved.
//

import UIKit
// 屏幕的宽
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
// 屏幕的高
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initSubView();
        self.setupButton();
    }

    private func initSubView() {
        let view :UIView = UIView(frame:CGRect.init(x: 20, y: 100, width: SCREEN_WIDTH, height: SCREEN_HEIGHT));
        view.frame = CGRect.init(x: 30, y: 120, width: SCREEN_WIDTH-60, height: 50);
        view.backgroundColor = UIColor.red;
        view.tag = 1;
        view.layer.borderColor = UIColor.black.cgColor;
        view.layer.borderWidth = 1.0;
        view.layer.cornerRadius = 25;
        view.layer.masksToBounds = true;
        self.view.addSubview(view);
    }
    private func setupButton(){
        let btn = UIButton(frame: CGRect.init(x: 30, y:190, width: SCREEN_WIDTH-60, height:  50));
        btn.backgroundColor = UIColor.blue;
        btn.setTitle("按钮的标题", for: UIControl.State.normal);
        btn.addTarget(self, action:#selector(buttonClick) , for: UIControl.Event.touchUpInside);
        self.view.addSubview(btn);
        
        let btn1 = UIButton(frame: CGRect.init(x: 30, y:270, width: SCREEN_WIDTH-60, height:  50));
        btn1.backgroundColor = UIColor.blue;
        btn1.setTitle("按钮的标题", for: UIControl.State.normal);
        btn1.tag = 100;
        btn1.addTarget(self, action:#selector(button1Click) , for: .touchUpInside);
        self.view.addSubview(btn1);
        
    }
    @objc func buttonClick() {
        print("点击了按钮");
    }
    @objc func button1Click(btn:UIButton){
        print(btn.tag);
        print("这是点击了带参数的button");
        print("这是点击了带参数的button,butto的tag是\(btn.tag)",btn.tag);//哈哈哈，这样也可以，居然可以打印
        //这是点击了带参数的button,butto的tag是100 100
    }
}


