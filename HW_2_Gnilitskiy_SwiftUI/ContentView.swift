//
//  ContentView.swift
//  HW_2_Gnilitskiy_SwiftUI
//
//  Created by Александр on 22.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var randomSliderValueRed = Double.random(in: 0...255)
    @State private var randomSliderValueGreen = Double.random(in: 0...255)
    @State private var randomSliderValueBlue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 160.0)
                .foregroundColor(
                    Color(
                        .sRGB,
                        red: randomSliderValueRed / 255,
                        green: randomSliderValueGreen / 255,
                        blue: randomSliderValueBlue / 255
                    )
                )
                .padding(.all)
            
            HStack {
                SliderRGB(value: $randomSliderValueRed, colorSlider: .red, nameColor: "\(lround(randomSliderValueRed))")
                
                TextField("\(randomSliderValueRed)", value: $randomSliderValueRed, format: .number)
                    .modsText()
            }
            HStack {
                SliderRGB(value: $randomSliderValueGreen, colorSlider: .green, nameColor: "\(lround(randomSliderValueGreen))")
                
                TextField("\(lround(randomSliderValueGreen))", value: $randomSliderValueGreen, format: .number)
                    .modsText()
            }
            HStack {
                SliderRGB(value: $randomSliderValueBlue, colorSlider: .blue, nameColor: "\(lround(randomSliderValueBlue))")
                
                TextField("\(randomSliderValueBlue)", value: $randomSliderValueBlue, format: .number)
                    .modsText()
            }
        }.offset(x: 0, y: -60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderRGB: View {
    @Binding var value: Double
    
    let colorSlider: Color
    let nameColor: String
    
    var body: some View {
        VStack {
            HStack {
                Text(nameColor)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding([.top, .leading])
                    .frame(width: 50.0)
                
                Slider(value: $value, in: 1...255, step: 1)
                    .accentColor(colorSlider)
                    .padding(.top)
            }
        }
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.top, .trailing])
            .frame(width: 55.0)
            .keyboardType(.numberPad)
        
    }
}
extension TextField {
    func modsText() -> some View {
        ModifiedContent (content: self, modifier: TextFieldModifier())
    }
}
    
