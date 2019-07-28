//
//  Task.swift
//  taskapp
//
//  Created by 佐々木駿 on 2019/06/29.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import RealmSwift

class Task: Object {
    @objc dynamic var id = 0
    // タイトル
    @objc dynamic var title = ""
    
    // 内容
    @objc dynamic var contents = ""
    
    //カテゴリー
    @objc dynamic var category = ""
    
    /// 日時
    @objc dynamic var date = Date()
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}
