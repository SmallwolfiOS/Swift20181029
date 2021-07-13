//
//  ViewController1.swift
//  SwiftUp
//
//  Created by baidu on 2018/10/30.
//  Copyright © 2018 mahp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
protocol Vc1Delegate:class {//添加class是为了让代理变weak
    func doWhatIWhatYouDo(text:String)
}
class ViewController1: UIViewController {
    var delegate : Vc1Delegate?;
    let userNameTf :UITextField = UITextField()
    var littleStr:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 这是一个model出来的页面
        print(self.littleStr);
        self.view.backgroundColor = UIColor.white;
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction));
        self.view.addGestureRecognizer(tap);
        
        let bag = DisposeBag()
        var button = UIButton.init()
        
            button.rx.tap
                .subscribe(onNext: { [weak self] in
                    print("点了,小鸡炖蘑菇")
                    self?.view.backgroundColor = UIColor.orange
                })
                .disposed(by: DisposeBag.init())
        
//        userNameTf = UITextField.init()
//        self.view.addSubview(userNameTf)
        
        
        
    }
    @objc func tapAction(){
        self.delegate?.doWhatIWhatYouDo(text:"这就是 传入的有名字的参数");
        self.dismiss(animated: true, completion: nil);
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
