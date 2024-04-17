//
//  OnboardingViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 22.03.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    private var pages = [OnboardingPartViewController]()
    private var currentPageIndex = 0
    
    private var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    private let nextButton = CustomButtonView()
    
    var viewOutput: OnboardingViewOutput?
    
    init(pages: [OnboardingPartViewController] = [OnboardingPartViewController](), viewOutput: OnboardingViewOutput? = nil) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupPageViewController()
        setupPageControl()
        setupButton()
        addSubviews()
        makeConstraints()
    }
}


//MARK: OnboardingViewController Layout
private extension OnboardingViewController {
    
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupButton() {
        nextButton.setColorScheme(scheme: .white)
        nextButton.buttonAction = { [weak self] in
            self?.nextButtonTapped()
        }
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        let page = pages[0]
        let title = page.buttonText
        nextButton.setTitleButton(title: title)
        pageControl.isUserInteractionEnabled = false
    }
    
    func addSubviews() {
        [nextButton, pageControl].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(99)
            make.width.equalTo(133)
            make.height.equalTo(40)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
        }
    }
}

//MARK:  Actions
private extension OnboardingViewController {
    
    @objc func nextButtonTapped() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true, completion: nil)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true, completion: nil)
        case 2:
            viewOutput?.onboardingFinish()
            print("Exit")
        default:
            break
        }
    }
}

//MARK: UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex > 0 else { return nil }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex < pages.count - 1 else { return nil }
        
        return pages[currentIndex + 1]
    }
}

//MARK: UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPartViewController) {
            pageControl.currentPage = index
            currentPageIndex = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = currentPageIndex
            let page = pages[currentPageIndex]
            let title = page.buttonText
            nextButton.setTitleButton(title: title)
        }
    }
}
