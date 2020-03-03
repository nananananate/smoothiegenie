//
//  PreferencesView.swift
//  smoothieapp
//
//  Created by Simeon Lam on 2/3/20.
//  Copyright © 2020 cs125. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var userInfo: userSettings
    @State var allergies = ""
    @State var healthoptions = ""
    
    var body: some View {
            Form {
                    Section (header: Text("Personal Info")) {
                        TextField("Your first name", text: $userInfo.user_profile.first_name)
                        TextField("Your last name", text: $userInfo.user_profile.last_name)
                        
                        Picker("Gender", selection: $userInfo.user_profile.gender) {
                            Text("Female").tag("Female")
                            Text("Male").tag("Male")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Picker("Age", selection: $userInfo.user_profile.age) {
                            ForEach(9..<100) { i in
                                Text(String(i)).tag(String(i))
                            }
                        }
                    }
                    
                    Section(header: Text("Health Options")) {
                        List {
                            ForEach (0..<6){ i in
                                Toggle(isOn: self.$userInfo.user_profile.health_options[i].toggle){
                                    Text(self.userInfo.user_profile.health_options[i].name)
                                }
                            } 
                        }
                    }
            }
            .navigationBarTitle("Preferences")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView().environmentObject(userSettings())
    }
}
