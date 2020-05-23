import UIKit

protocol ModelBuilderProtocol {
    static func createMainModule() -> UIViewController
    static func createAddingModule() -> UIViewController
    static func createDetailModule(entries: EntriesData) -> UIViewController
}

class ModelBuilder: ModelBuilderProtocol {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let router = MainRouter()
        let networkService = NetworkServiceImp()
        router.viewController = view
        view.presenter = MainPresenter(view: view, networkService: networkService, router: router)
        return view
    }
    
    static func createAddingModule() -> UIViewController {
        let view = AddingViewController()
        let networkService = NetworkServiceImp()
        view.presenter = AddingPresenter(view: view, networkService: networkService)
        return view
    }
    
    static func createDetailModule(entries: EntriesData) -> UIViewController {
        let view = DetailViewController()
        view.presenter = DetailPresenter(view: view, entries: entries)
        return view
    }

}
