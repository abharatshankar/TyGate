//
//  experienceViewController.swift
//  tygate
//
//  Created by Bharat shankar on 25/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class experienceViewController: UIViewController {
    let webserviceController = WebserviceController.init()

    var isHavingExp = true
    
    @IBOutlet weak var workExpTitle: UILabel!
    
    @IBOutlet weak var iHaveWorkTitle: UILabel!
    @IBOutlet weak var expCountLbl: UILabel!
    @IBOutlet weak var expSlider: UISlider!
    @IBOutlet weak var companyIndustryText: UITextField!
    @IBOutlet weak var companyNameText: UITextField!
    @IBOutlet weak var designationText: UITextField!
    
    @IBOutlet weak var title1Lbl: UILabel!
    
    @IBOutlet weak var titleLbl2: UILabel!
    
    @IBOutlet weak var jobPositionTitle: UILabel!
    
    @IBOutlet weak var companyNameTitle: UILabel!
    
    @IBOutlet weak var industryTitle: UILabel!
    
    @IBOutlet weak var addExpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)
        
        
        /////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////
        // this is to change the color of textfield placeholder
        designationText.attributedPlaceholder = NSAttributedString(string: "Designation",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        companyNameText.attributedPlaceholder = NSAttributedString(string: "Company name",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        companyIndustryText.attributedPlaceholder = NSAttributedString(string: "Enter Company name",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        /////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////
        
        
        
        
        self.workExpTitle.backgroundColor = UIColor.clear
        self.iHaveWorkTitle.backgroundColor = UIColor.clear
        
        webserviceController.lineText(textBox: companyNameText)
        webserviceController.lineText(textBox: designationText)
        webserviceController.lineText(textBox: companyIndustryText)
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func haveExpAction(_ sender: UISwitch) {
        if( sender.isOn != true)
        {
            
            self.addExpBtn.isHidden = true
            self.title1Lbl.isHidden = true
            self.titleLbl2.isHidden = true
            self.jobPositionTitle.isHidden = true
            self.designationText.isHidden = true
            self.companyNameTitle.isHidden = true
            self.companyNameText.isHidden = true
            self.industryTitle.isHidden = true
            self.companyIndustryText.isHidden = true
            self.expSlider.isHidden = true
            self.expCountLbl.isHidden = true
            
        }
        else
        {
            self.addExpBtn.isHidden = false
            self.title1Lbl.isHidden = false
            self.titleLbl2.isHidden = false
            self.jobPositionTitle.isHidden = false
            self.designationText.isHidden = false
            self.companyNameTitle.isHidden = false
            self.companyNameText.isHidden = false
            self.industryTitle.isHidden = false
            self.companyIndustryText.isHidden = false
            self.expSlider.isHidden = false
            self.expCountLbl.isHidden = false
        }
    }
    
    
    @IBAction func expSliderAction(_ sender: Any) {
        let currentValue = Int(self.expSlider.value)
        
        expCountLbl.text = "\(currentValue) "
    }
    

    
    
    
    
}
