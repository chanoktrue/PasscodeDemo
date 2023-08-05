//
//  ContentView.swift
//  PasscodeDemo
//
//  Created by Thongchai Subsaidee on 5/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var passcode: String = ""
    @State private var passcodeCount: Int = 5
    @State private var isPasscodeVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Enter your OTP or PIN:")
                .font(.headline)
            
            HStack(spacing: 20) {
                ForEach(0..<passcodeCount, id: \.self) { index in
                    Text(index < passcode.count ? "😀" : "")
                        .font(.title)
                }
            }
            
            HStack {
                
                if isPasscodeVisible {
                    TextField("", text: $passcode, onCommit: {
                        print("Enter passcode: \(passcode)")
                    })
                }else {
                    SecureField("", text: $passcode, onCommit: {
                        print("Entered passcode: \(passcode)")
                    })
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    isPasscodeVisible.toggle()
                }, label: {
                    Image(systemName: isPasscodeVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.secondary)
                        .padding(.leading, 8)
                })
                
            }
            .padding()
               
        }
    }
}

#Preview {
    ContentView()
}
