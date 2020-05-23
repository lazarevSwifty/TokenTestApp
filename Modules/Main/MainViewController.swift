import UIKit
import SystemConfiguration

class MainViewController: UIViewController, ViewSpecificController {
    typealias RootView = MainView
    
    var presenter: MainPresenterProtocol?

    override func loadView() {
        view =  MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().tableView.delegate = self
        view().tableView.dataSource = self
        setupUI()
    }
    
    func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnection = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnection && !flags.contains(.interventionRequired)
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
    }
    
    func setupUI() {
        let addPostButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost))
        navigationItem.rightBarButtonItem = addPostButton
    }

    @objc func addPost() {
        presenter?.present()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchData()
        NotificationCenter.default.addObserver(self, selector: #selector(internetStatus), name: .internetStatus, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .internetStatus, object: nil)
    }
    
    @objc private func internetStatus(_ notification: Notification? = nil) {
        if let status = notification?.object as? Bool {
            if !status {
                showAlert(alertText: "Ошибка", alertMessage:  "Отсутсвует подключение к интернету", title: "Повторить")
            }
        }
    }
}

extension MainViewController: MainViewProtocol {
    func success() {
        view().tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.entries?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! CustomMainCell
        if let data = presenter?.entries?.data[indexPath.section][indexPath.row] {
            cell.configure(entries: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = presenter?.entries?.data[indexPath.section][indexPath.row]
        presenter?.presentDetail(entry: data)
    }
}
