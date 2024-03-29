//
//  ViewController.swift
//  SwiftUp
//
//  Created by baidu on 2018/10/30.
//  Copyright © 2018 mahp. All rights reserved.
//

import UIKit
public func P(x:String){print(x)}
// 屏幕的宽
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
// 屏幕的高
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
class ViewController: UIViewController ,Vc1Delegate,Vc2Protocol{
    func doWhatIWhatYouDo(text: String) {
        print("到这里，已经执行了代理方法\(text)" );
    }
    func protocolFunction(text: String, _ unNamed: String) {
        print("到这里，已经执行了VCC2的代理方法\(text)  没有名字的参数\(unNamed)" );
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(Int8.max);
        print(Int16.max);
        
        initNavBar()
        initSubView();
        setupButton();
        initImageView();
        
        normalTest()
        
        sendNtf()
    }
    private func normalTest(){
        let laugh = "哈哈哈"
        let i :Int = 20
        print("\(laugh) 这样的笑\(i)次")
        
        var optionalInteger : Int?
        optionalInteger = 42
        print("optionalInteger的值是\(optionalInteger!)")
        
        var myString :String?
        myString = "Hello Swift!"
        if myString != nil{
            print(myString as Any)
        }else{
            print("myString 的值是 nil")
        }
        
        var string :String!
        string = "Hello Swift!"
        if string != nil{
            print(string)
        }else{
            print("string 的值是 nil")
        }
        var num :Int = 3;
        num += 1
        print("最后的结果是\(num)")
        
        let str = ""
        print(str.isEmpty ?"str 居然是空的":"非空")
        print("字符串的长度为\(str.count)")
        
        if myString!.contains("Hello"){
            print("包含hello")
        }else{
            print("不包含hello")
        }
        
        
        let swiftString = "hello swift"
        let arr = swiftString.components(separatedBy: " ");
        print(arr)
        print(swiftString[...(swiftString.index(swiftString.startIndex, offsetBy: 3))])
        
        print(swiftString.prefix(3))
        
        P(x: String(swiftString.suffix(3)))
        var mutableString:String = "这是一个可变字符串，可以改变的那种"
        mutableString = mutableString.replacingOccurrences(of: "，", with: " --this is insert character---")
        
        print(mutableString)
        
        let stringA = """
                        关关雎鸠，
                        在河之洲，
                        窈窕淑女，
                        君子好逑，
                      """
        print(stringA)
    
        let stringB = """
    予观夫巴陵胜状，在洞庭一湖。衔远山，吞长江，浩浩汤汤，横无际涯；朝晖夕阴，气象万千。此则岳阳楼之大观也，前人之述备矣。然则北通巫峡，南极潇湘，迁客骚人，多会于此，览物之情，得无异乎？
"""
        print(stringB)
        
        let a = ["1", "2", "3"]
        print("拼接字符串:", a.joined(separator: "-"))
        let s = " / 2 3 4 ? / "
        print("空格替换成-:", s.replacingOccurrences(of: " ", with: "-"))
        print("空格过滤掉:", s.replacingOccurrences(of: " ", with: ""))
        print("去掉首尾空格:", s.trimmingCharacters(in: .whitespaces))
        print("分割:", s.components(separatedBy: "/"))

        for c in mutableString {
            print(c)
        }
        print(mutableString.count)
        print(mutableString.utf8.count)
        print(mutableString.utf16.count)
        
        let stringC = "<<<Hello>>>"
        let indexStartOfText = stringC.index(stringC.startIndex, offsetBy:3)
        let indexEndOfText = stringC.index(stringC.endIndex, offsetBy:-3)
        
        let subString1 = stringC[indexStartOfText...] // "Hello>>>"
        let subString2 = stringC[..<indexEndOfText]  // "<<<Hello"
        let subString3 = stringC[indexStartOfText..<indexEndOfText] // "Hello"
        print(subString1 + "\n"  + subString2 + "\n" + subString3)
        mutableString.append("F")
        //数组///////////////////////////////////////////////////////////////////////////
        var intArr:Array = [0,2,3]
        intArr.insert(1, at: 1)
        for number in intArr {
            print(number)
        }
//        let someArray = [Any]()
        var someArray = [Any](repeating: 0, count: 10)
        var intArray = [Int].init(repeating: 0, count: 1)
        
        intArray.append(3)
        intArray.append(5)
        intArray[intArray.count - 1] = 1
        intArray.remove(at: 2)
        let firstInt = intArray.first
        intArray += [30]
        for (index,item) in intArray.enumerated() {
            print("第\(index)个元素是\(item)")
        }
        let intArrayB = [Int](repeating: 0, count: 10)
        intArray += intArrayB
        let arrayC = intArray + intArrayB
        print(intArray)
        
        //字典///////////////////////////////////////////////////////////////////////////
        var mutableDict:[Int:String] = [1:"One",2:"Two",3:"Three"]
        mutableDict[1] = "four"
        let oldValue = mutableDict.updateValue("new One", forKey: 1)
        let removeValue = mutableDict.removeValue(forKey: 2)
        print(mutableDict)
        
        print(testFunc(paramter: "name"))
        print(testFunc1(firstName: "ma", lastName: "haiping"))
        print(tupleFunc(array: [1,3,5,20,8,9]).min )
        
        var x = 1 ,y = 5
        swapTwoInts(&x, &y)
        print("x 现在的值 \(x), y 现在的值 \(y)")
        let addition: (Int, Int) -> Int = sum
        print("输出结果: \(addition(40, 89))")
        
        
        enum DaysOfWeek {
            case Sunday
            case Monday
            case TUESDAY
            case WEDNESDAY
            case THURSDAY
            case FRIDAY
            case Saturday
        }
        var weekDay = DaysOfWeek.TUESDAY
        weekDay = .THURSDAY
        switch weekDay {
            case .Sunday:
                print("星期日")
            case .Monday:
                print("星期一")
            case .TUESDAY:
                print("星期二")
            case .WEDNESDAY:
                print("星期三")
            case .THURSDAY:
                print("星期四")
            case .FRIDAY:
                print("星期五")
            case .Saturday:
                print("星期六")
        }
        enum Month: Int {
            case January = 1, February, March, April, May, June, July, August, September, October, November, December
        }
        
        let yearMonth = Month.May.rawValue
        print("数字月份为: \(yearMonth)。")
        
        class father {
            func show() {
                print("这是父类")
            }
        }
        class son:father{
           override func show() {
                super.show()//这样调用父类的方法 
                print("这是子类")
            }
            func showTime() {
                let dateFormatter = DateFormatter()
                let timeZone = TimeZone.init(identifier: "Asia/Beijing")
                dateFormatter.timeZone = timeZone
                dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
                dateFormatter.dateStyle = .medium
                
                /*
                注释: (timeStyle)时间格式 | (dateStyle)日期格式
                DateFormatter.Style.none
                空白的，什么都不显示
                DateFormatter.Style.short
                例如：下午3:00 | 18/5/12
                DateFormatter.Style.medium
                例如：下午3:00:00 | 2018年5月12日
                DateFormatter.Style.long
                例如：GMT +8下午3:00:00 | 2018年5月12日
                DateFormatter.Style.full
                例如：中国标准时间下午3:00:00 | 2018年5月12日 星期日
                formatter.timeStyle = DateFormatter.Style.full//时间格式
                formatter.dateStyle = DateFormatter.Style.long//ss//日期格式
                */
                let localString = dateFormatter.string(from: Date())
                print("当前时间是---\(localString)")
            }
            deinit {
                print("子类释放了")
            }
        }
        
        let superClass = father();
        superClass.show()
        let subClass = son()
        subClass.show()
        subClass.showTime()
        
        
    }
    func testFunc(paramter:String) -> String {
        return(paramter)
    }
    func testFunc1(firstName:String,lastName:String) -> String {
        return("myName is " + firstName + lastName);
    }
    func tupleFunc(array:[Int]) -> (min:Int,Max:Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array {
            if value < currentMin{
                currentMin = value
            }else if value > currentMax{
                currentMax = value
            }
        }
        return(currentMin,currentMax)
    }
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    func sum(a: Int, b: Int) -> Int {
        return a + b
    }
    
    
    
    private func initNavBar (){
        let titleView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 136, height: 44))
        titleView.backgroundColor = UIColor.red
        self.navigationItem.titleView = titleView
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "right", style: UIBarButtonItem.Style.plain, target: self, action:#selector(rightItemClick))
    }
    @objc func rightItemClick(){
        print("点击了右上角的按钮")
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
        
        let vc = ViewController2();
        vc.delegate = self;
        self.present(vc, animated: true, completion: nil);()
        
        
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


