//
//  ErrorView.swift
//  News App
//
//  Created by Dwi Setiawan on 19/05/21.
//

import SwiftUI

struct ErrorView: View {
   
    
    typealias ErrorViewActionHanlder = () -> Void
    
    let error : Error
    let handler: ErrorViewActionHanlder
    
    internal init(error: Error,
                  handler: @escaping ErrorView.ErrorViewActionHanlder) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack{
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50,weight: .heavy))
                .padding()
            Text("Ooopss")
                .foregroundColor(.black)
                .font(.system(size: 30,weight: .heavy))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding()
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
            .padding()
            .font(.system(size: 15,weight: .heavy))
            .cornerRadius(10)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError){}
    }
}
