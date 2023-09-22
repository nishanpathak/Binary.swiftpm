//
//  binaryToDecimal.swift
//  Binary
//
//  Created by Nishan Pathak on 9/20/23.
//

import SwiftUI

struct binaryToDecimalView: View {
    @State private var decimalInput = ""
    @State private var binaryOutput = ""
    
    var body: some View {
        VStack {
            Text("Decimal to Binary Converter")
                .font(.title)
                .padding()
            
            TextField("Enter decimal number", text: $decimalInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Button(action: convertDecimalToBinary) {
                Text("Convert")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Binary Output:")
                .font(.headline)
                .padding()
            
            Text(binaryOutput)
                .font(.title)
                .padding()
        }
    }
    
    func convertDecimalToBinary() {
        // Validate the decimal input
        if let decimalValue = Int(decimalInput) {
            binaryOutput = decimalToBinary(decimalValue)
        } else {
            binaryOutput = "Invalid decimal input"
        }
    }
    
    func decimalToBinary(_ decimalValue: Int) -> String {
        var binaryString = ""
        var value = decimalValue
        
        while value > 0 {
            let remainder = value % 2
            binaryString = "\(remainder)" + binaryString
            value = value / 2
        }
        
        return binaryString.isEmpty ? "0" : binaryString
    }
}




