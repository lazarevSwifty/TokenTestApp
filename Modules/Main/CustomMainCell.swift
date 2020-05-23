import UIKit

class CustomMainCell: UITableViewCell {
    let daLabel = UILabel()
    let dmLabel = UILabel()
    let bodyTextView = UITextView()
    let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        setupConstraits()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(entries: EntriesData?) {
        if let data = entries {
            daLabel.text = data.da
            dmLabel.text = data.dm
            bodyTextView.text = data.body
        }
    }
    
    func commonInit() {
        dmLabel.translatesAutoresizingMaskIntoConstraints = false
        daLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.isUserInteractionEnabled = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(daLabel)
        stackView.addArrangedSubview(dmLabel)
        addSubview(stackView)
        addSubview(bodyTextView)
        
    }
    
    func setupConstraits() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            
            bodyTextView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            bodyTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            bodyTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            bodyTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
    }
}
