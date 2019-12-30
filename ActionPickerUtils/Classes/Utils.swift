//
//  Utils.swift
//  ActionPickerUtils
//
//  Created by Anton Plebanovich on 7/4/17.
//  Copyright © 2017 Anton Plebanovich. All rights reserved.
//

import UIKit

private extension UIView {
    /// Returns all view's subviews
    var allSubviews: [UIView] {
        var allSubviews = self.subviews
        allSubviews.forEach { allSubviews.append(contentsOf: $0.allSubviews) }
        return allSubviews
    }
}

fileprivate var _origin: UIView? {
    let window: UIWindow?
    if let _window = UIApplication.shared.keyWindow {
        window = _window
    } else if let _window = UIApplication.shared.delegate?.window ?? nil {
        window = _window
    } else {
        window = nil
    }
    
    if UIDevice.current.userInterfaceIdiom == .pad {
        // Try to find pressed button on iPads
        return window?.allSubviews
            .compactMap { $0 as? UIButton }
            .first { $0.isHighlighted }
    } else {
        return window
    }
}

/// Show date picker
/// - parameter title: Picker title
/// - parameter mode: Picker mode
/// - parameter date: Selected date
/// - parameter midDate: Minimum date border
/// - parameter maxDate: Maximum date border
/// - parameter showTodayButton: Show button that picks todays date?
/// - parameter origin: Origin to show popup from on iPads. If `nil` will be tried to detect automatically.
/// - parameter completion: Picked date
public func g_showDatePicker(title: String? = nil,
                             mode: UIDatePicker.Mode = .dateAndTime,
                             date: Date? = nil,
                             minDate: Date? = nil,
                             maxDate: Date? = nil,
                             showTodayButton: Bool = false,
                             origin: UIView? = nil,
                             cancel: (() -> Void)? = nil,
                             completion: @escaping (Date) -> ()) {
    
    let pickerVc = ActionSheetDatePicker(title: title, datePickerMode: mode, selectedDate: date ?? Date(), doneBlock: { picker, date, originView in
        completion(date as! Date)
    }, cancel: { _ in cancel?() }, origin: origin ?? _origin)!
    
    pickerVc.minimumDate = minDate
    pickerVc.maximumDate = maxDate
    pickerVc.toolbarBackgroundColor = UINavigationBar.appearance().barTintColor
    pickerVc.titleTextAttributes = UINavigationBar.appearance().titleTextAttributes
    pickerVc.tapDismissAction = .success
    
    if showTodayButton {
        pickerVc.addCustomButton(withTitle: "Today", value: Date())
    }
    
    pickerVc.show()
}

/// Show date and time picker
/// - parameter title: Picker title
/// - parameter values: Values to pick
/// - parameter selected: Selected index
/// - parameter origin: Origin to show popup from on iPads. If `nil` will be tried to detect automatically.
/// - parameter completion: Picked value
public func g_showStringsPicker(title: String? = nil, values: [String], selected: Int? = nil, origin: UIView? = nil, completion: @escaping (Int, String) -> ()) {
    let selected = selected ?? 0
    guard !values.isEmpty else {
        print("ActionPickerUtils: Values are empty")
        return
    }
    guard selected < values.count else {
        print("ActionPickerUtils: Incorrect selected value \(selected). Must be equal to values count '\(values.count)'")
        return
    }
    
    let pickerVc = ActionSheetStringPicker(title: title, rows: values, initialSelection: selected, doneBlock: { picker, index, string in
        completion(index, values[index])
    }, cancel: nil, origin: origin ?? _origin)!
    
    pickerVc.toolbarBackgroundColor = UINavigationBar.appearance().barTintColor
    pickerVc.titleTextAttributes = UINavigationBar.appearance().titleTextAttributes
    pickerVc.tapDismissAction = .success
    pickerVc.show()
}

/// Show date and time picker
/// - parameter title: Picker title
/// - parameter values: Values to pick
/// - parameter selected: Selected index
/// - parameter origin: Origin to show popup from on iPads. If `nil` will be tried to detect automatically.
/// - parameter completion: Picked value
public func g_showMultipleStringsPicker(title: String? = nil, values: [[String]], selected: [Int]? = nil, origin: UIView? = nil, completion: @escaping ([Int], [String]) -> ()) {
    guard !values.isEmpty else {
        print("ActionPickerUtils: Values are empty")
        return
    }
    guard values.reduce(true, { $0 && !$1.isEmpty }) else {
        print("ActionPickerUtils: Value must not be an empty array")
        return
    }
    let selected = selected ?? values.map { _ in 0 }
    guard selected.count == values.count else {
        print("ActionPickerUtils: Incorrect selected value \(selected.count). Must be equal to values count '\(values.count)'")
        return
    }
    for (index, selectedRow) in selected.enumerated() {
        if values[index].count <= selectedRow {
            print("ActionPickerUtils: Incorrect selected value '\(selectedRow)' for index '\(index)'. Only '\(values[index].count)' elements available.")
            return
        }
    }
    
    let pickerVC = ActionSheetMultipleStringPicker(title: title, rows: values, initialSelection: selected, doneBlock: { _, indexes, values in
        guard let indexes = indexes as? [Int] else {
            print("ActionPickerUtils: Incorrect retun format for indexes")
            return
        }
        guard let values = values as? [String] else {
            print("ActionPickerUtils: Incorrect retun format for values")
            return
        }
        
        completion(indexes, values)
        
    }, cancel: nil, origin: origin ?? _origin)!
    
    pickerVC.toolbarBackgroundColor = UINavigationBar.appearance().barTintColor
    pickerVC.titleTextAttributes = UINavigationBar.appearance().titleTextAttributes
    pickerVC.tapDismissAction = .success
    pickerVC.show()
}
