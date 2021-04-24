//
//  AstronuatView.swift
//  Moonshot
//
//  Created by sanmi_personal on 24/04/2021.
//

import SwiftUI

struct AstronuatView: View {
    let astronuat : Astronuat
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronuat.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronuat.description)
                        .padding()
                }
            }
            
        }
    }
}

struct AstronuatView_Previews: PreviewProvider {
    static let astronuat = Astronuat(id: "12", name: "Oluwasanmi", description: "ksjdshjhdjdshhsdj")
    static var previews: some View {
        AstronuatView(astronuat: astronuat)
    }
}
