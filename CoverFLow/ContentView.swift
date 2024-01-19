//
//  ContentView.swift
//  CoverFLow
//
//  Created by Mesut As on 19.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [CoverFlowItem] = [.red, .blue, .green, .yellow, .orange, .purple, .gray, .cyan, .indigo, .primary, .red, .blue, .green, .yellow, .orange, .purple, .gray, .cyan, .indigo, .primary].compactMap{
        return .init(color: $0)
    }
//    view properties
    @State private var spacing: CGFloat = 0
    @State private var rotation: CGFloat = .zero
    @State private var enableReflection: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer(minLength: 0)
                
                CoverFlowView(
                    itemWidth: 300,
                    enableReflection: enableReflection,
                    spacing: spacing,
                    rotation: rotation,
                    items: items
                ){ item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(item.color.gradient)
                }
                .frame(height: 300)
                Spacer(minLength:10)
                
//                 Customization View
                VStack(alignment: .leading, spacing: 10, content:  {
                    
                    Text("@mesutasdeveloper")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 90)
                        .padding(.vertical, 10)
                 
                    
                    Toggle("Yansımayı Gösterme", isOn: $enableReflection)
                    
                    Text("Kartlar Arası Boşluk")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                    Slider(value: $spacing, in: -120...20)
                    
                    Text("Kart Döndürme Miktarı")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    Slider(value: $rotation, in: 0...180)
                })
                .padding(15)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
                .padding(15)
            }
            .navigationTitle("Kart Değiştirme")
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
