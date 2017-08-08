//
//  Utils.swift
//  ActionPickerUtils
//
//  Created by Anton Plebanovich on 7/4/17.
//  Copyright © 2017 Anton Plebanovich. All rights reserved.
//

import UIKit

#if COCOAPODS
    import ActionSheetPicker_3_0
#else
    import CoreActionSheetPicker
#endif

private var origin: UIView? {
    if let origin = UIApplication.shared.keyWindow {
        return origin
    } else if let origin = UIApplication.shared.delegate?.window ?? nil {
        return origin
    } else {
        return nil
    }
}

/// Show date picker
/// - parameter title: Picker title
/// - parameter mode: Picker mode
/// - parameter date: Selected date
/// - parameter midDate: Minimum date border
/// - parameter maxDate: Maximum date border
/// - parameter showTodayButton: Show button that picks todays date?
/// - parameter completion: Picked date
public func g_showDatePicker(title: String? = nil, mode: UIDatePickerMode = .dateAndTime, date: Date? = nil, minDate: Date? = nil, maxDate: Date? = nil, showTodayButton: Bool = false, completion: @escaping (Date) -> ()) {
    let pickerVc = ActionSheetDatePicker(title: title, datePickerMode: mode, selectedDate: date ?? Date(), doneBlock: { picker, date, originView in
        completion(date as! Date)
    }, cancel: nil, origin: origin)!
    
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
/// - parameter completion: Picked value
public func g_showStringsPicker(title: String? = nil, values: [String], selected: Int? = nil, completion: @escaping (Int, String) -> ()) {
    let selected = selected ?? 0
    guard !values.isEmpty, selected < values.count else { return }
    
    let pickerVc = ActionSheetStringPicker(title: title, rows: values, initialSelection: selected, doneBlock: { picker, index, string in
        completion(index, values[index])
    }, cancel: nil, origin: origin)!
    
    pickerVc.toolbarBackgroundColor = UINavigationBar.appearance().barTintColor
    pickerVc.titleTextAttributes = UINavigationBar.appearance().titleTextAttributes
    pickerVc.tapDismissAction = .success
    pickerVc.show()
}
