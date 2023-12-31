
import Foundation
class ApiResource: NSObject {
    
    // MARK: - GET APIs
    func getAPIsWithoutToken(url: String, completion: @escaping ((_ code: Int, _ response: Any?, _ error: Error?, _ data: Data?) -> Void)) {
        guard let itemUrl = URL(string: url) else {return}
        
        var request = URLRequest(url: itemUrl, timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            guard let data = data else {
                print(String(describing: error))
                completion( httpResponse?.statusCode ?? 400, response, error, nil)
                return
            }
            completion(  httpResponse?.statusCode ?? 200, response, error, data)
        }
        task.resume()
    }
}
