import UIKit

extension ViewController {
	func setConstraints(){
        self.view.addSubview(self.buttonRandom)
        NSLayoutConstraint.activate([
            buttonRandom.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            buttonRandom.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonRandom.widthAnchor.constraint(equalToConstant: 300),
            buttonRandom.heightAnchor.constraint(equalToConstant: 50)
        ])
		
		self.view.addSubview(imageUser)
		NSLayoutConstraint.activate([
			imageUser.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
			imageUser.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			imageUser.widthAnchor.constraint(equalToConstant: 300),
			imageUser.heightAnchor.constraint(equalToConstant: 250)
		])
		
		self.view.addSubview(nameLabel)
		nameLabel.topAnchor.constraint(equalTo: self.imageUser.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(nameLabel)
		
		self.view.addSubview(emailLabel)
		emailLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(emailLabel)
		
		self.view.addSubview(ageLabel)
		ageLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(ageLabel)

		self.view.addSubview(addressLabel)
		addressLabel.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(addressLabel)

		self.view.addSubview(phoneNumberLabel)
		phoneNumberLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(phoneNumberLabel)
        
    }

	func			setLabelConstraints<Label: UILabel> (_ someLabel: Label){
		NSLayoutConstraint.activate([
			someLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			someLabel.widthAnchor.constraint(equalToConstant: 350),
			someLabel.heightAnchor.constraint(equalToConstant: 50)
		])
	}
}
