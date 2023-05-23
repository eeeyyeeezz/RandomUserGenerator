import UIKit

extension ViewController {
	func setConstraints(){
        view.addSubview(buttonRandom)
        NSLayoutConstraint.activate([
            buttonRandom.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonRandom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRandom.widthAnchor.constraint(equalToConstant: 300),
            buttonRandom.heightAnchor.constraint(equalToConstant: 50)
        ])
		
		view.addSubview(imageUser)
		NSLayoutConstraint.activate([
			imageUser.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			imageUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageUser.widthAnchor.constraint(equalToConstant: 300),
			imageUser.heightAnchor.constraint(equalToConstant: 250)
		])
		
		view.addSubview(nameLabel)
		nameLabel.topAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(nameLabel)
		
		view.addSubview(emailLabel)
		emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(emailLabel)
		
		view.addSubview(ageLabel)
		ageLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(ageLabel)

		view.addSubview(addressLabel)
		addressLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(addressLabel)

		view.addSubview(phoneNumberLabel)
		phoneNumberLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(phoneNumberLabel)
        
    }

	func setLabelConstraints<Label: UILabel> (_ someLabel: Label){
		NSLayoutConstraint.activate([
			someLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			someLabel.widthAnchor.constraint(equalToConstant: 350),
			someLabel.heightAnchor.constraint(equalToConstant: 50)
		])
	}
}
