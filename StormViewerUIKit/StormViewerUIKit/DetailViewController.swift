//
//  DetailViewController.swift
//  StormViewerUIKit
//
//  Created by Jordan Fraughton on 3/13/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var imageIndex: Int?
    var photoCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Image \(imageIndex ?? 0 ) of \(photoCount ?? 0)"
        navigationItem.largeTitleDisplayMode = .never

        if let selectedImage {
            imageView.image = UIImage(named: selectedImage)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
