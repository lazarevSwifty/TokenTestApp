import UIKit

protocol ModelBuilderProtocol {
    static func createMainModule() -> UIViewController
//    static func createAddingModule() -> UIViewController

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
        view.presenter = AddingPresenter(view: view)
        return view
    }

}
