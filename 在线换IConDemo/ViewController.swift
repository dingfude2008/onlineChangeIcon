//
//  ViewController.swift
//  在线换IConDemo
//
//  Created by 3irobotics on 2018/2/24.
//  Copyright © 2018年 SSC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var currentIndex: Int = 0
    
    // 1， 在系统跟目录加上需要更换图标的图片
    // 2， 在info.plist中设置需要更换图片的信息
    // 3， 添加扩展分类，通过runtime去掉更换图标的弹窗
    private var weathers = ["icon_i", "icon_h", "icon_r"]
    
    @IBAction func change(_ sender: Any) {
        let weather = self.weathers[currentIndex]
        self.setAppIconWithName(weather)
        currentIndex += 1
        currentIndex = currentIndex > 2 ? 0 : currentIndex
    }
    
    fileprivate func setAppIconWithName(_ iconName: String){
        if #available(iOS 10.3, *) {
            if UIApplication.shared.supportsAlternateIcons {
                print("支持更换图标！")
                UIApplication.shared.setAlternateIconName(iconName, completionHandler: { (error) in
                    if error != nil {
                        print("替换icon失败\(String(describing: error?.localizedDescription))")
                    }else{
                        print("更换图标成功")
                    }
                })
            }else {
                print("设备不支持更换图标")
            }
        } else {
            
        }
    }
    
}

