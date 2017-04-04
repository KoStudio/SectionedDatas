# SectionedDatas

[![CI Status](http://img.shields.io/travis/KoStudio/SectionedDatas.svg?style=flat)](https://travis-ci.org/KoStudio/SectionedDatas)
[![Version](https://img.shields.io/cocoapods/v/SectionedDatas.svg?style=flat)](http://cocoapods.org/pods/SectionedDatas)
[![License](https://img.shields.io/cocoapods/l/SectionedDatas.svg?style=flat)](http://cocoapods.org/pods/SectionedDatas)
[![Platform](https://img.shields.io/cocoapods/p/SectionedDatas.svg?style=flat)](http://cocoapods.org/pods/SectionedDatas)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
![sample](https://github.com/KoStudio/SectionedDatas/blob/master/demo1.png)

## Installation

SectionedDatas is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SectionedDatas"
```

## Get Start
Just create a instance of SectionedDatas or it's subclass, and then add your datas with sections into it.

```swift
    private func createSectionDatasWithData() -> SectionedString {
        let datas = SectionedDatas<String, String>()
        
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

```

## Usage
```swift
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
```
    

## Optional Functions
```swift
    //MARK: -
    public func add(section: S)
    public func add(section: S, with data: D)
    public func add(section: S, with datas: [D]) 
    
    //MARK: -
    public func section(ofData data: D) -> S?
    public func section(ofIndex index: Int)->S? 
    
    //MaRK: -
    public func contains(section: S) -> Bool 
    public func contains(data: D, within section: S) -> Bool
    public func contains(data: D) -> Bool
    
    //MARK: -
    public func index(of data: D, within section: S) -> Int? 
    public func index(ofSection section: S) -> Int?
    public func indexOfAll(fromIndex indexWithinSection: Int, withinSection sectionIndex: Int) -> Int? 
    public func indexOfAll(fromData data: D, withinSection section: S) -> Int? 
    
    //MARK: -
    public func allSections() -> [S]
    public func allDatas(ofSection section: S) -> [D]? 
    public func allDatas(atSectionIndex sectionIndex: Int) -> [D]?
    public func allDatas() -> [D] 
    
    //MARK: -
    public func removeAll()
    public func remove(at indexOfSection: Int)
    public func remove(section: S)
    public func remove(data: D, within section: S)
    
    //MARK: -
    public func enumerate(invoke: (S, D)->())
    public func enumerate(section: S, invoke: (D)->())
    
    //MARK: -
    public func makeIterator() -> SectionedIterator<S, D>
```



## Author

kmk, 44663768@163.com

## License

SectionedDatas is available under the MIT license. See the LICENSE file for more info.
