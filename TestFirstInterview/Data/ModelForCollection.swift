//
//  ModelForCollection.swift
//  TestFirstInterview
//
//  Created by Guerson on 5/31/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import Foundation

struct ModelForCell {
    let section: Int
    let title: String
    var value : String
}

class ModelForCollection {
    
    var sections : [ String ] = [ ]
    var cells : [ ModelForCell] = [ ]
    
    func setToUserSigned() {
        sections = loadSections()
        cells = loadCells()
    }
    
   
    private func loadSections() -> [ String] {
         return [ "Información Personal", "Más información"]
    }
    
    private func loadCells() -> [ ModelForCell] {
        let person = SignUpManager.shared.person
        var dataForCells : [ ModelForCell ] = [ ]
        dataForCells.append( ModelForCell(section: 0, title: "Nombre", value: person.name))
        dataForCells.append( ModelForCell(section: 0, title: "Apellido", value: person.lastName))
        dataForCells.append(ModelForCell(section: 0, title: "Fecha de nacimiento", value: person.birthDay.description))
        dataForCells.append(ModelForCell(section: 1, title: "Carrera", value: person.subjectDegree))
        let agreement = person.agreement ? "Sí aceptó" : "No aceptó"
        dataForCells.append(ModelForCell(section: 1, title: "Términos y Condiciones", value: agreement))
        
        return dataForCells
    }
    
    
     func countCellsForSection(section: Int) -> Int {
        return cellsForSection(section: section).count
    }
    
    private func cellsForSection(section: Int ) -> [ ModelForCell] {
        var cells : [ ModelForCell ] = []
        for cell in self.cells {
            if cell.section == section {
                cells.append(cell)
            }
        }
        return cells
    }
    
    func cellForIndexPath(indexPath: IndexPath) -> ModelForCell {
        //var dataCellAtIndex = ModelForCell(section: 0, title: "no válido", value: "no válido")
        let cellsFS = cellsForSection(section: indexPath.section)
        let cellFR = cellsFS[ indexPath.row ]
        return cellFR
    }
    
    func sectionForIndexPath(indexPath: IndexPath) -> String {
        return sections[indexPath.section ]
    }
    
}
