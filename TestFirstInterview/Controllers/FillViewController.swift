//
//  FillViewController.swift
//  TestFirstInterview
//
//  Created by Guerson on 5/31/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import UIKit

class FillViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var subjectPicker: UIPickerView!
    @IBOutlet weak var switchTermsAndCond: UISwitch!
    @IBOutlet weak var termsAndCondsTextField: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backToMain: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var contentHeight: NSLayoutConstraint!
    
    
    var agreement = false
    var delegate : FillViewControllerDelegate?
    var editingInf = false
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        if editingInf {
            setSavedData()
        } else {
            setViewElements()
        }
        
    }
    
    private func setViewElements() {
        termsAndCondsTextField.isHidden = true
        saveButton.isHidden = true
        switchTermsAndCond.isOn = false
    }
    
    
    @IBAction func dismissItself(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        let selectedCustomDate = CurrentCustomDate().dateToCustom(date: datePicker.date)
        let birthday = BirthDay(day: selectedCustomDate.day, month: selectedCustomDate.month, year: selectedCustomDate.year)
        SignUpManager.shared.person.birthDay = birthday
        saveButtonShowness()
    }
    
    @IBAction func nameDidEnd(_ sender: Any) {
        SignUpManager.shared.person.name = nameTextField.text!
        saveButtonShowness()
    }
    
    @IBAction func lastNameDidEnd(_ sender: Any) {
        SignUpManager.shared.person.lastName = lastNameTextField.text!
        saveButtonShowness()
    }
    
    
    @IBAction func switchDidChange(_ sender: Any) {
        termsAndCondsTextField.isHidden = !switchTermsAndCond.isOn
        agreement = switchTermsAndCond.isOn
        SignUpManager.shared.person.agreement = agreement
    }
    
    
    @IBAction func saveUserInformation(_ sender: Any) {
        delegate?.fillViewControllerDelegateSaveUserInf(saved: true)
        self.dismiss(animated: true)
    }
    
    private func saveButtonShowness() {
        if SignUpManager.shared.dataFullFilled() {
            if !editingInf {
                saveButton.isHidden = false
            } else {
            backToMain.titleLabel?.text = "Gaurdar"
            }
        }
    }
    
    private func setSavedData() {
        if editingInf {
            let person = SignUpManager.shared.person
            nameTextField.text = person.name
            lastNameTextField.text = person.lastName
            switchTermsAndCond.isOn = person.agreement
            termsAndCondsTextField.isHidden = !agreement
            saveButton.isHidden = true
            guard let row = SubjectCatalog.sharedSubjectCatalog.rowForSubject(subject: person.subjectDegree) else { return }
            subjectPicker.selectRow(row, inComponent: 0, animated: true)
        }
    }
    
    
    
}

extension FillViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SubjectCatalog.sharedSubjectCatalog.subjectsCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SubjectCatalog.sharedSubjectCatalog.subject(for: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SignUpManager.shared.person.subjectDegree = SubjectCatalog.sharedSubjectCatalog.subject(for: row)!
        saveButtonShowness()
    }
   
}

extension FillViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.text! == "" {
            return false
        } else if textField == nameTextField {
            nameTextField.resignFirstResponder()
            lastNameTextField.becomeFirstResponder()
            return false
        } else if textField == lastNameTextField {
            lastNameTextField.resignFirstResponder()
            return true
        } else {
            return false
        }
    
    }
}

extension FillViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
        scrollView.contentSize.height = contentView.frame.size.height
    }
    
    
}

protocol FillViewControllerDelegate: NSObjectProtocol {
    func fillViewControllerDelegateSaveUserInf( saved: Bool)
}
