//
//  ViewController.swift
//  SectionedDatas
//
//  Created by KoStudio on 03/31/2017.
//  Copyright (c) 2017 KoStudio. All rights reserved.
//

import UIKit
import SectionedDatas

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    fileprivate var datas: SectionedString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.datas = createSectionDatasWithData()
    
    }
    

    private func createSectionDatasWithData() -> SectionedString {
        let datas = SectionedString()
        
        datas.add(section: "section0", with: ["section0_data0", "section0_data1"])
        datas.add(section: "section1", with: ["section1_data0", "section1_data1", "section1_data2"])
        datas.add(section: "section2", with: ["section2_data0", "section2_data1", "section2_data2"])
        datas.add(section: "section3", with: ["section3_data0"])
        datas.add(section: "section4", with: ["section4_data0", "section4_data1", "section4_data2", "section4_data3", "section4_data4"])
        datas.add(section: "section5", with: ["section5_data0", "section5_data1", "section5_data2", "section5_data3", "section5_data4"])
        for i in 0 ..< 10 {
            datas.add(section: "section6", with: "section6_data\(i)")
        }
        datas.add(section: "section7", with: "section7_data0")
        for i in 0 ..< 20 {
            datas.add(section: "section8", with: "section8_data\(i)")
        }
        datas.add(section: "section9", with: "section9_data0")
        datas.add(section: "section9")
        
        return datas
    }

}


fileprivate class SectionedString: SectionedDatas<String, String> { }

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.datas.allSections().count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let ds =  self.datas.allDatas(atSectionIndex: section){
            return ds.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.datas.section(ofIndex: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.datas.allDatas(atSectionIndex: indexPath.section)?[indexPath.row]
        return cell!
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didClicked At: \(self.datas.section(ofIndex: indexPath.section)!), \(self.datas.allDatas(atSectionIndex: indexPath.section)![indexPath.row])")
    }
}
