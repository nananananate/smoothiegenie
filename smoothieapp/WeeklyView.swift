//
//  WeeklyView.swift
//  smoothieapp
//
//  Created by Simeon Lam on 2/14/20.
//  Copyright © 2020 cs125. All rights reserved.
//
import SwiftUI

struct WeeklyView: View {
    @State var pickerselection = 0
    @State var values : [[CGFloat]] = [
    [5,150,50,100,200,110,30,170,50],
    [200,110,30,170,50, 100,100,100,200],
    [10,20,50,100,120,90,180,200,40],
    [30,20,10,20,30,40,50,40,60,50,40],
    [10,30,60,100,150],
    [30,30,30,60,60,90,90,120,150]
    ]
    
    var body: some View {
        ZStack{
            Color(.black).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Nutrients")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    

                Picker(selection: $pickerselection, label: Text("Stats"))
                    {
                        Text("Vitamin-A").tag(0)
                        Text("Vitamin-B12").tag(1)
                        Text("Vitamin-C").tag(2)
                        Text("Vitamin-D").tag(3)
                        Text("Vitamin-E").tag(4)
                        Text("VItamin-K").tag(5)
                    }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 10)

                HStack(alignment: .center, spacing: 10)
                {
                    ForEach(values[pickerselection], id: \.self){
                        data in
                        
                        BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerselection))
                    }
                }.padding(.top, 24).animation(.default)
            }
        }
    }
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
}

struct BarView: View{

    var value: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {

            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: 200).foregroundColor(.black)
                RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(gradient: Gradient(colors:[.red, .purple, .blue]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 30, height: value).foregroundColor(.green)
                
            }.padding(.bottom, 8)
        }
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}
