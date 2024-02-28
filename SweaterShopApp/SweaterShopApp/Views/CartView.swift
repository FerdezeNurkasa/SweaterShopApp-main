//
//  CartView.swift
//  SweaterShopApp
//
//  Created by Ferdeze Nurkasa on 26.2.24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.paymentSuccess {
                VStack {
                    Text("Thanks for your purchase! You'll get cozy in our comfy sweaters soon! You'll also receive an email confirmation shortly.")
                        .padding()

                    // Place the "Show Orders" button here
                    NavigationLink(destination: OrderDetailsView()) {
                        Text("Show Orders")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .simultaneousGesture(TapGesture().onEnded{cartManager.viewingOrders = true})
                }
            } else {
                if cartManager.products.count > 0 {
                                    ForEach(cartManager.products, id: \.id) { product in
                                        ProductRow(product: product)
                                    }
                                    
                                    HStack {
                                        Text("Your cart total is")
                                        Spacer()
                                        Text("$\(cartManager.total).00")
                                            .bold()
                                    }
                                    .padding()
                                    
                                    PaymentButton(action: cartManager.pay)
                                        .padding()
                                    
                                } else {
                    Text("Your cart is empty.")
                }
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
        .onDisappear {
            if cartManager.paymentSuccess && !cartManager.viewingOrders {
                cartManager.paymentSuccess = false
            }
            cartManager.viewingOrders = false
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}

// SwiftUI

//struct CartView: View {
    //@EnvironmentObject var cartManager: CartManager
    
    //var body: some View {
        //ScrollView {
          //  if cartManager.paymentSuccess {
            //    Text("Thanks for your purchase! You'll get cozy in our comfy sweaters soon! You'll also receive an email confirmation shortly.")
              //      .padding()
                
                // "Show Orders" button that navigates to OrderDetailsView
                //NavigationLink(destination: //OrderDetailsView()) {
                    //Text("Show Orders")
                     //   .frame(minWidth: 0, //maxWidth: .infinity)
                        //.padding()
                        //.foregroundColor(.white)
                        //.background(Color.blue)
                        //.cornerRadius(10)
                //}
                //.padding()
           // } else {
             //   if cartManager.products.count > 0 {
               //     ForEach(cartManager.products, //id: \.id) { product in
                      //  ProductRow(product: product)
                    ///}
                    
                   // HStack {
                     //   Text("Your cart total is")
                       // Spacer()
                        //Text("$\(cartManager//.total).00")
                            //.bold()
                   // }
                   // .padding()
                    
                    //PaymentButton(action: //cartManager.pay)
                        //.padding()
                    
               // } else {
                   // Text("Your cart is empty.")
              //  }
                
                // Optionally, you can place the "Show Orders" button outside
                // the if-else structure if you want it to be always accessible.
            //}
       // }
       // .navigationTitle(Text("My Cart"))
       // .padding(.top)
       // .onDisappear {
        //    if cartManager.paymentSuccess {
         //       cartManager.paymentSuccess = false
            //}
       // }
   // }
///}

//struct CartView_Previews: PreviewProvider {
 //   static var previews: some View {
  //      CartView()
   //         .environmentObject(CartManager())
   // }
//}
