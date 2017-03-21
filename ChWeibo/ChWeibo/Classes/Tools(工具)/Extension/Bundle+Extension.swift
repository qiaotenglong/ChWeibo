//
//  Bundle+Extension.swift
//  ChWeibo
//
//  Created by 乔腾龙 on 2017/3/21.
//  Copyright © 2017年 乔腾龙. All rights reserved.
//

import Foundation

// Bundle的扩展方法
extension Bundle{
    // 命名空间
    var namespace:String{
        return self.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    //返回命名空间+“.”+类名
    func classNameWithNamespace(clasz:String) -> String {
        return self.namespace + "." + clasz
    }
}
