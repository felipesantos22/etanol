//
//  CoreData.swift
//  etanol
//
//  Created by Felipe Santos on 23/05/25.
//

import UIKit
import CoreData

extension UIApplication {
    static var viewContext: NSManagedObjectContext {
        (shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
