////
////  AircrewDataPageViewController.swift
////  Logging
////
////  Created by Bethany Morris on 10/28/20.
////  Copyright © 2020 Christian Brechbuhl. All rights reserved.
////
//
//import UIKit
//
//class AircrewPageViewController: UIPageViewController {
//
//    // MARK: - Properties
//
//    let lastName = ""
//    let firstName = ""
//    let ssnLast4 = ""
//    let flightAuthDutyCode = ""
//    let flyingOrigin = ""
//    let prim = ""
//    let sec = ""
//    let instr = ""
//    let eval = ""
//    let other = ""
//    let time = ""
//    let srty = ""
//    let nightPSI = ""
//    let insPIE = ""
//    let simInsPIE = ""
//    let nvg = ""
//    let combatTime = ""
//    let combatSrty = ""
//    let combatSptTime = ""
//    let combatSptSrty = ""
//    let resvStatus = ""
//
//    weak var pageViewDelegate: AircrewPageViewControllerDelegate?
//
//    private(set) lazy var orderedViewControllers: [AircrewPopUpViewController] = {
//        // The view controllers will be shown in this order
//        return [self.newAircrewPopUpViewController("1"),
//                self.newAircrewPopUpViewController("2"),
//                self.newAircrewPopUpViewController("3")]
//    }()
//
//    // MARK: - Lifecycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        dataSource = self
//        delegate = self
//
//        if let initialViewController = orderedViewControllers.first {
//            scrollToViewController(viewController: initialViewController)
//        }
//
//        pageViewDelegate?.pageViewController(pageViewController: self, didUpdatePageCount: orderedViewControllers.count)
//
//        if let popUp3ViewController = orderedViewControllers.last {
//            //popUp3ViewController.label.text = "Hello world!"
//            //popUp3ViewController.nightPSIE.text
//        }
//    }
//
//    // MARK: - Methods
//
//    /**
//     Scrolls to the next view controller.
//     */
//    func scrollToNextViewController() {
//        if let visibleViewController = viewControllers?.first,
//           let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
//                scrollToViewController(viewController: nextViewController)
//        }
//    }
//
//    /**
//    Scrolls to the view controller at the given index. Automatically calculates
//    the direction.
//
//    - parameter newIndex: the new index to scroll to
//    */
//    func scrollToViewController(index newIndex: Int) {
//        if let firstViewController = viewControllers?.first as? AircrewPopUpViewController,
//            let currentIndex = orderedViewControllers.firstIndex(of: firstViewController) {
//            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
//                let nextViewController = orderedViewControllers[newIndex]
//                scrollToViewController(viewController: nextViewController, direction: direction)
//        }
//    }
//
////    func scrollToNextViewController() {
////        if let visibleViewController = viewControllers?.first,
////           let nextViewController = pageViewController(self,
////                                                       viewControllerAfterViewController: visibleViewController) {
////            scrollToViewController(nextViewController)
////        }
////    }
//
//    private func newAircrewPopUpViewController(_ index: String) -> AircrewPopUpViewController {
//        return UIStoryboard(name: "Aircrew", bundle: nil) .
//            instantiateViewController(withIdentifier: "PopUp\(index)") as! AircrewPopUpViewController
//    }
//
//    /**
//    Scrolls to the given 'viewController' page.
//
//    - parameter viewController: the view controller to show.
//    */
//    private func scrollToViewController(viewController: UIViewController,
//                                        direction: UIPageViewController.NavigationDirection = .forward) {
//            setViewControllers([viewController],
//            direction: direction,
//            animated: true,
//            completion: { (finished) -> Void in
//            // Setting the view controller programmatically does not fire
//            // any delegate methods, so we have to manually notify the
//            // 'tutorialDelegate' of the new index.
//            self.notifyPageDelegateOfNewIndex()
//        })
//    }
//
//    /**
//    Notifies '_tutorialDelegate' that the current page index was updated.
//    */
//    private func notifyPageDelegateOfNewIndex() {
//        if let firstViewController = viewControllers?.first as? AircrewPopUpViewController,
//           let index = orderedViewControllers.firstIndex(of: firstViewController) {
//                pageViewDelegate?.pageViewController(pagePageViewController: self, didUpdatePageIndex: index)
//        }
//    }
//
//} //End
//
//// MARK: - UIPageViewControllerDataSource
//
//extension AircrewPageViewController: UIPageViewControllerDataSource {
//
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let popUpViewController = viewController as? AircrewPopUpViewController,
//              let viewControllerIndex = orderedViewControllers.firstIndex(of: popUpViewController) else {
//            return nil
//        }
//
//    let previousIndex = viewControllerIndex - 1
//
//    // User is on the first view controller and swiped left to loop to
//    // the last view controller.
//        guard previousIndex >= 0 else {
//            return orderedViewControllers.last
//        }
//
//        guard orderedViewControllers.count > previousIndex else {
//            return nil
//        }
//
//        return orderedViewControllers[previousIndex]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let popUpViewController = viewController as? AircrewPopUpViewController,
//              let viewControllerIndex = orderedViewControllers.firstIndex(of: popUpViewController) else {
//            return nil
//        }
//
//        let nextIndex = viewControllerIndex + 1
//        let orderedViewControllersCount = orderedViewControllers.count
//
//        // User is on the last view controller and swiped right to loop to
//        // the first view controller.
//        guard orderedViewControllersCount != nextIndex else {
//            return orderedViewControllers.first
//        }
//
//        guard orderedViewControllersCount > nextIndex else {
//            return nil
//        }
//
//        return orderedViewControllers[nextIndex]
//    }
//
//} //End
//
//extension AircrewPageViewController: UIPageViewControllerDelegate {
//
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            didFinishAnimating finished: Bool,
//                            previousViewControllers: [UIViewController],
//                            transitionCompleted completed: Bool) {
//        notifyPageDelegateOfNewIndex()
//    }
//}
//
//protocol AircrewPageViewControllerDelegate: class {
//    /**
//    Called when the number of pages is updated.
//
//    - parameter pagePageViewController: the PagePageViewController instance
//    - parameter count: the total number of pages.
//    */
//    func pageViewController(pageViewController: AircrewPageViewController,
//    didUpdatePageCount count: Int)
//
//    /**
//    Called when the current index is updated.
//
//    - parameter pagePageViewController: the PagePageViewController instance
//    - parameter index: the index of the currently visible page.
//    */
//    func pageViewController(pagePageViewController: AircrewPageViewController,
//    didUpdatePageIndex index: Int)
//
//} //End
