//
//  Person+CoreDataProperties.swift
//  Saving Data 1
//
//  Created by user147466 on 3/18/19.
//  Copyright © 2019 user147466. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var empID: Int16
    @NSManaged public var fullName: String?
    @NSManaged public var dateOfBirth: Int32

}
