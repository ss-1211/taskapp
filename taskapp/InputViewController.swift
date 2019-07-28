//
//  InputViewController.swift
//  taskapp
//
//  Created by 佐々木駿 on 2019/06/25.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextview: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    let realm = try! Realm()
    let categoryArray = [["打ち合わせ", "ToDo", "遊び", "その他"]]
    var categoryText: String = ""
    var task: Task!   // 追加する

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        self.view.addGestureRecognizer(tapGesture)
        
        titleTextField.text = task.title
        contentsTextview.text = task.contents
        datePicker.date = task.date
        
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }

        // Do any additional setup after loading the view.
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.task.title = self.titleTextField.text!
            self.task.contents = self.contentsTextview.text
            self.task.date = self.datePicker.date
            self.task.category = categoryText
            self.realm.add(self.task, update: true)
        }
        
        super.viewWillDisappear(animated)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compos = categoryArray[component]
        return compos.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = categoryArray[component][row]
        return item
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = categoryArray[component][row]
        let row = categoryPicker.selectedRow(inComponent: 0)
        let selectedRow = self.pickerView(categoryPicker, titleForRow: row, forComponent: 0)
        print(selectedRow)
        categoryText = selectedRow!
    }
    
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
