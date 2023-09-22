import SwiftUI

struct decimalToBinary: View {
    @State private var binaryInput = ""
    @State private var decimalOutput = ""
    
    var body: some View {
        VStack {
            Text("Binary to Decimal Converter")
                .font(.title)
                .padding()
            
            TextField("Enter binary number", text: $binaryInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Button(action: convertBinaryToDecimal) {
                Text("Convert")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Decimal Output:")
                .font(.headline)
                .padding()
            
            Text(decimalOutput)
                .font(.title)
                .padding()
        }
    }
    
    func convertBinaryToDecimal() {
        // Validate the binary input
        if isValidBinary(binaryInput) {
            decimalOutput = binaryToDecimal(binaryInput)
        } else {
            decimalOutput = "Invalid binary input"
        }
    }
    
    func isValidBinary(_ binaryString: String) -> Bool {
        let binaryCharacterSet = CharacterSet(charactersIn: "01")
        return binaryString.rangeOfCharacter(from: binaryCharacterSet.inverted) == nil
    }
    
    func binaryToDecimal(_ binaryString: String) -> String {
        var decimalValue = 0
        for digit in binaryString {
            if let digitValue = Int(String(digit)) {
                decimalValue = decimalValue * 2 + digitValue
            }
        }
        return String(decimalValue)
    }
}


