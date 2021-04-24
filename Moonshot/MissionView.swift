//
//  MissionView.swift
//  Moonshot
//
//  Created by sanmi_personal on 24/04/2021.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        var astronuat: Astronuat
    }
    
    let mission: Mission
    let astronuats : [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.mission.description)
                        .padding()
                    
                    ForEach(self.astronuats, id: \.role) { crewMember in
                        NavigationLink(
                            destination: AstronuatView(astronuat: crewMember.astronuat))
                        {
                            HStack {
                                Image(crewMember.astronuat.id)
                                    .resizable()
                                    .frame(width: 63, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipShape(Circle())
                                    .overlay(Circle()
                                                .stroke(Color.primary, lineWidth: 1))
                                
                                VStack(alignment: .leading){
                                    Text(crewMember.astronuat.name).font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }.buttonStyle(PlainButtonStyle())
                    }
                    Spacer(minLength: 25)
                }
                .padding(.horizontal)
                .navigationBarTitle(mission.displayName)
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
    
    init(mission: Mission, astronuats: [Astronuat]) {
        self.mission = mission
        
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronuats.first(where: {$0.id == member.name}) {
                matches.append(CrewMember(role: member.role!, astronuat: match))
            } else {
                fatalError("Missing \(member)")
            }
            
        }
        
        self.astronuats = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronuats : [Astronuat] = Bundle.main.decode("Astronuats.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronuats: astronuats)
    }
}
