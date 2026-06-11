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
    
    static func searchMovie(query: String, completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + "search/movie?api_key=" + NetworkConstant.shared.apiKey + "&query=" + query
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
                completionHandler(.failure(.canNotParseData))
            }
            
        }.resume()
        
    }
}









