import UIKit

class ManageSightingViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var bowViewModel: BowViewModel?
    
    @IBOutlet weak var distanceValueLabel: UILabel!
    
    @IBAction func distanceChanged(_ sender: UISlider) {
        distanceValueLabel?.text = "\(round(sender.value))"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedSighting = bowViewModel?.selectedSighting else {return}
        distanceValueLabel?.text = selectedSighting.distance.description
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        return HalfScreenPresentation(presentedViewController: presented, presenting: presenting)
        
    }
    
    @IBAction func cancelView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveSighting(_ sender: Any) {
        
        let sighting = Sighting()
        sighting.distance = Double(distanceValueLabel?.text.value)
    }
}



// this is a super simple subclass of UIPresentationController
// where the only method overridden is `frameOfPresentedViewInContainerView`

class HalfScreenPresentation: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView : CGRect {
        
        let containerFrame = self.containerView!.frame
        
        return CGRect(x: 0, y: containerFrame.height/2, width: containerFrame.width, height: containerFrame.height/2)
        
    }
    
    /*
     // implement this method to add extra views, e.g. a semi-transparent 'dimmer' view
     override func presentationTransitionWillBegin() {
     <#code#>
     }
     
     
     // implement this method to remove any extra views
     override func presentationTransitionDidEnd(completed: Bool) {
     <#code#>
     }
     
     // implement this method to respond to change in size (e.g. screen rotation)
     override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
     <#code#>
     }*/
    
}
