//
//  DetailViewController.swift
//  Every
//
//  Created by Luiz on 6/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let priority = priorityLabel,
            let completed = completedLabel,
            let title = titleLabel,
                let description = descriptionLabel {
                priority.text = "Priority: \(String(detail.priorityNumber))"
                completed.text = "Completed: \(String(detail.isCompleted))"
                title.text = "Title: \(detail.title ?? "Non title")"
                description.text = "Description: \(detail.todoDescription ?? "Non description" ) "
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    var detailItem: ToDo? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

