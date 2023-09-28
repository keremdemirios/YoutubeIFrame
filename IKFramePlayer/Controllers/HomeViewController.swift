
// TO DO : Ok'a basinca malzemeler UIView'e eklensin.
// TO DO : Min 3 malzeme olunca buton aktif olsun.
// TO DO : hucre silmeyi yap.
//  HomeViewController.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 22.09.2023.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK : UI Elements
    private let searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.clearButtonMode = .whileEditing
        searchTextField.autocorrectionType = .no
        searchTextField.layer.cornerRadius = 12
        searchTextField.textColor = .label
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: searchTextField.frame.height))
        searchTextField.leftView = leftPaddingView
        searchTextField.leftViewMode = .always
        return searchTextField
    }()
    
    lazy var addButton:UIButton = {
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addToWordListTapped), for: .touchUpInside)
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.tintColor = .systemBlue
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.systemBlue.cgColor
        addButton.layer.cornerRadius = 12
        return addButton
    }()
    
    lazy var searchButton:UIButton = {
        let searchButton = UIButton()
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.setTitle("Search", for: .normal)
        searchButton.backgroundColor = .systemGreen
        searchButton.layer.cornerRadius = 10
        searchButton.alpha = 0.5
        return searchButton
    }()
    

    private let wordsView: UIView = {
        let wordsView = UIView()
        wordsView.translatesAutoresizingMaskIntoConstraints = false
        wordsView.layer.cornerRadius = 10
        wordsView.layer.borderWidth = 1
        wordsView.layer.borderColor = UIColor.systemGray2.cgColor
        return wordsView
    }()
    
    private let wordsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        
        // Specify the frame and layout of the UICollectionView
        let wordsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        wordsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        wordsCollectionView.register(WordsCustomCollectionViewCell.self, forCellWithReuseIdentifier: WordsCustomCollectionViewCell.identifier)
        return wordsCollectionView
    }()

    
    var wordsList = [String]()
    
    // MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    // MARK : Configure
    private func configure(){
        searchTextField.delegate = self
        searchButton.isEnabled = false
        
        wordsCollectionView.delegate = self
        wordsCollectionView.dataSource = self
        hideKeyboardWhenTappedAround() // Hide keyboard when tapped around + extension method
        setupUI()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "circle.lefthalf.filled")?.withTintColor(.label, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(changeMode))
    }
    
    // MARK : Setup UI
    private func setupUI(){
        view.addSubViews(searchTextField, addButton, searchButton, wordsView)
        NSLayoutConstraint.activate([
            // text field constraints
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            searchTextField.widthAnchor.constraint(equalToConstant: 250),
            searchTextField.heightAnchor.constraint(equalToConstant: 60),
            // Add button constraints
            addButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            addButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            // View constraints
            wordsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordsView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30),
            wordsView.widthAnchor.constraint(equalToConstant: 250),
            wordsView.heightAnchor.constraint(equalToConstant: 150),
            // button constraints
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: wordsView.bottomAnchor, constant: 100),
            searchButton.heightAnchor.constraint(equalToConstant: 45),
            searchButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        wordsView.addSubViews(wordsCollectionView)
        NSLayoutConstraint.activate([
            wordsCollectionView.topAnchor.constraint(equalTo: wordsView.topAnchor, constant: 5),
            wordsCollectionView.bottomAnchor.constraint(equalTo: wordsView.bottomAnchor, constant: -5),
            wordsCollectionView.leadingAnchor.constraint(equalTo: wordsView.leadingAnchor, constant: 10),
            wordsCollectionView.trailingAnchor.constraint(equalTo: wordsView.trailingAnchor, constant: -10)
        ])
    }
    // MARK : Functions
    private func updateButtonFunctionality(){
        if wordsList.count <= 2 {
            searchButton.alpha = 0.5
        } else {
            searchButton.alpha = 1.0
        }
    }
    // MARK : Actions
    @objc func searchButtonTapped() {
        let vc = PlayerViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        print("working")
        searchTextField.text = nil
    }
    
    @objc func changeMode(){
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let interfaceStyle = window?.overrideUserInterfaceStyle == .unspecified ? UIScreen.main.traitCollection.userInterfaceStyle : window?.overrideUserInterfaceStyle
        
        if interfaceStyle != .dark {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }
    
    @objc func addToWordListTapped() {
        guard let wordToAdd = searchTextField.text, !wordToAdd.isEmpty else {
            // TextField boşsa işlemi yapma
            showAlert(title: "Error!", message: "Please enter a word.") {
                //
            }
            return
        }
        wordsList.append(wordToAdd)
        print(wordsList.count)
        print(wordsList)
        wordsCollectionView.reloadData()
        searchTextField.text = nil
        updateButtonFunctionality()
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text ?? ""
        
        textField.resignFirstResponder()
        print("Text : \(text)")
        
        textField.text = ""
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // textfield rakam yasagi
        if textField == searchTextField {
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            let containsNumber = newText.rangeOfCharacter(from: .decimalDigits) != nil
            
            if !containsNumber {
                return true // yazilabilir
            } else {
                return false // yazilamaz
            }
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if searchTextField.text?.isEmpty == true {
             searchButton.isEnabled = false
            print("buton aktif degil")
         } else {
             searchButton.isEnabled = true
             print("buton aktif")
         }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wordsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordsCustomCollectionViewCell.identifier, for: indexPath) as! WordsCustomCollectionViewCell
        cell.configureLabel(label: "\(wordsList[indexPath.row])")
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.label.cgColor
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
}
