//
//  ChWeiboMainVC.swift
//  ChWeibo
//
//  Created by 乔腾龙 on 2017/3/19.
//  Copyright © 2017年 乔腾龙. All rights reserved.
//

import UIKit

class ChWeiboMainVC: UITabBarController {

    private lazy var composeBtn:UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: .normal)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: .highlighted)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let infoArray = [
            ["class":"ChWeiboHomeVC","title":"首页","image":"tabbar_home"],
            ["class":"ChWeiboMessageVC","title":"消息","image":"tabbar_message_center"],
            ["class":"UIViewController"],
            ["class":"ChWeiboDiscoverVC","title":"发现","image":"tabbar_discover"],
            ["class":"ChWeiboProfileVC","title":"我","image":"tabbar_profile"],
        ]
        
        var arrayM = [UIViewController]()
        for params in infoArray {
            arrayM.append(controllers(params: params))
        }
        
        self.viewControllers = arrayM
        
        setupComposeBtn()
    }
    
    //发布微博按钮添加到tabbar
    func setupComposeBtn() {
        let width = tabBar.bounds.width / CGFloat((viewControllers?.count)!) - 1.0
        composeBtn.frame = tabBar.bounds.insetBy(dx: width*2, dy: 0)
        self.tabBar .addSubview(composeBtn)
    }
    
}

extension ChWeiboMainVC{
    
      func controllers(params:[String:String]) -> UIViewController {
        
        guard let _ = params["class"],
            let title = params["title"],
            let image = params["image"],
            let vcs = NSClassFromString(Bundle.main.classNameWithNamespace(clasz:params["class"]!)) as? UIViewController.Type
            else {
                return UIViewController()
        }
        
        let vc  = vcs.init()
        vc.title = title
        let nav = ChWeiboNavigationVC(rootViewController: vc)
        
        // 设置tabbar 图片&字体颜色
        nav.tabBarItem.image = UIImage.init(named: image)
        nav.tabBarItem.selectedImage = UIImage.init(named: image + "_selected")?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .selected)
        
        return nav
        
        
    }
}
