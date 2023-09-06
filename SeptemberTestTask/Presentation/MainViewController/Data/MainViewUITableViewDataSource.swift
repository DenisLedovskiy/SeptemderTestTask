import Foundation
import UIKit
import CoreData

class MainViewUITableViewDataSource: NSObject, UITableViewDataSource {

    var content = [String]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainTableCell.getCell(tableView, for: indexPath)
        cell.configure(content[indexPath.row])
        return cell
    }
}
