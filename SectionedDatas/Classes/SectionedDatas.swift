//
//  SectionDatas.swift
//  WordTree
//
//  Created by Hu Minghua on 2016/05/06.
//  Copyright © 2016年 sf-sky.Inc. All rights reserved.
//

import Foundation

//MARK: -
open class SectionedDatas<S: Equatable, D: Equatable> {

    private var sections   = [S]()
    private var datasOfAll = [[D]]()

    public init(){}
    
    //MARK: -
    public func add(section: S) {
        guard !sections.contains(section) else {
            return
        }
        sections.append(section)
        datasOfAll.append([D]())
    }
    
    public func add(section: S, with data: D){
        add(section: section)
        datasOfAll[index(ofSection: section)!].append(data)
    }

    public func add(section: S, with datas: [D]) {
        add(section: section)
        datasOfAll[index(ofSection: section)!].append(contentsOf: datas)
    }
    
    //MARK: -
    public func section(ofData data: D) -> S? {
        if let index = datasOfAll.index(where: {$0.contains{d in d == data}}) {
            return sections[index]
        }
        return nil
    }

    public func section(ofIndex index: Int)->S? {
        guard index >= 0, index < sections.count else {
            return nil
        }
        return sections[index]
    }
    //MaRK: -
    public func contains(section: S) -> Bool {
        return sections.contains(section)
    }
    public func contains(data: D, within section: S) -> Bool {
        if let sectionIndex = sections.index(of: section) {
            return datasOfAll[sectionIndex].contains(data)
        }
        return false
    }
    public func contains(data: D) -> Bool{
        for i in 0 ..< sections.count {
            for j in 0 ..< datasOfAll[i].count {
                if data == datasOfAll[i][j]{
                    return true
                }
            }
        }
        return false
    }
    
    //MARK: -
    public func index(of data: D, within section: S) -> Int? {
        guard let sectionIndex = index(ofSection: section) else {
            return nil
        }
        return datasOfAll[sectionIndex].index(of: data)
    }
    
    public func index(ofSection section: S) -> Int? {
        return sections.index(of: section)
    }
   
    /**
     index of allData
     
     - parameter indexWithinSection:        a index within a section
     - parameter sectionIndex: section which index sorted in
     
     - returns: index of all data from a index within a section index
     */
    public func indexOfAll(fromIndex indexWithinSection: Int, withinSection sectionIndex: Int) -> Int? {
        guard sectionIndex >= 0, sectionIndex < sections.count else {
            return nil
        }
        
        if let cnt = allDatas(atSectionIndex: sectionIndex)?.count {
            guard indexWithinSection >= 0, indexWithinSection < cnt  else {
                return nil
            }
        }else{
            return nil
        }
        
        
        var indexOfAll = indexWithinSection
        for i in 0 ..< sectionIndex {
            if let count = allDatas(atSectionIndex: i)?.count{
                indexOfAll += count
            }
            
        }
        return indexOfAll
    }
    
    public func indexOfAll(fromData data: D, withinSection section: S) -> Int? {
        if let sectionIndex = index(ofSection: section) {
            if let index = index(of: data, within: section){
                return indexOfAll(fromIndex: index, withinSection: sectionIndex)
            }
        }
        return nil
    }
    
    //MARK: -
    public func allSections() -> [S] {
        return sections
    }
    
    public func allDatas(ofSection section: S) -> [D]? {
        guard let index = index(ofSection: section) else {
            return nil
        }
        return datasOfAll[index]
    }
    
    public func allDatas(atSectionIndex sectionIndex: Int) -> [D]? {
        guard sectionIndex >= 0, sectionIndex < sections.count else {
            return nil
        }
        
        return datasOfAll[sectionIndex]
	}

	public func allDatas() -> [D] {
        return datasOfAll.reduce([D]()){$0 + $1}
	}
    
    //MARK: -
    public func removeAll() {
		sections.removeAll()
		datasOfAll.removeAll()
	}

    public func remove(at indexOfSection: Int) {
        guard indexOfSection >= 0, indexOfSection < sections.count else {
            return
        }
        sections.remove(at: indexOfSection)
        datasOfAll.remove(at: indexOfSection)
    }
    public func remove(section: S) {
        if let index = index(ofSection: section){
            remove(at: index)
        }
    }
    public func remove(data: D, within section: S) {
        if let sectionIndex = index(ofSection: section){
            if let index = index(of: data, within: section) {
                datasOfAll[sectionIndex].remove(at: index)
            }
        }
    }
    
    //MARK: -
    public func enumerate(invoke: (S, D)->()){
        for s in sections {
            enumerate(section: s){d in invoke(s, d)}
        }
    }
    public func enumerate(section: S, invoke: (D)->()){
        if let e = allDatas(ofSection: section)?.enumerated(){
            for d in e{
                invoke(d.element)
            }
        }
    }
    
    //MARK: -
    public func makeIterator() -> SectionedIterator<S, D>{
        return SectionedIterator(datas: self)
    }
   
}
