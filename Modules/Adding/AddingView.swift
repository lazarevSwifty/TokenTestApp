import UIKit

class AddingView: UIView {
    
    let textView =  UITextView()
    let copyButton = UIButton()
    let saveButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
        copyButton.backgroundColor = .red
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        copyButton.layer.cornerRadius = 10
        saveButton.backgroundColor = .green
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.layer.cornerRadius = 10
        
        addSubview(textView)
        addSubview(copyButton)
        addSubview(saveButton)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leftAnchor.constraint(equalTo: leftAnchor),
            textView.rightAnchor.constraint(equalTo: rightAnchor),
            
            copyButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 0),
            copyButton.leftAnchor.constraint(equalTo: leftAnchor),
            copyButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            copyButton.widthAnchor.constraint(equalTo: saveButton.widthAnchor, multiplier: 1),
            copyButton.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 0),
            saveButton.leftAnchor.constraint(equalTo: copyButton.rightAnchor, constant: 10),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            saveButton.heightAnchor.constraint(equalTo: copyButton.heightAnchor, multiplier: 1)
        ])
    }
    
}
