# SectionedDatas

[![CI Status](http://img.shields.io/travis/KoStudio/SectionedDatas.svg?style=flat)](https://travis-ci.org/KoStudio/SectionedDatas)
[![Version](https://img.shields.io/cocoapods/v/SectionedDatas.svg?style=flat)](http://cocoapods.org/pods/SectionedDatas)
[![License](https://img.shields.io/cocoapods/l/SectionedDatas.svg?style=flat)](http://cocoapods.org/pods/SectionedDatas)
[![Platform](https://img.shields.io/cocoapods/p/SectionedDatas.svg?style=flat)](http://cocoapods.org/pods/SectionedDatas)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
![sample](https://github.com/KoStudio/SectionedDatas/blob/master/demo1.png)

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

## Requirements

## Installation

SectionedDatas is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SectionedDatas"
```

## Author

kmk, 44663768@163.com

## License

SectionedDatas is available under the MIT license. See the LICENSE file for more info.
