//
//  NewTaskItemView.swift
//  Devote-udemy
//
//  Created by Mewan on 19/04/2021.
//

import SwiftUI

struct NewTaskItemView: View {
    var body: some View {
        
        // MARK: Body

        VStack {
            Spacer()
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        Color(isDarkMode ? UIColor.tertiarySystemBackground : UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                
                Button(action: {
                    addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)

                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(10)
            } // : VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                Color(isDarkMode ? UIColor.secondarySystemBackground : UIColor.white)
            )
            .cornerRadius(10)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.64), radius: 24)
            .frame(maxWidth: 640)
        } // : VSTACK
        .padding()
    }
    
    // MARK: Functions
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.isCompleted = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    @Binding var isShowing: Bool
    
    // MARK: Internals

    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var task = ""
    
    private var isButtonDisabled: Bool {
        return task.isEmpty
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .previewDevice("iPhone 12")
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
