
import UIKit
import Material

class AppMenuController: MenuController {
    private let baseSize = CGSize(width: 56, height: 56)
    private let bottomInset: CGFloat = 24
    private let rightInset: CGFloat = 24
    
    open override func prepare() {
        super.prepare()
        view.backgroundColor = Color.grey.lighten5
        
        prepareMenu()
    }
    
    open override func openMenu(completion: ((UIView) -> Void)? = nil) {
        super.openMenu(completion: completion)
        menu.views.first?.animate(animation: Motion.rotate(angle: 45))
    }
    
    open override func closeMenu(completion: ((UIView) -> Void)? = nil) {
        super.closeMenu(completion: completion)
        menu.views.first?.animate(animation: Motion.rotate(angle: 0))
    }
    
    private func prepareMenu() {
        menu.baseSize = baseSize
        
        view.layout(menu)
            .size(baseSize)
            .bottom(bottomInset)
            .right(rightInset)
    }
}

