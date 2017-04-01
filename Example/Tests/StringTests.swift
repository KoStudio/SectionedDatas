import UIKit
import XCTest
import SectionedDatas

class StringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    
    func testAdd() {
        let datas = createSectionDatas()
        
        let section1 = "section1"
        let section2 = "section2"
        datas.add(section: section1)
        XCTAssertEqual(datas.section(ofIndex: 0), section1)
        
        let s1_d1 = "section1_data1"
        datas.add(section: section1, with: s1_d1)
        XCTAssertEqual(datas.section(ofData: s1_d1), section1)
        XCTAssert(datas.contains(data: s1_d1))
        XCTAssert(datas.contains(data: s1_d1, within: section1))
        
        
        let s2_d1 = "section2_data1"
        let s2_d2 = "section2_data2"
        datas.add(section: section2, with: [s2_d1, s2_d2])
        XCTAssert(datas.contains(section: section2))
        XCTAssert(datas.contains(data: s2_d1, within: section2))
        XCTAssert(datas.contains(data: s2_d2, within: section2))
        XCTAssertEqual(datas.section(ofIndex: 1), section2)
        XCTAssertEqual(datas.allDatas(ofSection: section2)!, [s2_d1, s2_d2])
        XCTAssertEqual(datas.allDatas(atSectionIndex: 1)!, [s2_d1, s2_d2])
        XCTAssertEqual(datas.allDatas(), [s1_d1, s2_d1, s2_d2])
    }
    func testFindSection() {
        let datas = createSectionDatasWithData()
        XCTAssertEqual(datas.section(ofIndex: 1), "section1")
        XCTAssertEqual(datas.section(ofIndex: 3), "section3")
        XCTAssertEqual(datas.section(ofIndex: 6), "section6")
        XCTAssertEqual(datas.section(ofIndex: 8), "section8")
        XCTAssertEqual(datas.section(ofIndex: 9), "section9")
        
        XCTAssertEqual(datas.section(ofData: "section1_data0"), "section1")
        XCTAssertEqual(datas.section(ofData: "section1_data1"), "section1")
        XCTAssertEqual(datas.section(ofData: "section2_data2"), "section2")
        XCTAssertEqual(datas.section(ofData: "section5_data0"), "section5")
        XCTAssertEqual(datas.section(ofData: "section5_data4"), "section5")
        XCTAssertEqual(datas.section(ofData: "section6_data14"), "section6")
        XCTAssertEqual(datas.section(ofData: "section6_data84"), "section6")
        XCTAssertEqual(datas.section(ofData: "section6_data99"), "section6")
        XCTAssertEqual(datas.section(ofData: "section8_data99"), "section8")
        XCTAssertEqual(datas.section(ofData: "section8_data199"), "section8")
        XCTAssertEqual(datas.section(ofData: "section8_data999"), "section8")
    }
    func testContains(){
        let datas = createSectionDatasWithData()
        for i in 0 ..< 9 {
            XCTAssert(datas.contains(section: "section\(i)"))
        }
        XCTAssert(datas.contains(data: "section3_data0"))
        XCTAssert(datas.contains(data: "section5_data4", within: "section5"))
        
        XCTAssert(!datas.contains(data: "section3_data1"))
        XCTAssert(!datas.contains(data: "section5_data5", within: "section5"))
    }
    
    func testIndex(){
         let datas = createSectionDatasWithData()
        XCTAssertEqual(datas.index(ofSection: "section2"), 2)
        XCTAssertEqual(datas.index(ofSection: "section3"), 3)
        XCTAssertEqual(datas.index(ofSection: "section4"), 4)
        
        XCTAssertEqual(datas.index(of: "section1_data0", within: "section1"), 0)
        XCTAssertEqual(datas.index(of: "section2_data2", within: "section2"), 2)
        XCTAssertEqual(datas.index(of: "section5_data3", within: "section5"), 3)
        XCTAssertEqual(datas.index(of: "section5_data4", within: "section5"), 4)
        XCTAssertEqual(datas.index(of: "section5_data5", within: "section5"), nil)
        
        XCTAssertEqual(datas.indexOfAll(fromIndex: 1, withinSection: 5), 15)
        XCTAssertEqual(datas.indexOfAll(fromData: "section3_data0", withinSection: "section3"), 8)
        
        XCTAssertNil(datas.indexOfAll(fromIndex: 66, withinSection: 1))
        XCTAssertNil(datas.indexOfAll(fromIndex: 6, withinSection: 11))
        XCTAssertNil(datas.indexOfAll(fromData: "section5_data5", withinSection: "section5"))
    }
    
    func testAllDatas(){
        
        let datas = createSectionDatasWithData()
        var sections = [String]()
        for i in 0 ..< 10 {
            sections.append("section\(i)")
        }
        XCTAssertEqual(datas.allSections(), sections)
        XCTAssertEqual(datas.allDatas(atSectionIndex: 0)!, ["section0_data0", "section0_data1"])
        XCTAssertEqual(datas.allDatas(atSectionIndex: 3)!, ["section3_data0"])
        
        XCTAssertEqual(datas.allDatas(ofSection:"section0")!, ["section0_data0", "section0_data1"])
        XCTAssertEqual(datas.allDatas(ofSection:"section3")!, ["section3_data0"])
        
        var ds = [String]()
        ds.append(contentsOf: ["section0_data0", "section0_data1"])
        ds.append(contentsOf: ["section1_data0", "section1_data1", "section1_data2"])
        ds.append(contentsOf: ["section2_data0", "section2_data1", "section2_data2"])
        ds.append(contentsOf: ["section3_data0"])
        ds.append(contentsOf: ["section4_data0", "section4_data1", "section4_data2", "section4_data3", "section4_data4"])
        ds.append(contentsOf: ["section5_data0", "section5_data1", "section5_data2", "section5_data3", "section5_data4"])
        for i in 0 ..< 100 {
            ds.append("section6_data\(i)")
        }
        ds.append("section7_data0")
        
        for i in 0 ..< 1000 {
            ds.append("section8_data\(i)")
        }
        ds.append("section9_data0")
        XCTAssertEqual(datas.allDatas(), ds)
        
    }
    
    func testRemove(){
        let datas = createSectionDatasWithData()
        
        XCTAssertEqual(datas.allDatas(ofSection: "section1")!, ["section1_data0", "section1_data1", "section1_data2"])
        datas.remove(data: "section1_data1", within: "section1")
        XCTAssertEqual(datas.allDatas(ofSection: "section1")!, ["section1_data0", "section1_data2"])
        
        XCTAssertEqual(datas.allDatas(ofSection: "section3")!, ["section3_data0"])
        datas.remove(data: "section3_data0", within: "section3")
        XCTAssertEqual(datas.allDatas(ofSection: "section3")!, [])
        XCTAssertFalse(datas.contains(data: "section3_data0"))
        
        XCTAssertTrue(datas.contains(section: "section6"))
        XCTAssertTrue(datas.contains(data: "section6_data88"))
        datas.remove(at: 6)
        XCTAssertFalse(datas.contains(section: "section6"))
        XCTAssertFalse(datas.contains(data: "section6_data88"))
        XCTAssertFalse(datas.contains(data: "section6_data77", within: "section6"))
        
        XCTAssertTrue(datas.contains(section: "section8"))
        XCTAssertTrue(datas.contains(data: "section8_data888"))
        datas.remove(section: "section8")
        XCTAssertFalse(datas.contains(section: "section8"))
        XCTAssertFalse(datas.contains(data: "section8_data888"))
        XCTAssertFalse(datas.contains(data: "section8_data777", within: "section8"))
        
        XCTAssertTrue(datas.contains(section: "section1"))
        datas.removeAll()
        XCTAssertFalse(datas.contains(section: "section1"))
        XCTAssertEqual(datas.allSections().count, 0)
        XCTAssertNil(datas.allDatas(ofSection: "section2"))
        XCTAssertEqual(datas.allDatas().count, 0)
    }
   
    func testEumerate() {
        let datas = createSectionDatasWithData()
        print("-----------------")
        var cnt1 = 0
        datas.enumerate(section: "section1"){
            print("\($0)")
            cnt1 += 1
        }
        XCTAssertEqual(cnt1, 3)
        
        print("-----------------")
        var cnt2 = 0
        datas.enumerate { (s, d) in
            print("\(s) : \(d)")
            cnt2 += 1
        }
        XCTAssertEqual(cnt2, 1121)
    }
    
    func testIterator() {
        
        let datas = createSectionDatasWithData()

        var it = datas.makeIterator()
        XCTAssertEqual(it.next(), "section0_data0")
        XCTAssertEqual(it.next(), "section0_data1")
        XCTAssertEqual(it.next(), "section1_data0")
        XCTAssertEqual(it.next(), "section1_data1")
        XCTAssertEqual(it.next(), "section1_data2")
        
        for _ in 0 ..< (1121 - 1 - 5) {
            let _ = it.next()
        }
        
        XCTAssertEqual(it.next(), "section9_data0")
        XCTAssertNil(it.next())
        XCTAssertNil(it.next())
    }
    
    ////////////////////////////////////////////////////////
    private func createSectionDatas() -> SectionedString {
        return SectionedString()
    }
    
    private func createSectionDatasWithData() -> SectionedString {
        let datas = SectionedString()
        
        datas.add(section: "section0", with: ["section0_data0", "section0_data1"])
        datas.add(section: "section1", with: ["section1_data0", "section1_data1", "section1_data2"])
        datas.add(section: "section2", with: ["section2_data0", "section2_data1", "section2_data2"])
        datas.add(section: "section3", with: ["section3_data0"])
        datas.add(section: "section4", with: ["section4_data0", "section4_data1", "section4_data2", "section4_data3", "section4_data4"])
        datas.add(section: "section5", with: ["section5_data0", "section5_data1", "section5_data2", "section5_data3", "section5_data4"])
        for i in 0 ..< 100 {
            datas.add(section: "section6", with: "section6_data\(i)")
        }
        datas.add(section: "section7", with: "section7_data0")
        for i in 0 ..< 1000 {
            datas.add(section: "section8", with: "section8_data\(i)")
        }
        datas.add(section: "section9", with: "section9_data0")
        datas.add(section: "section9")
        
        return datas
    }
}

fileprivate class SectionedString: SectionedDatas<String, String> {

}


