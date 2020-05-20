import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    
}
protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol,networkService: NetworkService, router: MainRouterProtocol)
    func present()
    //var posts: [Post]? {get set}

}

class MainPresenter: MainPresenterProtocol {


    let networkService: NetworkService?
    var router: MainRouterProtocol?
    
    weak var view: MainViewProtocol?
    
    var session: Session?
    
    required init(view: MainViewProtocol, networkService: NetworkService, router: MainRouterProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
        obtainImages()
    }
    
    
    func obtainImages() {
//        networkService.fetchImages(completion: { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let photos):
//                    //self?.flickrPhotos = photos
//                    //self?.view?.succes()
//                case .failure(let error):
//                    print(error)
//                }
//            }
//        })
        
        networkService?.fetchSession(completion: { [weak self] data in
            DispatchQueue.main.async {
                self?.session = data
            }
        })
        
//        let parameters: [String: String] = [
//           "a": "get_entries",
//            "name": "Jack & Jill"
//        ]
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.setValue(Constants.token, forHTTPHeaderField: "token")
        let postString = "a=get_entries & session=\(session?.data.session)";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        request.httpMethod = "POST"
        
        let session = URLSession.shared

        session.dataTask(with: request) { (data, response, error) in
            if let responseData = data {
                print(String.init(data:data!,  encoding: .utf8)!)
                do {
                    let list = try JSONDecoder().decode(Entries.self, from: responseData)
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    
    func refreshData() {
        obtainImages()
        view?.success()
    }
    
    func present() {
        router?.goToAddingVC()
    }
    
}

