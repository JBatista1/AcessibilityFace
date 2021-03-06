//
//  ViewController.swift
//  AcessibilityFaceMovimentBR
//
//  Created by Joao Batista on 04/01/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//

import UIKit
import Speech
import AcessibilityFace

class MovimentTestViewController: AccessibilityFaceAnchorViewController {

  // MARK: - Outlets

  @IBOutlet weak var feedbackLabel: UILabel!
  
  // Views I
  @IBOutlet weak var viewOne: UIButton!
  @IBOutlet weak var viewTwo: UIButton!
  @IBOutlet weak var viewThree: UIButton!
  @IBOutlet weak var viewFour: UIButton!
  @IBOutlet weak var viewFive: UIButton!
  @IBOutlet weak var viewSix: UIButton!
  @IBOutlet weak var viewSeven: UIButton!
  @IBOutlet weak var viewEight: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    delegateTabBar = self
    voiceAction.initialRecording()
    voiceAction.delegate = self
    action.setTypeStartAction(withType: .eyeRight)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: true)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    action.set(viewsAction: createViewAction())
  }

  func createViewAction() -> [ViewAction] {
    var viewsAction: [ViewAction] = [ViewAction(view: viewOne, selector: #selector(MovimentTestViewController.actionOne)),
                                     ViewAction(view: viewTwo, selector: #selector(actionTwo)),
                                     ViewAction(view: viewThree, selector: #selector(actionThree)),
                                     ViewAction(view: viewFour, selector: #selector(actionFour)),
                                     ViewAction(view: viewFive, selector: #selector(actionFive)),
                                     ViewAction(view: viewSix, selector: #selector(actionSix)),
                                     ViewAction(view: viewSeven, selector: #selector(actionSeven)),
                                     ViewAction(view: viewEight, selector: #selector(actionEight))]
    viewsAction.append(contentsOf: getViewsActionWithTabBar())
    return viewsAction
  }

  @objc func actionOne() {
    feedbackLabel.text = "Lilaz"
  }

  @objc func actionTwo() {
    feedbackLabel.text = "Vermelho"
  }

  @objc func actionThree() {
    feedbackLabel.text = "Laranja"
  }

  @objc func actionFour() {
    feedbackLabel.text = "Azul marinho"
  }

  @objc func actionFive() {
    feedbackLabel.text = "amarelo"
  }

  @objc func actionSix() {
    feedbackLabel.text = "Verde"
  }

  @objc func actionSeven() {
    feedbackLabel.text = "Rosa"
  }

  @objc func actionEight() {
    feedbackLabel.text = "Roxo"
  }
}

extension MovimentTestViewController: TabBarSelectedProtocol {
  func tabBar(isSelectedIndex index: Int) {
    tabBarController?.selectedIndex = index
  }
}

extension MovimentTestViewController: VoiceActionResponseProtocol {
  func permissionGranted() {
    print("Permissão Permitida")
  }

  func errorPermission(status: SFSpeechRecognizerAuthorizationStatus) {
    print("Erro permissão")
  }

  func errorGeneric() {
    print("Generic Error")
  }
}
