//
//  ViewController.swift
//  pleaseWork
//
//  Created by ani kvitsiani on 04.11.23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let images = ["Image", "Image1", "Image2", "Image3", "Image4", "Image5"]
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.posterImageView.image = UIImage(named: images[indexPath.row])
        
        cell.backgroundColor = .green
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2-16*2, height: 230)

    }
    
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemBlue
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        
        
        let button = UIButton(type: .system)
        button.setTitle("Profile", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        
        
        
        let iconImageView = UIImageView(image: UIImage(named: "logo"))
        iconImageView.contentMode = .scaleAspectFit
        
        button.widthAnchor.constraint(equalToConstant: 77).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        iconImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        
        
        
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(button)
        
        
        
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .green
        setupHeader()
        setupCollectionView()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        //        setupCollectionView()
    }
    
    
    func setupHeader(){
        self.view.addSubview(mainStackView)
        
        let screenHeight = Int(UIScreen.main.bounds.height)
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(mainStackView)
        view.addSubview(container)
        
        
        
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -CGFloat((screenHeight-44-64))).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        container.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        //argamovida eseni ratomgaac....
        
        
        
        
        
        //check to make sure button is showing later
        
    }
    
    
    
    let collectionView: UICollectionView = {
        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 10
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        
        let label = UILabel()
        label.text = "Now in cinemas"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        stackView.addArrangedSubview(label)
        
        return stackView
    }()
    
    func setupCollectionView() {
        self.view.addSubview(secondStackView)
        
        secondStackView.backgroundColor = .red
        secondStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        secondStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        secondStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        secondStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        secondStackView.addArrangedSubview(collectionView)
    }
}


class CustomCell: UICollectionViewCell {
    
    
    let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "movie name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(posterImageView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
        ])
        
        
    }
}
    
    
    //
    //    func createHeader(){
    //        let headerStackView = UIStackView()
    //        headerStackView.axis = .horizontal
    //        headerStackView.alignment = .center
    //        headerStackView.distribution = .fill
    //        headerStackView.spacing = 16
    //        headerStackView.backgroundColor = .white
    //
    //        let iconImageView = UIImageView(image: UIImage(named: "logo"))
    //        iconImageView.contentMode = .scaleAspectFit
    //        iconImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
    //        iconImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    //
    //        let button = UIButton(type: .system)
    //        button.setTitle("Profile", for: .normal)
    //        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    //
    //        headerStackView.addArrangedSubview(iconImageView)
    //        headerStackView.addArrangedSubview(button)
    //
    //
    //        let headerContainer = UIView()
    //        headerContainer.addSubview(headerStackView)
    //
    //
    //            //container view constraints
    //        headerContainer.translatesAutoresizingMaskIntoConstraints = false
    //        headerContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
    //        headerContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    //        headerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    //        headerContainer.heightAnchor.constraint(equalToConstant: 64).isActive = true
    //
    //
    //            //constraints
    //        headerStackView.translatesAutoresizingMaskIntoConstraints = false
    //        headerStackView.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 8).isActive = true
    //        headerStackView.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: -8).isActive = true
    //        headerStackView.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor).isActive = true
    //        headerStackView.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor).isActive = true
    //
    //        view.addSubview(headerStackView)
    //        view.addSubview(headerContainer)
    //
    //
    //
    //
    //    }
    //
    //


