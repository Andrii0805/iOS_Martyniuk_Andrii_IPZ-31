import SwiftUI


struct ContentView: View {
    
    @State private var name = "Нік гравця"
    @State private var favgame = "Улюблена гра"
    
    
    var body: some View
    {
        
        
        ZStack
        {
            
            LinearGradient(
                colors: [.green, .black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            
            VStack(spacing: 50)
            {
                
                Text("ігровий профіль")
                    .font(.title)
                    .padding(8)
                    .foregroundStyle(.white)
                    .frame(width: 250)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)
                
                
                
                
                
                HStack(spacing: 5)
                {
                    
                    Image(systemName: "car")
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                        .padding(20)
                        .background(Color.black.opacity(0.7), in: Circle())
                    
                    
                    
                    
                    VStack(alignment: .leading,spacing: 2)
                    {
                        
                        Text(name)
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding(8)
                            .frame(width: 200)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(15)
                        
                        
                        Image("Image")
                            .resizable()
                            .frame(width: 200, height: 20)
                            .cornerRadius(15)
                        
                        
                        Text(favgame)
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding(8)
                            .frame(width: 200)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(15)
                    }
                }
                .offset(y:20)
                
                
                
                VStack(spacing: 15)
                {
                    
                    TextField("Введіть нік", text: $name)
                        .textFieldStyle(.roundedBorder)
                    
                   
                    TextField("Введіть гру", text: $favgame)
                        .textFieldStyle(.roundedBorder)
                    
                }
                .padding(.top,50)
                
                Button("Зберегти") 
                {
                                    print("Нік: \(name)")
                                    print("Улюблена гра: \(favgame)")
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.black)
                                .opacity(0.7)
                                .offset(y: 50)
                                .scaleEffect(1.5)
                            }
                            .frame(maxHeight: .infinity, alignment: .top)
                            .padding(30)
                        }
                        .offset(x: -6)
                    }
                }


                #Preview 
{
                    ContentView()
                }

