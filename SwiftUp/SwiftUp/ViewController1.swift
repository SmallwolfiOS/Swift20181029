//
//  ViewController1.swift
//  SwiftUp
//
//  Created by baidu on 2018/10/30.
//  Copyright © 2018 mahp. All rights reserved.
//

import UIKit
protocol Vc1Delegate {
    func doWhatIWhatYouDo()
}
class ViewController1: UIViewController {
    var delegate : Vc1Delegate?;
    var littleStr:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 这是一个model出来的页面
        print(self.littleStr);
        self.view.backgroundColor = UIColor.white;
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction));
        self.view.addGestureRecognizer(tap);
    }
    @objc func tapAction(){
        self.delegate?.doWhatIWhatYouDo();
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
