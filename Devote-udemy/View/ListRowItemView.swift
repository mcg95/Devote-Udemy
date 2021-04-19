//
//  ListRowItemView.swift
//  Devote-udemy
//
//  Created by Mewan on 20/04/2021.
//

import SwiftUI

struct ListRowItemView: View {
    
    // MARK: Body

    var body: some View {
        Toggle(isOn: $item.isCompleted, label: {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.isCompleted ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default)
        }) // : TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
    
    // MARK: Properties

    @ObservedObject var item: Item
    
    // MARK: Internals

    @Environment(\.managedObjectContext) private var viewContext
}

//struct ListRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowItemView()
//    }
//}
