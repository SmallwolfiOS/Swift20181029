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
class ViewController: UIViewController ,Vc1Delegate{
    func doWhatIWhatYouDo(text: String) {
        print("到这里，已经执行了代理方法\(text)" );
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.initSubView();
        self.setupButton();
        self.initImageView();
        
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
        let vc = ViewController1();
        vc.littleStr = "这是第二个页面";
        vc.delegate = self;
        self.present(vc, animated: true, completion: nil);()
    }
    @objc func button1Click(btn:UIButton){
        print(btn.tag);
        print("这是点击了带参数的button");
        print("这是点击了带参数的button,butto的tag是\(btn.tag)",btn.tag);//哈哈哈，这样也可以，居然可以打印
        //这是点击了带参数的button,butto的tag是100 100
    }
    func initImageView() {
        let imageView = UIImageView.init(frame: CGRect.init(x: 30, y: 360, width: SCREEN_WIDTH-60, height: SCREEN_WIDTH-60));
        imageView.backgroundColor = UIColor.red;
        imageView.contentMode = UIView.ContentMode.scaleToFill;
        imageView.image = UIImage.init(named: "WechatIMG4");
        imageView.isUserInteractionEnabled = true;
        imageView.tag = 99;
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(imageViewClick));
        imageView.addGestureRecognizer(tap);
        tap.numberOfTapsRequired = 1;
        self.view.addSubview(imageView);
    }
    @objc func imageViewClick(tap:UITapGestureRecognizer){
        print("手势点击了图片\(String(describing: tap.view?.tag))");
    }
}


