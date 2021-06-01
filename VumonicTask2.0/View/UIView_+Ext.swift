//
//  UIView_+Ext.swift
//  VumonicTask2.0
//
//  Created by Suresh Swaminathan on 01/06/21.
//

import UIKit
extension UIView{
    
    func pin(to superView: UIView) //  set contraints in super view
    {
        translatesAutoresizingMaskIntoConstraints                               = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive             = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive     = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive   = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive       = true
    }
}
