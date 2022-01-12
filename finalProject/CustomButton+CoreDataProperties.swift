//
//  CustomButton+CoreDataProperties.swift
//  finalProject
//
//  Created by QUANG HUNG on 07/Jan/2022.
//
//

import Foundation
import CoreData


extension CustomButton {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CustomButton> {
        return NSFetchRequest<CustomButton>(entityName: "CustomButton")
    }

    @NSManaged public var button_text: String?
    @NSManaged public var button_text_color: String?
    @NSManaged public var button_background_color: String?
    @NSManaged public var button_width: Int16
    @NSManaged public var button_height: Int16
    @NSManaged public var border: Int16
    @NSManaged public var border_dash_pattern: String?
    @NSManaged public var border_color: String?
    @NSManaged public var border_radius: Int16
    @NSManaged public var left_icon: String?
    @NSManaged public var right_icon: String?
    @NSManaged public var tint_color: String?

}

extension CustomButton : Identifiable {

}
