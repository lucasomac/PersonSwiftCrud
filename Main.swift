//
//  Main.swift
//  PersonSwiftCrud
//
//  Created by Lucas de Oliveira Macedo on 17/11/24.
//

import Foundation

func showMenu() {
    printf("**********Menu**********")
    printf("Choose an option:\n")
    print("1. Create Person")
    print("2. Update Person")
    print("3. Delete Person")
    print("4. List People")
    print("5. Search Person")
    print("6. Exit")
}
func createPerson(listPeople: inout [String: [String]]){
    printf("**********Create Person**********")
    print("Insert Name:")
    guard  let name: String = readLine(), !name.isEmpty else {
        return
    }
    if listPeople.keys.contains(name){
        let message: String = "Person with name \(name) already exists."
        print(message)
        return
    }
    print("Insert Email:")
    guard  let email: Int = readLine(), !email.isEmpty{ return }
    print("Insert Phone:")
    guard  let phone: Int = readLine(), !phone.isEmpty{ return }
    print("Insert Age:")
    guard  let age: String = readLine(), !age.isEmpty else { return }
    
    let person: [String] = [name, email, phone, age]
    listPeople[name] = person
    print("Person created successfully.")
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
            createPerson(listPeople: &peopleList)
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

main()
