//
//  SectionedIterator.swift
//  Pods
//
//  Created by huminghua on 2017/3/31.
//
//

import Foundation

public struct SectionedIterator<S: Equatable, D: Equatable>: IteratorProtocol {
    
    public typealias Element = D
    private let datas: SectionedDatas<S, D>
    private var index: Int
    internal init(datas: SectionedDatas<S, D>) {
        self.datas = datas
        self.index = 0
    }
    
    public mutating func next() -> SectionedIterator.Element?{
        
        if index == datas.allDatas().count {
            return nil
        }else{
            
            defer {
                index += 1
            }
            
            return self.datas.allDatas()[index]
        }
        
    }
}
