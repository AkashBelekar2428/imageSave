//
//  DataBaseHelper.swift
//  ImageSaveCoreData
//
//  Created by Akash Belekar on 17/04/23.
//

import Foundation
import CoreData
import UIKit

class DataBaseHelper{
    
    static let shared = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func imageSaveInCoreData(at imgData:Data){
        var profile = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context) as? Profile
        profile?.img = imgData
        
        do {
            try context.save()
        } catch  {
            print("Image Not saved yet..")
        }
        
    }
    
    func getProfileData() -> [Profile]{
        var profileData = [Profile]()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        
        do {
         profileData = try context.fetch(fetchRequest) as! [Profile]
        } catch  {
            print("Not fetched yet..")
        }
        return profileData
        
    }
}
