//
//  ViewController.swift
//  ActionPickerUtils
//
//  Created by Anton Plebanovich on 07/24/2017.
//  Copyright (c) 2017 Anton Plebanovich. All rights reserved.
//

import UIKit
import ActionPickerUtils


class ViewController: UIViewController {

    //-----------------------------------------------------------------------------
    // MARK: - @IBActions
    //-----------------------------------------------------------------------------
    
    @IBAction private func onSelectDateTap(_ sender: UIButton) {
        g_showDatePicker { date in
            sender.setTitle(date.description, for: .normal)
        }
    }
    
    @IBAction private func onSelectStringTap(_ sender: UIButton) {
        g_showStringsPicker(values: ["Hello", "World"]) { index, string in
            sender.setTitle(string, for: .normal)
        }
    }
}
