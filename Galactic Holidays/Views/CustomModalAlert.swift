//
//  CustomModalAlert.swift
//  A11y Box
//
//  Created by Rob Whitaker on 09/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import UIKit

protocol CustomModalAlertDelegate: AnyObject {
    func dismiss()
}

class CustomModalAlert: UIView {

    weak var delegate: CustomModalAlertDelegate?

    var message: String? {
        didSet {
            messageLabel.text = message
        }
    }

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let view = UINib(nibName: "CustomModalAlert",
                         bundle: Bundle.main).instantiate(withOwner: self,
                                                          // swiftlint:disable:next force_cast
                                                          options: nil).first as! UIView

        view.frame = bounds
        addSubview(view)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @IBAction
    func dismissPressed() {
        self.delegate?.dismiss()
    }
}
