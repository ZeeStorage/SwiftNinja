//
//  BarChart.swift
//  SwiftNinja
//
//  Created by Sabah, Sam on 23.11.20.
//

import SwiftUI

struct BarChart: View {
    
    @State var selected =  0
    var colours = [Color("Color1"),Color("Color")]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)

    
    var body: some View {
    
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                HStack{
                    Text("Dashborde")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                    
                    Button(action: {}){
                    Image("menu")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                    }
                }
                .padding()

                
                
                
                
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Overall Progress")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                   
                    ZStack{
                        Circle()
                            .trim(from: 0, to: 1)
                            .stroke(Color.white.opacity(0.05), lineWidth: 20)
  //                          .frame(width: (UIScreen.main.bounds.width ) / 2, height: (UIScreen.main.bounds.width) / 2)
                        
                        Circle()
                            .trim(from: 0, to: 0.60)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                            .frame(width: (UIScreen.main.bounds.width ) / 2, height: (UIScreen.main.bounds.width ) / 2)
                        
                        Text(getPrecent(current: 60.0, Goal: 100.0) + "%")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .rotationEffect(.init(degrees: 90))

                    }
                    .rotationEffect(.init(degrees: -90))


                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(10)
                .padding()
                // Quiz Progress status outer border
                
                
                // Quiz-BAR Starting
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Quiz Progress")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 15){
                        ForEach(progress_Data){ work in
                            
                            VStack{
                                VStack{
                                    Spacer(minLength: 0)
                                    
                                    if selected == work.id{
                                        Text(getOverallQuizProgress(valua: work.scoure))
                                            .foregroundColor(Color("Color"))
                                            .padding(.bottom,5)
                                    }
                                    

                                    
                                    RoundedShape()
                                        .fill(LinearGradient(gradient: .init(colors: selected == work.id ? colours : [Color.white.opacity(0.08)]), startPoint: .top, endPoint: .bottom))
                                    // max hight = 200
                                    
                                        .frame( height: getQuizProgressHight(value: work.scoure))
                                }
                                .frame( height: 220)
                                .onTapGesture {
                                    withAnimation(.easeOut){
                                        selected = work.id
                                    }
                                }

                                
                                Text(work.quiz)
                                    .font(.caption)
                                    .foregroundColor(.white)
    
                            }
                            
                        }
                        
                    }

                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(10)
                .padding()
                // Quiz Progress status outer border
            
                HStack{
                    Text("Learn Progress")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                    

                }
                .padding()
                
                //status Gridd
                
                LazyVGrid(columns: columns, spacing: 25){
                    
                    ForEach(stats_Data){stats in
                        
                        VStack(spacing: 22){
                            HStack{
                                Text(stats.title)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer(minLength: 0)
                            }
                            
                            // Ring
                            ZStack{
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(stats.color.opacity(0.05), lineWidth: 10)
                                    .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
                                
                                Circle()
                                    .trim(from: 0, to: stats.currentData / stats.goal)
                                    .stroke(stats.color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                    .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
                                
                                Text(getPrecent(current: stats.currentData, Goal: stats.goal) + "%")
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(stats.color)
                                    .rotationEffect(.init(degrees: 90))

                            }
                            .rotationEffect(.init(degrees: -90))

                        }
                        .padding()
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(15)
                        .shadow(color: Color.white.opacity(0.1), radius: 10, x: 0, y: 0)
                    }
                }
                .padding()
                
                
                //Achivment
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Achievement")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    let iconArray = Array(1...16).map {"Icon\($0)"}
                    let layout = [
                        GridItem(.flexible(minimum: 80.0, maximum: 80.0)),
                        GridItem(.flexible(minimum: 80.0, maximum: 80.0)),
                        GridItem(.flexible(minimum: 80.0, maximum: 80.0)),
                        GridItem(.flexible(minimum: 80.0, maximum: 80.0))




                    ]
                    
                    LazyVGrid(columns: layout, spacing: 20){
                        ForEach(iconArray, id: (\.self)) { item in
                            HStack{
                                Image(item)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.blue)

                            }
                            
                        }
                        
                    }
                    .padding(.horizontal)



                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(10)
                // Quiz Progress status outer border
                
                
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .preferredColorScheme(.dark)
            //
        }
        // progress math culcolator
        

        
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}

func getQuizProgressHight (value: CGFloat) -> CGFloat {
    
    // dummy data
    let score = CGFloat(value / 1440) * 200
    return score
}

func getOverallQuizProgress(valua: CGFloat) -> String {
    let score = valua / 60
    return String(format: "%.1f", score)
}


// culculation persent

func getPrecent(current: CGFloat, Goal: CGFloat) -> String {
    let per = (current / Goal) * 100
    return String(format: "%.1f", per)
}

struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 5, height: 5))
        
        return Path(path.cgPath)
    }
    
}



// sample Data...

struct Daily : Identifiable {
    
    var id : Int
    var quiz : String
    var scoure : CGFloat
}

var progress_Data = [

    Daily(id: 0, quiz: "Q 1", scoure: 480),
    Daily(id: 1, quiz: "Q 2", scoure: 880),
    Daily(id: 2, quiz: "Q 3", scoure: 250),
    Daily(id: 3, quiz: "Q 4", scoure: 360),
    Daily(id: 4, quiz: "Q 5", scoure: 1000),
    Daily(id: 5, quiz: "Q 6", scoure: 750),
    Daily(id: 6, quiz: "Q 7", scoure: 950)
]

// stats Data...

struct Stats : Identifiable {
    
    var id : Int
    var title : String
    var currentData : CGFloat
    var goal : CGFloat
    var color : Color
}

var stats_Data = [

    Stats(id: 0, title: "Basics", currentData: 6.8, goal: 15, color: Color("running")),
    
    Stats(id: 1, title: "Antermediate", currentData: 3.5, goal: 5, color: Color("cycle")),
    
    Stats(id: 2, title: "Advanced ", currentData: 585, goal: 1000, color: Color("energy")),
    
    Stats(id: 3, title: "Advanced 2", currentData: 6.2, goal: 10, color: Color("sleep")),
    

]
