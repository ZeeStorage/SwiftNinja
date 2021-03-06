//
//  Quizviwe.swift
//  SwiftNinja
//
//  Created by Sabah, Sam on 10.12.20.
//

import SwiftUI

struct Quizviwe: View {
    let quis:Quis

@State var score = 0
    var body: some View {
        NavigationView{
            

            VStack {
                if quis.quizName == "Basik Knowladge"{
                    List(basikKnowladgeQuiz) { contact in
                        QuizOneRaw(qustions: contact, score: $score)
                    }
                } else if quis.quizName == "Intermittent"{
                    List(intermittentQuiz) { contact in
                        QuizOneRaw(qustions: contact, score: $score)
                    }
                }  else if quis.quizName == "Advanced 1"{
                    List(advanced1Quiz) { contact in
                        QuizOneRaw(qustions: contact, score: $score)
                    }
                } else if quis.quizName == "Advanced 2"{
                    List(advanced2Quiz) { contact in
                        QuizOneRaw(qustions: contact, score: $score)
                    }
                }
            }
            .navigationBarTitle("Which of the following is valid swift",displayMode: .inline)

        } .navigationBarItems(trailing: Text("Score \(score)"))
        
        
        



        
    }
}

struct Quizviwe_Previews: PreviewProvider {
    static var previews: some View {
        Quizviwe(quis: quises[0])
    }
}




struct QuizOneRaw: View {
    
    let qustions:QuizOne
    @State private var didTap: Bool = false
    @Binding var score :Int
    var body: some View {
        HStack {
            Button(action: {
                self.didTap.toggle()
                if (didTap && qustions.result){
                    self.score += 10
                } else if (!didTap && qustions.result){
                    self.score -= 10
                }
            }) {
                Text(qustions.qustion)
                    .frame(minWidth: 40, maxWidth: .infinity, minHeight: 40, maxHeight: .infinity, alignment: .topLeading)
                    .font(.system(size: 21, weight:.medium, design: .default))
                    
                    .background(didTap && qustions.result ? Color.blue : didTap && !qustions.result ? Color.red : Color.clear)
            }
            
            if didTap && qustions.result {
                Image("check")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                    
            }
            else if didTap && !qustions.result {
                Image("redx")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                
            }
            
            
        }
                
    }
    
    func culcScore(){
        if self.didTap {
            print(score)
        }
        
    }
}
