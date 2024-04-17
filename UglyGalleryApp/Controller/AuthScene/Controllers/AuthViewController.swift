//
//  AuthViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 07.04.2024.
//

import UIKit
import SnapKit

protocol AuthViewInput: AnyObject {
    func startLoader()
    func stopLoader()
}

enum AuthViewState {
    case initil
    case signIn
    case signUp
}

class AuthViewController: UIViewController {
    
    private var state: AuthViewState = .initil
    var viewOutput: AuthViewOutput?
    
    private lazy var backgroundImageView = UIImageView()
    private lazy var accauntLable = LabelType(type: .accountAdd)
    private lazy var enterlabel = LabelType(type: .enter)
    private lazy var userNameLable = LabelType(type: .userName)
    private lazy var emailLabel = LabelType(type: .email)
    private lazy var passwordLabel = LabelType(type: .password)
    private lazy var userNameTextField = TextFieldType(type: .userName)
    private lazy var emailTextField = TextFieldType(type: .email)
    private lazy var passswordTextField = TextFieldType(type: .password)
    private lazy var signInButton = CustomButtonView()
    private lazy var signUpButton = CustomButtonView()
    private lazy var reminderButton = UIButton()
    private lazy var stackView = UIStackView()
    private lazy var loader = UIActivityIndicatorView(style: .large)
    private lazy var loaderConteiner = UIView()
    
    init(viewOutput: AuthViewOutput? = nil, state: AuthViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setuplayout()
        setupobservers()
        setupNaviationBar()
        setupLoaderView()
    }
}

//MARK: Layaut
private extension AuthViewController {
    
    func setuplayout() {
        switch state {
        case .initil:
            setupImageBG()
            setupSignUpButton()
            setupSignInButton()
        case .signIn:
            view.backgroundColor = .white
            setupEnterLabel()
            setupStackView()
            setupSignInScene()
            setupRemindeButton()
            setupSignInButton()
        case .signUp:
            view.backgroundColor = .white
            setupAccauntlabel()
            setupStackView()
            setupSignUpScene()
            setupSignUpButton()
        }
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        
        switch state {
        case .initil:
            return
        case .signIn:
            [emailLabel, emailTextField, passwordLabel, passswordTextField].forEach {
                stackView.addArrangedSubview($0)
            }
            
            stackView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(400)
                make.width.equalTo(310)
            }
        case .signUp:
            [userNameLable, userNameTextField, emailLabel, emailTextField, passwordLabel, passswordTextField].forEach {
                stackView.addArrangedSubview($0)
            }
            
            stackView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(300)
                make.width.equalTo(310)
            }
        }
    }
    
    func setupImageBG() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleToFill
        view.insertSubview(backgroundImageView, at: 0)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupSignUpButton() {
        signUpButton.setTitleButton(title: "Создать")
        signUpButton.setColorScheme(scheme: .black)
        signUpButton.buttonAction = { [weak self] in
            self?.onSignUpTapped()
        }

        signUpButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.centerX.equalToSuperview()
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
    
    func setupSignInButton() {
        signInButton.setTitleButton(title: "Войти")
        signInButton.setColorScheme(scheme: .green)
        
        signInButton.buttonAction = { [weak self] in
            self?.onSignInTapped()
        }
        
        signInButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
    
    func addSubviews() {
        [stackView, loaderConteiner, accauntLable, enterlabel, signInButton, signUpButton, reminderButton].forEach {
            view.addSubview($0)
        }
    }
    
    func setupNaviationBar() {
            let backImage = UIImage(systemName: "chevron.backward")
            let backButtonItem = UIBarButtonItem(image: backImage,
                                                 style: .plain,
                                                 target: navigationController,
                                                 action: #selector(navigationController?.popViewController(animated: )))
            navigationItem.leftBarButtonItem = backButtonItem
            navigationItem.leftBarButtonItem?.tintColor = .black
        }
    
    func setupLoaderView() {
        loaderConteiner.backgroundColor = .black.withAlphaComponent(0.3)
        loaderConteiner.isHidden = true
        
        loaderConteiner.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        loaderConteiner.addSubview(loader)
        
        loader.snp.makeConstraints { make in
            make.center.equalTo(loaderConteiner.snp.center)
            
        }
    }
}

//MARK: methods SignInScene
extension AuthViewController  {
    
    func setupEnterLabel() {
        enterlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(115)
            make.left.equalToSuperview().inset(50)
        }
    }
    
    func setupSignInScene() {
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.top).inset(20)
            make.left.equalTo(stackView.snp.left).inset(20)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(152)
        }

        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.left.equalTo(stackView.snp.left).inset(10)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }

        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.left.equalTo(stackView.snp.left).inset(20)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(152)
            make.height.equalTo(50)
        }

        passswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).inset(5)
            make.left.equalTo(stackView.snp.left).inset(10)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
    
    func setupRemindeButton() {
        reminderButton.setTitle("Забыли пароль?", for: .normal)
        reminderButton.setTitleColor(.gray, for: .normal)
        reminderButton.addTarget(self, action: #selector(reminderAction), for: .touchUpInside)
        
        reminderButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signInButton.snp.top).offset(3)
        }
    }
    
    @objc func reminderAction() {
        
    }
}

//MARK: methods SignUpScene
extension AuthViewController {
    
    func setupAccauntlabel() {
        accauntLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(115)
            make.left.equalToSuperview().inset(42)
            make.width.equalTo(239)
        }
    }
    
    func setupSignUpScene() {
        userNameLable.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.top).inset(20)
            make.left.equalTo(stackView.snp.left).inset(20)
            make.right.equalTo(stackView.snp.right).inset(20)
            make.width.equalTo(152)
        }

        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameLable.snp.bottom).offset(10)
            make.left.equalTo(stackView.snp.left).inset(10)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }

        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(20)
            make.left.equalTo(stackView.snp.left).inset(10)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(152)
        }

        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.left.equalTo(stackView.snp.left).inset(10)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }

        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.left.equalTo(stackView.snp.left).inset(10)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(152)
        }

        passswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.left.equalTo(stackView.snp.left).inset(10)
            make.right.equalTo(stackView.snp.right).inset(10)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
}

//MARK: AuthViewController ButtonTapped
private extension AuthViewController {
    
    func onSignInTapped() {
        switch state {
        case .initil:
            viewOutput?.goToSignIn()
        case .signIn:
            print("Tapped Good")
            viewOutput?.loginStart(login: userNameLable.text ?? "", password: passwordLabel.text ?? "")
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initil:
            viewOutput?.goToSignUp()
        case .signIn:
            return
        case .signUp:
            viewOutput?.goToSignIn()
        }
    }
    
    func onForgotTapped() {
        
    }
}

//MARK:  AuthViewInput Delegate
extension AuthViewController: AuthViewInput {
    
    func startLoader() {
        loaderConteiner.isHidden = false
        loader.startAnimating()
    }
    
    func stopLoader() {
        loaderConteiner.isHidden = true
        loader.stopAnimating()
    }
}

//MARK: Keybord Observers
private extension AuthViewController {
    
    func setupobservers() {
        startKeyboardListener()
    }
    
    func startKeyboardListener() {
        
    }
    
    func stopKeyboardListener() {
        
    }
    
    func handletap() {
        
    }
    
    func keyboardWillShow() {
        
    }
    
    func keyboardWillHide() {
        
    }
}

