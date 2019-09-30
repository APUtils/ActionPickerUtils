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
    
    @IBAction private func onSelectMultipleStrings(_ sender: UIButton) {
        let minutes = Array(0...59).map { "\($0)m" }
        let hours = Array(0...23).map { "\($0)h" }
        let days = Array(0...31).map { "\($0)d" }
        let values = [days, hours, minutes]
        g_showMultipleStringsPicker(title: "Title", values: values) { indexes, titles in
            sender.setTitle(titles.joined(separator: " - "), for: .normal)
        }
    }
    
    @IBAction private func onLeftTap(_ sender: UIButton) {
        g_showDatePicker { date in
            sender.setTitle(date.description, for: .normal)
        }
    }
    
    @IBAction private func onRightTap(_ sender: UIButton) {
        g_showDatePicker { date in
            sender.setTitle(date.description, for: .normal)
        }
    }
}
