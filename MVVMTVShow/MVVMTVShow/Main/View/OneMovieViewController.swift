//
//  File.swift
//  MVVMTVShow
//
//  Created by Jordi Milla on 03/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class OneMovieViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
     var data: Movie?
       
       override func viewDidLoad() {
           super.viewDidLoad()

           labelName.text = data?.name

           let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
           let myAttrString = NSAttributedString(string: data?.summary.htmlToString ?? "", attributes: myAttribute)
           
           
           labelDescription.attributedText = myAttrString
           image.sd_setImage(with: URL(string: data?.images.medium ?? ""), placeholderImage: UIImage(named: ""))
           
        
       }

}
