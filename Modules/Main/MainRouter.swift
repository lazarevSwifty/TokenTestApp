import UIKit
protocol MainRouterProtocol: AnyObject {
    func goToAddingVC()
    func goToDetailVC(entries: EntriesData)
}

final class MainRouter: MainRouterProtocol {
    weak var viewController: UIViewController?
    
    func goToAddingVC() {
        let vc = ModelBuilder.createAddingModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToDetailVC(entries: EntriesData) {
        let vc = ModelBuilder.createDetailModule(entries: entries)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
