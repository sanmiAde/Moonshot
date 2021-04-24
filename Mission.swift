//
//  Mission.swift
//  Moonshot
//
//  Created by sanmi_personal on 24/04/2021.
//

import SwiftUI

struct Mission: View {
    let mission: Mission
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                Vstack {
                    Image(self.mission.Image)
                }
            }
            
        }
    }
}

struct Mission_Previews: PreviewProvider {
    static var previews: some View {
        Mission()
    }
}
