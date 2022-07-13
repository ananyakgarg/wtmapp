//
//  MapView.swift
//  wtmapp
//
//  Created by Ananya Garg on 6/24/22.
//

import SwiftUI
import Firebase
import MapKit

struct MapView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.911861, longitude: -79.060837 ), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    @State var add_friend: Bool = false
    
        var body: some View{
            NavigationView{
                VStack{
                    ZStack{
                        Map(coordinateRegion: $region, interactionModes: [.all])
                                    .frame(width: 400, height: 1000)
                        HStack{
                            
                                Button{
                                    add_friend.toggle()
                                }
                            label:
                                {
                                    Image(systemName: "person.fill.badge.plus")
                                }
                                
                                
                            
                            
                            Spacer().frame(width: 50.0)
                            Text("wtm?")
                                .foregroundColor(Color.black)
                                .font(.system(size: 40, weight: .semibold))
                            Spacer().frame(width: 50.0)
                            Text("Hello")
                                .foregroundColor(Color.black)
                        }

                        
                        
                        
                        
                        
                    }

                    
                }
                .background(Color.black)
                
            }
            
            
                        
        }
    }


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
