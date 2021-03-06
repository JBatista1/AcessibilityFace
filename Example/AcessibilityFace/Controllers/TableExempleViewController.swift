//
//  TableExempleViewController.swift
//  AcessibilityFaceMovimentBR
//
//  Created by Joao Batista on 13/02/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//

import UIKit
import AcessibilityFace

class TableExempleViewController: AccessibilityFaceAnchorViewController {

  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    setDelegates()
    voiceAction.initialRecording()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    action.set(viewsAction: createViewAction())
  }

  
  func setDelegates() {
    delegateNavigationBar = self
    delegateTabBar = self
    delegateCellView = self
    delegateScroll = self
  }

  func createViewAction() -> [ViewAction] {
    var viewsAction: [ViewAction] = [ViewAction(view: tableView, selector: #selector(selectedCell(_:)))]
    viewsAction.append(contentsOf: getViewActionNavigationAndTabBar())
    return viewsAction
  }
}

extension TableExempleViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 15
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.tag = indexPath.row
    cell.textLabel?.text = "AQUI Cell\(indexPath.row)"
    return cell
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Sessão \(section)"
  }
}

extension TableExempleViewController: CellViewSelectedProtocol {
  func cellSelected(withIndex index: IndexPath) {
    title = "Row \(index.row)"
  }

}

extension TableExempleViewController: TabBarSelectedProtocol, NavigationBackButtonProtocol, ScrollActionDelegate {

  func tabBar(isSelectedIndex index: Int) {
    tabBarController?.selectedIndex = index
  }

  func actionNavigationBack() {
    navigationController?.popViewController(animated: true)
  }
  func scrollNext() {
    tableView.nextCell()
  }

  func scrollBack() {
    tableView.backCell()
  }
}

