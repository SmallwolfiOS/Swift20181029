//
//  AudioViewController.swift
//  SwiftUp
//
//  Created by Apple on 2019/10/23.
//  Copyright © 2019 mahp. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

var appHasMicAccess = true//记录麦克风权限

class AudioViewController: UIViewController {
    var bottomView :UIView = UIView()
    var topView :UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        print(self.view.frame)
        
        self.initSubView()
        self.layoutWithSnapKit()
    }
    
    private func initSubView(){
        print("初始化子视图")
        bottomView = UIView.init()
        bottomView.backgroundColor = UIColor.red
        self.view.addSubview(bottomView)
        
        topView = UIView.init()
        topView.backgroundColor = UIColor.green
        self.view.addSubview(topView)
        
    }
    private func layoutWithSnapKit(){
        bottomView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.height.equalTo(10)
        }
        topView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.top.equalTo(self.view)
            make.height.equalTo(SCREEN_HEIGHT - 44 - 34)//iOS13的模态出来的vc的尺寸是这个，但是地步还会有一点
        }
    }
    private func getAudioSession(){
        let session = AVAudioSession.sharedInstance()//  先获取一个 AVAudioSession 的实例
        do {
            try session.setCategory(AVAudioSession.Category.playAndRecord, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
            try session.setActive(true, options: AVAudioSession.SetActiveOptions.init())
            session.requestRecordPermission { (isGranted) in
                if isGranted {
                    appHasMicAccess = true
                }else{
                    appHasMicAccess = false
                }
            }
        } catch let error as NSError {
                        print("AVAudioSession configuration error: \(error.localizedDescription)")

        }
    }
}
