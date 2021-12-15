//
//  CDPerson + Data.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 08/12/2021.
//

import Foundation
import CoreData

@objc(CDPerson)
public class CDPerson: NSManagedObject {

    @NSManaged public var name: String?
    @NSManaged public var password: Int32
    
    func create(person: HrManager) {

        let context = PersistentStorage.shared.context
        let cdPerson = CDPerson(context: context)
        cdPerson.name = person.name?
        cdPerson.password  = person.password ?? 0
        
        PersistentStorage.shared.saveContext()

    }
}
