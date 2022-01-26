//
//  TestTableViewCell.swift
//  Diff-Practice
//
//  Created by Zoe on 2022/01/26.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var reactionLabel: UILabel!
    @IBOutlet weak var fileImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    // MARK: - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Functions
    
    func setCell(data: DummyModel) {
        self.messageLabel.text = "\(data.message)"
        self.reactionLabel.text = "reaction.count: \(data.reaction.count)"
        if data.files.isEmpty {
            fileImageView.isHidden = true
        } else {
            fileImageView.isHidden = false
        }
        self.commentLabel.text = "comment.count: \(data.comments.count)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
