//
//  Networking.swift
//  HackerNews
//
//  Created by surajkumar on 05/10/25.
//

import Foundation
class Networking: ObservableObject {
    @Published var posts = [post]()
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                   // let decoder = JSONDecoder()
                    if let safedata = data{
                        do{
                            let result = try JSONDecoder().decode(SearchResult.self, from: safedata)
                      
                            self.posts  = result.hits
                            
                        }catch{
                            print("Error parsing json")
                        }
                    }
                }
            }
            task.resume()
        }
    }
    func addCustomNews() {
        let customNews = [
            post(objectID: UUID().uuidString,
                 points: 89,
                 title: "India Wins the World Cup 🏏",
                 url: "https://en.wikipedia.org/wiki/India_at_the_Cricket_World_Cup"),
            
            post(objectID: UUID().uuidString,
                 points: 7989,
                 title: "Cricket: Virat Kohli Announces Retirement",
                 url: "https://sports.ndtv.com/cricket/inside-story-behind-rohit-sharmas-captaincy-exit-virat-kohlis-future-explained-in-report-9398191"), post(objectID: UUID().uuidString,points: 89,title: "premanand Maharaj ke Bhajan from mathura vrindavan live",url: "https://www.imdb.com/name/nm7060064/"),
            post(objectID: UUID().uuidString,
                 points: 786,
                 title: "youtube",
                 url: "https://www.youtube.com"),
            post(objectID: UUID().uuidString,
                 points: 78689,
                 title: "ChatGPT",
                 url: "https://www.ChatGPT.com")
        ]
        
        DispatchQueue.main.async {
            self.posts.append(contentsOf: customNews)
        }
    }

}
 struct SearchResult: Decodable {
    let hits: [post]
}
struct post: Decodable,Identifiable {
    var id: String {return objectID}
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
