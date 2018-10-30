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
        
    }
    @objc func buttonClick() {
        print("点击了按钮");
    }
}

