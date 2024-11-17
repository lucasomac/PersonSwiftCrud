//
//  main.swift
//  PersonSwiftCrud
//
//  Created by Lucas de Oliveira Macedo on 17/11/24.
//

import Foundation

func showMenu() {
    print("*********************Menu*********************")
    print("Choose an option:\n")
    print("1. Create Person")
    print("2. Update Person")
    print("3. Delete Person")
    print("4. List People")
    print("5. Search Person")
    print("6. Exit")
}
func buildTitle(title: String) -> String { return "\n\(title)\n"}
func createPerson(listPeople: inout [String: [String]]){
    print("****************Create Person*****************")
    print(buildTitle(title: "Insert Name:"))
    guard  let name: String = readLine(), !name.isEmpty else {
        return
    }
    if listPeople.keys.contains(name){
        let message: String = buildTitle(title: "Person with name \(name) already exists.")
        print(message)
        return
    }
    print(buildTitle(title: "Insert Email:"))
    guard  let email: String = readLine(), !email.isEmpty else { return }
    print(buildTitle(title: "Insert Phone:"))
    guard  let phone: String = readLine(), !phone.isEmpty else { return }
    print(buildTitle(title: "Insert Age:"))
    guard  let age: String = readLine(), !age.isEmpty else { return }
    
    let person: [String] = [email, phone, age]
    listPeople[name] = person
    print(buildTitle(title: "Person created successfully."))
}

func updatePerson(listPeople: inout [String: [String]]){
    print("****************Update Person*****************")
    print(buildTitle(title: "Insert Name to update:"))
    guard  let name: String = readLine(), !name.isEmpty else {
        return
    }
    if !listPeople.keys.contains(name){
        let message: String = buildTitle(title: "Person with name \(name) does not exist.")
        print(message)
    } else {
        print(buildTitle(title: "Insert the new Email:"))
        guard let emailUpdated = readLine(), !emailUpdated.isEmpty else {
            return
        }
        print(buildTitle(title: "Insert the new phone"))
        guard let phoneUpdated = readLine(), !phoneUpdated.isEmpty else {
            return
        }
        print(buildTitle(title: "Insert the new age"))
        guard let ageUpdated = readLine(), !ageUpdated.isEmpty else {
            return
        }
        let personUpdated: [String] = [emailUpdated, phoneUpdated, ageUpdated]
        listPeople[name] = personUpdated
        print(buildTitle(title: "Person updated successfully."))
        
    }
}
func deletePerson(listPeople: inout [String: [String]]){
    print(buildTitle(title: "Insert name of personto delete"))
    guard let name = readLine(), !name.isEmpty else {
        return
    }
    if listPeople.removeValue(forKey: name) == nil {
        let message: String = buildTitle(title: "Person with name \(name) does not exist.")
        print(message)
    } else {
        print(buildTitle(title: "Person deleted successfully"))
    }
}

func detailPeople(listPeople: [String: [String]], isSearch: Bool = false) {
    print("******************Show Person*****************")
    if(isSearch) {
        print(buildTitle(title: "Insert Name to find:"))
        guard let name = readLine(), !name.isEmpty else {
            return
        }
        let message: String = buildTitle(title: "Searching...")
        print(message)
        let searchResult: [String] = listPeople[name] ?? []
        if searchResult.isEmpty {
            print(buildTitle(title: "No person found"))
        } else {
            displayPeople(listPeople: [name:searchResult])
        }
    }else{
        if listPeople.isEmpty {
            print(buildTitle(title: "No people registered!"))
        } else {
            displayPeople(listPeople: listPeople)
        }
    }
}
func displayPeople(listPeople: [String: [String]]) {
    for (key, value) in listPeople {
        print("----------------------------------------------")
        print("--------------Person Information--------------")
        print("----Name: \(key)")
        print("----Email: \(value[0])")
        print("----Phone: \(value[1])")
        print("----Age: \(value[2])")
        print("----------------------------------------------")
    }
}

func main() {
    var peopleList: [String: [String]] = [:]
    var isFinished: Bool = false
    while !isFinished {
        showMenu()
        guard let choose = readLine(), let option = Int(choose) else {
            print("Invalid option")
            continue
        }
        switch option {
        case 1:
            createPerson(listPeople: &peopleList)
        case 2:
            updatePerson(listPeople: &peopleList)
        case 3:
            deletePerson(listPeople: &peopleList)
        case 4:
            detailPeople(listPeople: peopleList)
        case 5:
            detailPeople(listPeople: peopleList, isSearch: true)
        case 6:
            isFinished = true
            print("Exiting...")
        default:
            print("Invalid option")
        }
    }
}

main()
