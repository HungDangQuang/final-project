
import UIKit
import CoreData

protocol reloadTableViewPrototcol{
    func reloadTableView()
}

class CustomButtonViewController: UIViewController, updateUI, updateTintColorProtocol, UITextFieldDelegate, sendImageNameProtocol, updateButtonProtocol {
    
    var buttonText: String?
    var buttonTextColor: String?
    var buttonBackgroundColor: String?
    var buttonWidth: Int?
    var buttonHeight: Int?
    var border: Int?
    var borderDashPattern: String?
    var borderColor: String?
    var borderRadius: Int?
    var leftIcon: String?
    var rightIcon: String?
    var iconTintColor: String?
    
    let buttonOptionViewModel = ButtonOptionViewModel()
    
    var reloadTableViewDelegate: reloadTableViewPrototcol!
    
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    
    lazy var titleLabel: customLabel = {
        let title = customLabel()
        title.text = "Button Settings"
        title.font = title.font.withSize(40)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    // button text
    lazy var buttonTextTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Button text"
        title.setUpLabel()
        return title
    }()
    
    lazy var buttonTextTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Button text"
        textField.delegate = self
        textField.tag = 1
        textField.setUpTextField()
        return textField
    }()
    
    lazy var buttonTextStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.buttonTextTitle,self.buttonTextTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    // button color
    lazy var colorTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Button text color"
        title.setUpLabel()
        return title
    }()
    
    lazy var colorTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Button color"
        textField.delegate = self
        textField.tag = 2
        textField.setUpTextField()
        return textField
    }()
    
    lazy var buttonTexColortStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false

        [self.colorTitle,self.colorTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    // BACKGROUND
    lazy var backgroundTitle: TitleLabel = {
        let title = TitleLabel()
        title.text = "Button backgound color"
        title.setUpLabel()
        return title
    }()
    
    lazy var backgroundTextField:TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Background color"
        textField.delegate = self
        textField.tag = 3
        textField.setUpTextField()
        return textField
    }()
    
    lazy var buttonBackgroundStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.backgroundTitle,self.backgroundTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    // WIDTH
    lazy var widthTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Button width"
        title.setUpLabel()
        return title
    }()
        
    lazy var widthButton = dropDownBtn()

    lazy var heightTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Button height"
        title.setUpLabel()
        return title
    }()
       
    lazy var heightButton = dropDownBtn()
    
    // BORDER
    lazy var borderTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Border"
        title.setUpLabel()
        return title
    }()

    lazy var borderButton : BorderDropDownBtn = {
        let btn = BorderDropDownBtn()
        btn.updateUIDelegate = self
        btn.option.updateUIDelegate = self
        return btn
    }()
    
    // DASH PATTERN
    
    lazy var BorderDashPatternTitle:UILabel = {
        let title = UILabel()
        return title
    }()
    
    lazy var BorderDashPatternTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.tag = 7
        textField.delegate = self
        return textField
    }()
    
    lazy var BorderDashPatternStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false

        [self.BorderDashPatternTitle,self.BorderDashPatternTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    // BORDER COLOR
    lazy var BorderColorTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Border Color"
        title.setUpLabel()
        return title
    }()
    
    lazy var BorderColorTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.setUpTextField()
        textField.placeholder = "Border Color"
        textField.delegate = self
        textField.tag = 8
        return textField
    }()
    
    lazy var BorderColorStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false

        [self.BorderColorTitle,self.BorderColorTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    lazy var BorderRadiusTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Border Radius"
        title.setUpLabel()
        return title
    }()

    
    lazy var BorderRadiusTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.setUpTextField()
        textField.placeholder = "Border Radius"
        textField.delegate = self
        textField.tag = 9
        return textField
    }()
    
    lazy var BorderRadiusStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        [self.BorderRadiusTitle,self.BorderRadiusTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    // left icon
    lazy var leftIconTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Left icon"
        title.setUpLabel()
        return title
    }()
    
    lazy var leftIconDropDown: IconDropDownBtn = {
        let icon = IconDropDownBtn()
        icon.updateTintColorDelegate = self
        return icon
    }()
    
    // right icon
    
    lazy var rightIconTitle:TitleLabel = {
        let title = TitleLabel()
        title.text = "Right icon"
        title.setUpLabel()
        return title
    }()
    
    lazy var RightIconDropDown: IconDropDownBtn = {
        let icon = IconDropDownBtn()
        icon.updateTintColorDelegate = self
        return icon
    }()
    
    // Tint color
    lazy var iconTintColorTitle:TitleLabel = {
        let title = TitleLabel()
        return title
    }()
    
    lazy var iconTintColorTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.tag = 10
        textField.delegate = self
        return textField
    }()
    
    lazy var iconTintColorStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        [self.iconTintColorTitle,self.iconTintColorTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    lazy var buttonResult = customButton()
    
    lazy var resultView: UIView = {
        let result = UIView()
        result.addSubview(buttonResult)
        result.bringSubviewToFront(buttonResult)
        return result
    }()
    
    lazy var addButton:customButton = {
        let btn = customButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(withTitle: "Add Button")
        btn.layer.cornerRadius = 5
        btn.backgroundColor = hexStringToUIColor(hex: "#C8EFF7")
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        scrollView.isUserInteractionEnabled = true
        configureScrollView()
        configureTitle()
        configureButtonTextStackView()
        configureButtonTextColorStackView()
        configureBackgroundColorStackView()
        configureWidthDropDownButton()
        configureHeightDropDownButton()
        configureBorderButton()
        configureBorderDashPatternStackView()
        configureBorderColorStackView()
        configureBorderRaidusStackView()
        configureLeftIconDropdown()
        configureRightIconDropdown()
        configureIconTintColorStackView()
        configureResultView()
        configureAddButton()
        
        self.tabBarController?.tabBar.barTintColor = .white
        self.tabBarController?.tabBar.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func configureScrollView(){
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 900)
        ])
        self.view.layoutIfNeeded()
        self.view.setNeedsLayout()

        self.scrollView.layoutIfNeeded()
        self.scrollView.setNeedsLayout()
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2100)
    }
    
    private func configureTitle(){
        scrollView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func configureButtonTextStackView(){
        scrollView.addSubview(buttonTextStackView)
        
        NSLayoutConstraint.activate([
            buttonTextStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            buttonTextStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
//            buttonTextStackView.heightAnchor.constraint(equalToConstant: 70),
            buttonTextTextField.widthAnchor.constraint(equalToConstant: 330),
            buttonTextTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configureButtonTextColorStackView(){
        scrollView.addSubview(buttonTexColortStackView)
        
        NSLayoutConstraint.activate([
            buttonTexColortStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            buttonTexColortStackView.topAnchor.constraint(equalTo: buttonTextStackView.bottomAnchor, constant: 50),
            colorTextField.widthAnchor.constraint(equalTo: buttonTextTextField.widthAnchor),
            colorTextField.heightAnchor.constraint(equalTo: buttonTextTextField.heightAnchor)
        ])
    }
    
    private func configureBackgroundColorStackView(){
        scrollView.addSubview(buttonBackgroundStackView)
        
        NSLayoutConstraint.activate([
            buttonBackgroundStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            buttonBackgroundStackView.topAnchor.constraint(equalTo: buttonTexColortStackView.bottomAnchor, constant: 50),
            backgroundTextField.widthAnchor.constraint(equalTo: buttonTextTextField.widthAnchor),
            backgroundTextField.heightAnchor.constraint(equalTo: buttonTextTextField.heightAnchor)
        ])
        
    }
        
    private func configureWidthDropDownButton(){
        
        scrollView.addSubview(widthTitle)
        scrollView.addSubview(widthButton)

        widthButton.textfield.tag = 4
        widthButton.textfield.delegate = self
        
        NSLayoutConstraint.activate([
            widthTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 30),
            widthTitle.topAnchor.constraint(equalTo: buttonBackgroundStackView.bottomAnchor, constant: 50),
            
            widthButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            widthButton.topAnchor.constraint(equalTo: widthTitle.bottomAnchor, constant: 15),
            widthButton.heightAnchor.constraint(equalToConstant: 50),
            widthButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        widthButton.setTitle(withTitle: "Dynamic")
        widthButton.dropView.dropDownOptions = ["Fixed"]
    }
    
    private func configureHeightDropDownButton(){
        
        scrollView.addSubview(heightTitle)
        scrollView.addSubview(heightButton)
        

        heightButton.textfield.delegate = self
        heightButton.textfield.tag = 5
        
        NSLayoutConstraint.activate([
            heightTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 30),
            heightTitle.topAnchor.constraint(equalTo: widthButton.bottomAnchor, constant: 50),
            
            heightButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            heightButton.topAnchor.constraint(equalTo: heightTitle.bottomAnchor, constant: 15),
            heightButton.heightAnchor.constraint(equalToConstant: 50),
            heightButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        heightButton.setTitle(withTitle: "Dynamic")
        heightButton.dropView.dropDownOptions = ["Fixed"]
    }
    
    private func configureBorderButton(){
        
        scrollView.addSubview(borderTitle)
        scrollView.addSubview(borderButton)
        
        borderButton.textfield.tag = 6
        borderButton.textfield.delegate = self
        borderButton.updateBorderDelegate = self
        
        borderButton.setTitle(withTitle: "Yes")
        borderButton.dropView.dropDownOptions = ["No"]
        
        NSLayoutConstraint.activate([
            
            borderTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            borderTitle.topAnchor.constraint(equalTo: heightButton.bottomAnchor, constant: 50),
            
            borderButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            borderButton.topAnchor.constraint(equalTo: borderTitle.bottomAnchor, constant: 15),
            borderButton.widthAnchor.constraint(equalToConstant: 110),
            borderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
//        borderButton.layoutIfNeeded()
    }
    
    private func configureBorderDashPatternStackView(){
        scrollView.addSubview(BorderDashPatternStackView)
        NSLayoutConstraint.activate([
            BorderDashPatternStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            BorderDashPatternStackView.bottomAnchor.constraint(equalTo: borderButton.bottomAnchor),
        ])
    }
    
    func updateUI() {
        
        if borderButton.option.title.text == "Dash" {
            
            BorderDashPatternStackView.deactivateAllConstraints()
            
            BorderDashPatternTitle.text = "Border Dash Pattern"
            let font = UIFont.boldSystemFont(ofSize: 16.0)
            let attributes :Dictionary = [NSAttributedString.Key.font : font]
            let attrString = NSAttributedString(string: BorderDashPatternTitle.text!, attributes:attributes)
            BorderDashPatternTitle.attributedText = attrString
            
            BorderDashPatternTextField.setUpTextField()
            BorderDashPatternTextField.placeholder = "Border Dash Pattern"

            NSLayoutConstraint.activate([
                BorderDashPatternStackView.topAnchor.constraint(equalTo: borderButton.bottomAnchor, constant: 50),
                BorderDashPatternStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
                BorderDashPatternStackView.widthAnchor.constraint(equalToConstant: 330),
                BorderDashPatternStackView.heightAnchor.constraint(equalToConstant: 80),
                
                BorderDashPatternTitle.leadingAnchor.constraint(equalTo: BorderDashPatternStackView.leadingAnchor),
                BorderDashPatternTitle.topAnchor.constraint(equalTo: BorderDashPatternStackView.topAnchor),
                BorderDashPatternTitle.widthAnchor.constraint(equalTo: BorderDashPatternStackView.widthAnchor),
                BorderDashPatternTitle.heightAnchor.constraint(equalToConstant: 30),
                
                BorderDashPatternTextField.leadingAnchor.constraint(equalTo: BorderDashPatternStackView.leadingAnchor),
                BorderDashPatternTextField.topAnchor.constraint(equalTo: BorderDashPatternTitle.bottomAnchor, constant: 10),
                BorderDashPatternTextField.widthAnchor.constraint(equalTo:BorderDashPatternStackView.widthAnchor),
                BorderDashPatternTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        else {
            BorderDashPatternStackView.deactivateAllConstraints()
            BorderDashPatternTextField.text = nil
            NSLayoutConstraint.activate([
                BorderDashPatternStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
                BorderDashPatternStackView.bottomAnchor.constraint(equalTo: borderButton.bottomAnchor),
            ])
        }
        
        if borderButton.title.text == "No" {
            BorderDashPatternTextField.text = nil
            border = nil
            borderDashPattern = nil
            BorderDashPatternStackView.deactivateAllConstraints()
            NSLayoutConstraint.activate([
                BorderDashPatternStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
                BorderDashPatternStackView.bottomAnchor.constraint(equalTo: borderButton.bottomAnchor),
            ])
        }
    }
    
    private func configureBorderColorStackView(){
        
        scrollView.addSubview(BorderColorStackView)
        
        NSLayoutConstraint.activate([
            BorderColorStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            BorderColorStackView.topAnchor.constraint(equalTo: BorderDashPatternStackView.bottomAnchor, constant: 50),
            BorderColorTextField.widthAnchor.constraint(equalTo: buttonTextTextField.widthAnchor),
            BorderColorTextField.heightAnchor.constraint(equalTo: buttonTextTextField.heightAnchor)
        ])
    }
    
    private func configureBorderRaidusStackView(){
        
        scrollView.addSubview(BorderRadiusStackView)
        
        NSLayoutConstraint.activate([
            BorderRadiusStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            BorderRadiusStackView.topAnchor.constraint(equalTo: BorderColorStackView.bottomAnchor, constant: 50),
            BorderRadiusTextField.widthAnchor.constraint(equalTo: buttonTextTextField.widthAnchor),
            BorderRadiusTextField.heightAnchor.constraint(equalTo: buttonTextTextField.heightAnchor)
        ])
    }
    
    private func configureLeftIconDropdown(){
        
        scrollView.addSubview(leftIconTitle)
        
        scrollView.addSubview(leftIconDropDown)

        leftIconDropDown.setTitle(withTitle: "No")
        
        leftIconDropDown.option.sendImageDelegate = self
        leftIconDropDown.updateImageDelegate = self
        
        NSLayoutConstraint.activate([
            
            leftIconTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            leftIconTitle.topAnchor.constraint(equalTo: BorderRadiusStackView.bottomAnchor, constant: 50),
            
            leftIconDropDown.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            leftIconDropDown.topAnchor.constraint(equalTo: leftIconTitle.bottomAnchor, constant: 10),
            leftIconDropDown.widthAnchor.constraint(equalToConstant: 110),
            leftIconDropDown.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func configureRightIconDropdown(){
        
        scrollView.addSubview(rightIconTitle)
        scrollView.addSubview(RightIconDropDown)
    
        RightIconDropDown.setTitle(withTitle: "No")
        
        RightIconDropDown.option.sendImageDelegate = self
        RightIconDropDown.updateImageDelegate = self
        
        NSLayoutConstraint.activate([
            
            rightIconTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            rightIconTitle.topAnchor.constraint(equalTo: leftIconDropDown.bottomAnchor, constant: 50),
            
            
            RightIconDropDown.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            RightIconDropDown.topAnchor.constraint(equalTo: rightIconTitle.bottomAnchor, constant: 10),
            RightIconDropDown.widthAnchor.constraint(equalToConstant: 110),
            RightIconDropDown.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func sendImageName(name: String) {
        if leftIconDropDown.option.title.text == name {
            leftIcon = name
        }
        if RightIconDropDown.option.title.text == name {
            rightIcon = name
        }
        
        updateButton()
    }
    
    private func configureIconTintColorStackView(){
        scrollView.addSubview(iconTintColorStackView)
        NSLayoutConstraint.activate([
            iconTintColorStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            iconTintColorStackView.bottomAnchor.constraint(equalTo: RightIconDropDown.bottomAnchor),
        ])
    }
    
    func updateTintColor() {
        if leftIconDropDown.title.text == "Yes" || RightIconDropDown.title.text == "Yes" {
            
            iconTintColorStackView.deactivateAllConstraints()
            
            iconTintColorTitle.text = "Icon Tint Color"
            iconTintColorTitle.setUpLabel()
            
            iconTintColorTextField.setUpTextField()
            iconTintColorTextField.placeholder = "Icon Tint Color"

            
            NSLayoutConstraint.activate([
                iconTintColorStackView.topAnchor.constraint(equalTo: RightIconDropDown.bottomAnchor, constant: 60),
                iconTintColorStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
                iconTintColorStackView.widthAnchor.constraint(equalToConstant: 330),
                iconTintColorStackView.heightAnchor.constraint(equalToConstant: 80),
                
                iconTintColorTitle.leadingAnchor.constraint(equalTo: iconTintColorStackView.leadingAnchor),
                iconTintColorTitle.topAnchor.constraint(equalTo: iconTintColorStackView.topAnchor),
                iconTintColorTitle.widthAnchor.constraint(equalTo: iconTintColorStackView.widthAnchor),
                iconTintColorTitle.heightAnchor.constraint(equalToConstant: 30),
                
                iconTintColorTextField.leadingAnchor.constraint(equalTo: iconTintColorStackView.leadingAnchor),
                iconTintColorTextField.topAnchor.constraint(equalTo: iconTintColorTitle.bottomAnchor, constant: 10),
                iconTintColorTextField.widthAnchor.constraint(equalTo:iconTintColorStackView.widthAnchor),
                iconTintColorTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        if leftIconDropDown.title.text == "No" && RightIconDropDown.title.text == "No" {
            iconTintColorTextField.text = nil
            iconTintColor = nil
            iconTintColorStackView.deactivateAllConstraints()
            NSLayoutConstraint.activate([
                iconTintColorStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                iconTintColorStackView.bottomAnchor.constraint(equalTo: RightIconDropDown.bottomAnchor),
            ])
        }
    }
    
    func configureResultView(){
        
        scrollView.addSubview(resultView)
        
        resultView.translatesAutoresizingMaskIntoConstraints = false
        buttonResult.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            resultView.topAnchor.constraint(equalTo: iconTintColorStackView.bottomAnchor, constant: 50),
            
            resultView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            resultView.heightAnchor.constraint(equalToConstant: 120),
            buttonResult.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            buttonResult.centerYAnchor.constraint(equalTo: resultView.centerYAnchor),
        ])
        resultView.backgroundColor = hexStringToUIColor(hex: "#EDEDED")
    }
        
    func configureAddButton(){
        scrollView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: resultView.bottomAnchor, constant: 20),
            addButton.widthAnchor.constraint(equalToConstant: 150),
            addButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        addButton.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        addButton.contentView.addGestureRecognizer(tap)
        self.view.layoutIfNeeded()
        self.scrollView.layoutIfNeeded()
        self.addButton.contentView.layoutIfNeeded()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func updateButton(){
        
        if leftIconDropDown.title.text == "No"{
            leftIcon = nil
            NSLayoutConstraint.deactivate(buttonResult.leftIcon.constraints)
        }
        
        if RightIconDropDown.title.text == "No"{
            rightIcon = nil
            NSLayoutConstraint.deactivate(buttonResult.rightIcon.constraints)
        }
        
        buttonOptionViewModel.updateButton(buttonText: buttonText, buttonTextColor: buttonTextColor, buttonBackgroundColor: buttonBackgroundColor, buttonWidth: buttonWidth, buttonHeight: buttonHeight, border: border, borderDashPattern: borderDashPattern, borderColor: borderColor, borderRadius: borderRadius, leftIcon: leftIcon, rightIcon: rightIcon, tintColor: iconTintColor) { [self] res in
            
//            print("sub layers:\(buttonResult.layer.sublayers?.count)")
            
            for layer in buttonResult.layer.sublayers! {
//                print("layer name:\(layer.name)")
                 if layer.name == "dash" {
                      layer.removeFromSuperlayer()
                 }
             }
         
            buttonResult.removeImage()
            
            if res.buttonText != nil {
                self.buttonResult.setTitle(withTitle: res.buttonText!)
                buttonResult.layoutIfNeeded()
            }
//            self.buttonResult.setTitle(withTitle: res.buttonText)
            
            if res.buttonTextColor != nil {
                self.buttonResult.title.textColor = hexStringToUIColor(hex: res.buttonTextColor!)
            }
            
            if res.buttonBackgroundColor != nil {
                self.buttonResult.backgroundColor = hexStringToUIColor(hex: res.buttonBackgroundColor!)
            }
             
            if res.border != nil {
                self.buttonResult.layer.borderWidth = CGFloat(res.border!)
            }
            
            if res.border == nil {
                self.buttonResult.layer.borderWidth = 0
            }
            
            if res.borderColor != nil {
                self.buttonResult.layer.borderColor = hexStringToCGColor(hex: res.borderColor!)
            }
            
            if res.borderRadius != nil {
                buttonResult.layer.cornerRadius = CGFloat(res.borderRadius!)
            }
            
            if res.leftIcon != nil {
                
                let origimage = UIImage(named: res.leftIcon!)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
                buttonResult.addLeftIcon(img: tintedImage!)
            }
            buttonResult.layoutIfNeeded()
            
            if res.rightIcon != nil {
                let origimage = UIImage(named: res.rightIcon!)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
                buttonResult.addRightIcon(img: tintedImage!)
            }
            buttonResult.layoutIfNeeded()
            
            
            if res.borderDashPattern != nil {
                let array = res.borderDashPattern?.components(separatedBy: ",")
                var dashPattern: [NSNumber] = []
                for element in array! {
                    if let num = Int(element) {
                        let nsNumber = NSNumber(value: num)
                        dashPattern.insert(nsNumber, at: dashPattern.endIndex)
                    }
                }
                
                if dashPattern.count > 0 {
                    buttonResult.addDashedBorder(dashedPattern: dashPattern)
                }
            }
            
            if res.tintColor != nil {
                buttonResult.addTintColor(tintColor: res.tintColor!)
            }
        }
    }
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text == "" {
            textField.text = nil
        }
        
        switch textField.tag {
        case 1:
            buttonText = textField.text
            print("buttonText:\(buttonText)")
        case 2:
            buttonTextColor = textField.text
            print("buttonTextColor:\(buttonTextColor)")
        case 3:
            buttonBackgroundColor = textField.text
            print("Button BG Color:\(buttonBackgroundColor)")
        case 4:
            buttonWidth = Int(textField.text!)
            print("buttonWidth:\(buttonWidth)")
        case 5:
            buttonHeight = Int(textField.text!)
            print("buttonHeight:\(buttonHeight)")
        case 6:
            border = Int(textField.text!)
            print("border:\(border)")
        case 7:
            borderDashPattern = textField.text
            print("border dash pattern:\(borderDashPattern)")
        case 8:
            borderColor = textField.text
            print("border color:\(borderColor)")
        case 9:
            borderRadius = Int(textField.text!)
            print("border radius:\(borderRadius)")
        case 10:
            iconTintColor = textField.text
            print("tint color:\(iconTintColor)")
        default: break
        }
        updateButton()
    }
    
    func update() {
        updateButton()
    }
    
    @objc func buttonTapped(){
        addButton.showAnimation {
            self.buttonOptionViewModel.saveButtonConfig(buttonText: self.buttonText, buttonTextColor: self.buttonTextColor, buttonBackgroundColor: self.buttonBackgroundColor, buttonWidth: self.buttonWidth, buttonHeight: self.buttonHeight, border: self.border, borderDashPattern: self.borderDashPattern, borderColor: self.borderColor, borderRadius: self.borderRadius, leftIcon: self.leftIcon, rightIcon: self.rightIcon, tintColor: self.iconTintColor) {
                
                let notification = UIAlertController(title: "Notification", message: "Button is successfully added", preferredStyle: .alert)
                notification.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(notification, animated: true, completion: nil)
                
            }
            
        }
    }
}

extension UIView {

    func removeConstraints() { removeConstraints(constraints) }
    func deactivateAllConstraints() { NSLayoutConstraint.deactivate(getAllConstraints()) }
    func getAllSubviews() -> [UIView] { return UIView.getAllSubviews(view: self) }

    func getAllConstraints() -> [NSLayoutConstraint] {
        var subviewsConstraints = getAllSubviews().flatMap { $0.constraints }
        if let superview = self.superview {
            subviewsConstraints += superview.constraints.compactMap { (constraint) -> NSLayoutConstraint? in
                if let view = constraint.firstItem as? UIView, view == self { return constraint }
                return nil
            }
        }
        return subviewsConstraints + constraints
    }

    class func getAllSubviews(view: UIView) -> [UIView] {
        return view.subviews.flatMap { [$0] + getAllSubviews(view: $0) }
    }
}
