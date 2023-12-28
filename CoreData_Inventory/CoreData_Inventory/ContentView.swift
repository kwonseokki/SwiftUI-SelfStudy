//
//  ContentView.swift
//  CoreData_Inventory
//
//  Created by SeokKi Kwon on 2023/12/28.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var name: String = ""
    @State var quantity: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Products().entity, sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var products: FetchedResults<Products>
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button("Add") {addProduct()}
                    
                    Spacer()
                    NavigationLink(destination: ResultView(name: name, viewContext: viewContext)) {
                        Text("Find")
                    }
                    
                    Spacer()
                    Button("Clear") {
                        name = ""
                        quantity = ""
                    }
                    Spacer()
                }
                .padding()
                
                
                List {
                    ForEach(products) { product in
                        HStack {
                            Text(product.name ?? "Not found")
                            Spacer()
                            Text(product.quantity ?? "Not fount")
                        }
                    }
                    .onDelete(perform: deleteProducts)
                }
                .navigationTitle("Product Database")
            }
            .frame(maxWidth: .infinity)
            
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    private func addProduct() {
        withAnimation {
            let product = Products(context: viewContext)
            product.name = name
            product.quantity = quantity
            
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try? viewContext.save() // 현재의 viewContext를 영구저장소에 저장
        } catch {
            let error = error as NSError
            fatalError("An error occurred: \(error)")
        }
    }
    
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map {products[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
}

struct ResultView: View {
    var name: String
    var viewContext: NSManagedObjectContext
    
    @State var matches: [Products]?
    
    var body: some View {
        VStack {
            List(matches ?? []) { match in
                HStack {
                    Text(match.name ?? "")
                    Spacer()
                    Text(match.quantity ?? "")
                }
            }
        }
        .navigationTitle("Result")
        .task {
            let fetchRequested: NSFetchRequest<Products> = Products.fetchRequest()
            fetchRequested.entity = Products.entity()
            fetchRequested.predicate = NSPredicate(format: "name CONTAINS %@", name)
            matches = try? viewContext.fetch(fetchRequested)
        }
    }
}

#Preview {
    ContentView()
}
