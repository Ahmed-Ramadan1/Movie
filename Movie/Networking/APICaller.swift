import Foundation



enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        
        
        
        let urlString = NetworkConstant.shared.serverAddress +
        "trending/all/day?api_key=" +
        NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
               // print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}








//enum NetworkError: Error {
//    case urlError
//    case canNotParseData
//}
//
//public class APICaller {
//    
//    static func getTrendingMovies(
//        completionHandler: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void
//    ) {
//        
//        let urlString = "https://api.themoviedb.org/3/trending/movie/day?api_key=64b1adec174bad183a638acdef39d1e4"
//        
//        guard let url = URL(string: urlString) else {
//            DispatchQueue.main.async {
//                completionHandler(.failure(.urlError))
//            }
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
//            
//            guard error == nil,
//                  let data = dataResponse else {
//                DispatchQueue.main.async {
//                    completionHandler(.failure(.canNotParseData))
//                }
//                return
//            }
//            
//            do {
//                let resultData = try JSONDecoder().decode(TrendingMoviesModel.self, from: data)
//                
//                DispatchQueue.main.async {
//                    completionHandler(.success(resultData))
//                }
//                
//            } catch {
//                print("Decoding error:", error)
//                
//                DispatchQueue.main.async {
//                    completionHandler(.failure(.canNotParseData))
//                }
//            }
//            
//        }.resume()
//    }
//}
