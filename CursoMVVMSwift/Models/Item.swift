//
//  item.swift
//  CursoMVVMSwift
//
//  Created by Jose Valentin Abundo Hernadez on 04/03/25.
//

import Foundation

public struct Item: Identifiable, Equatable {
    public let id: String = UUID().uuidString;
    public var title: String;
    public var note: String?;
    public var date: Date;
    public var isCompleted: Bool;
    public var isArchived: Bool;
}
