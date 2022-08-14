//
//  ContentView.swift
//  hw2
//
//  Created by Max will on 8/12/22.
//

import SwiftUI

struct ContentView: View {
@State var item1 = 0
@State var price1 = 10
@State var item2 = 0
@State var price2 = 12
@State var item3 = 0
@State var price3 = 15
@State var item4 = 0
@State var price4 = 12
@State var item5 = 0
@State var price5 = 11
@State var budget = ""
@State var msg = ""
// (double(budget) ?? 0)
    func calc (a: Int, a1: Int, b: Int, b1: Int, c: Int, c1: Int, d: Int, d1: Int, e: Int, e1: Int) -> Int{
        return (a * a1) + (b * b1) + (c * c1) + (d * d1) + (e * e1)
    }
    var body: some View {
        ScrollView{
                ZStack{
            Color.pink.opacity(0.3)
                .ignoresSafeArea()
            VStack{
                Text("Red Cream Bakery")
                    .font(.system(size: 37, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                    .background(.pink.opacity(0.1))
                    .cornerRadius(24)
                    .padding(1)
                Image("redcream")
                    .padding(2)
                    .background(.white.opacity(0.3))
                    .cornerRadius(90)
                
                VStack{
                    RowView(name: "CheeseCake", pic: "cheesecake", price: $price1, item: $item1) // Hstack 1 ->
                    RowView(name: "Brownie Bites", pic: "brownie", price: $price2, item: $item2) // Hstack 2 ->
                    RowView(name: "Chouz", pic: "bites", price: $price3, item: $item3) // Hstack 3 ->
                    RowView(name: "Kinder Cookies", pic: "cookie", price: $price4, item: $item4) // Hstack 4 ->
                    RowView(name: "Ice Cream", pic: "icecream", price: $price5, item: $item5) // Hstack 5 ->

                }// Vstack
                .padding()
                .background(.white.opacity(0.6))
                .cornerRadius(24)
                .padding(7)
               
                HStack{
                    Text("Enter your budget")
                        .padding(7)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium, design: .serif))
                    TextField("Enter your budget", text: $budget)
                        .foregroundColor(.pink)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(.white)
                        .cornerRadius(24)
                        .padding(5)
                } // Hstack
                .padding()
                HStack{
                    Spacer()
                    Button {
                        if (Int(budget) ?? 0) <= 0{
                            msg = "Sorry, enter your amount of money"
                        } else if calc(a: item1, a1: price1, b: item2, b1: price2, c: item3, c1: price3, d: item4, d1: price4, e: item5, e1: price5) <= (Int(budget) ?? 0) {
                            msg = "Payment approved !"
                            
                        } else {
                            msg = "low amount of money..."
                            
                        }
                    } label: {
                        Text("Press to get your reciept")
                            .padding()
                            .background(.white.opacity(0.5))
                            .cornerRadius(24)
                            .foregroundColor(.pink.opacity(0.3))

                    }
                    Spacer()
                }
                HStack{
                    Text(msg)
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 35, weight: .medium, design: .default))
                }
            }   //  Vstack
        }       // Zstack
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RowView: View {
    var name: String
    var pic: String
    @Binding var price: Int
    @Binding var item: Int
    var body: some View {
        HStack{
            Image(pic)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70 )
            Stepper("\(name) \(price) KD ", onIncrement:{ item += 1}, onDecrement:{ item -= 1})
                .font(.system(size: 13, weight: .medium, design: .default))
                .foregroundColor(.pink.opacity(0.3))
                .padding(10)
            Text("\(item)")
                .padding(10)
                .foregroundColor(.pink.opacity(0.3))
            
        }
    }
}
