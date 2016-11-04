//
//  ViewController.swift
//  sight-marker
//
//  Created by Ian Gristock on 03/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import Material

class RootViewController: UIViewController {
    internal var addButton: FabButton!
    internal var audioLibraryMenuItem: MenuItem!
    internal var reminderMenuItem: MenuItem!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = Color.grey.lighten5
        
        prepareAddButton()
        prepareAudioLibraryButton()
        prepareBellButton()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        prepareMenuController()
    }
    
    /// Handle the menu toggle event.
    internal func handleToggleMenu(button: Button) {
        guard let mc = menuController as? AppMenuController else {
            return
        }
        
        if mc.menu.isOpened {
            mc.closeMenu { (view) in
                (view as? MenuItem)?.hideTitleLabel()
            }
        } else {
            mc.openMenu { (view) in
                (view as? MenuItem)?.showTitleLabel()
            }
        }
    }
    
    private func prepareAddButton() {
        addButton = FabButton(image: Icon.cm.add, tintColor: .white)
        addButton.pulseColor = .white
        addButton.backgroundColor = Color.red.base
        addButton.addTarget(self, action: #selector(handleToggleMenu), for: .touchUpInside)
    }
    
    private func prepareAudioLibraryButton() {
        audioLibraryMenuItem = MenuItem()
        audioLibraryMenuItem.button.image = Icon.cm.edit
        audioLibraryMenuItem.button.tintColor = .white
        audioLibraryMenuItem.button.pulseColor = .white
        audioLibraryMenuItem.button.backgroundColor = Color.green.base
        audioLibraryMenuItem.button.depthPreset = .depth1
        audioLibraryMenuItem.title = "Add Scope Setting"
    }
    
    private func prepareBellButton() {
        reminderMenuItem = MenuItem()
        reminderMenuItem.button.image = Icon.cm.settings
        reminderMenuItem.button.tintColor = .white
        reminderMenuItem.button.pulseColor = .white
        reminderMenuItem.button.backgroundColor = Color.blue.base
        reminderMenuItem.title = "Manage Bows"
    }
    
    private func prepareMenuController() {
        guard let mc = menuController as? AppMenuController else {
            return
        }
        
        mc.menu.delegate = self
        mc.menu.views = [addButton, audioLibraryMenuItem, reminderMenuItem]
        //mc.transition(to: self.storyboard?.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController)
    }
}

/// MenuDelegate.
extension RootViewController: MenuDelegate {
    func menu(menu: Menu, tappedAt point: CGPoint, isOutside: Bool) {
        
        print(menu)
        print(point)
        guard let mc = menuController as? AppMenuController else {
            return
        }
        mc.transition(to: self.storyboard?.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController)
        
        //mc.transition(to: self.storyboard?.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController,  duration: 0.5, from: self)
        mc.closeMenu { (view) in
            (view as? MenuItem)?.hideTitleLabel()
        }
        guard isOutside else {
            return
        }
        
        

    }
}


