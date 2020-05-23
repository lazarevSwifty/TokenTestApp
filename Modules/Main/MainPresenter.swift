import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    
}
protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol,networkService: NetworkService, router: MainRouterProtocol)
    func present()
    func presentDetail(entry: EntriesData?)
    func fetchData() 
    var entries: Entries? {get set}
}

class MainPresenter: MainPresenterProtocol {

    let networkService: NetworkService?
    var router: MainRouterProtocol?
    
    weak var view: MainViewProtocol?
    
    var session: Session?
    var entries: Entries?
    var sessionStr: String?
    
    required init(view: MainViewProtocol, networkService: NetworkService, router: MainRouterProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
        fetchData()
    }
    
    func fetchData() {
        if let session = UserSettings.getSession() {
            print(session)
            self.networkService?.fetchEntries(session: session, completion: {  data in
                DispatchQueue.main.async {
                    self.entries = data
                    self.view?.success()
                }
            })
        } else {
            networkService?.fetchSession(completion: { [weak self] data in
                DispatchQueue.main.async {
                    self?.session = data
                    let str = data.data.session
                    UserSettings.setSession(str)
                }
            })
        }
    }
    
    func refreshData() {
        fetchData()
        view?.success()
    }
    
    func present() {
        router?.goToAddingVC()
    }
    
    func presentDetail(entry: EntriesData?) {
        if let data = entry {
            router?.goToDetailVC(entries: data)
        }
    }
}

