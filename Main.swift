//
//  Main.swift
//  PersonSwiftCrud
//
//  Created by Lucas de Oliveira Macedo on 17/11/24.
//

import Foundation

func showMenu() {
    printf("Choose an option:\n")
    print("1. Create Person")
    print("2. Update Person")
    print("3. Delete Person")
    print("4. List People")
    print("5. Search Person")
    print("6. Exit")
}
func main() {
    var peopleList: [String: [String]] = [:]
    var isFinished: Bool = false
    while !isFinished {
        showMenu()
        guard let option = Int(readLine()) else {
            print("Invalid option")
            continue
        }
        switch option {
        case 1:
            print("Create Person")
        case 2:
            print("Update Person")
        case 3:
            print("Delete Person")
        case 4:
            print("List People")
        case 5:
            print("Search Person")
        case 6:
            isFinished = true
            print("Exiting...")
        default:
            print("Invalid option")
        }
    }
}
