//
//  PageViewController.swift
//  tygate
//
//  Created by ashwin challa on 1/21/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit


class PageViewController: UIViewController,UIScrollViewDelegate{
    
    let webserviceController = WebserviceController.init()

        @IBOutlet weak var skip: UIButton!
        
        @IBOutlet weak var scrollView: UIScrollView!{
            didSet{
                scrollView.delegate = self
            }
        }
        @IBOutlet weak var getStartedBtn: UIButton!
        @IBOutlet weak var pagenation: UIPageControl!
        
        var pages:[Page] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pages = createPages()
        setupPageScrollView(pages: pages)
        
        pagenation.numberOfPages = pages.count
        pagenation.currentPage = 0
        view.bringSubviewToFront(pagenation)

        // Do any additional setup after loading the view.
        
        webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func createPages() -> [Page] {
        
        let page1:Page = Bundle.main.loadNibNamed("Page", owner: self, options: nil)?.first as! Page
        page1.pageImage.image = UIImage(named: "burn")
        
        let page2:Page = Bundle.main.loadNibNamed("Page", owner: self, options: nil)?.first as! Page
        page2.pageImage.image = UIImage(named: "burn")
        
        let page3:Page = Bundle.main.loadNibNamed("Page", owner: self, options: nil)?.first as! Page
        page3.pageImage.image = UIImage(named: "burn")
        
        let page4:Page = Bundle.main.loadNibNamed("Page", owner: self, options: nil)?.first as! Page
        page4.pageImage.image = UIImage(named: "burn")
        
        let page5:Page = Bundle.main.loadNibNamed("Page", owner: self, options: nil)?.first as! Page
        page5.pageImage.image = UIImage(named: "burn")
        
        return [page1, page2, page3, page4, page5]
    }
    
    
    func setupPageScrollView(pages : [Page]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(pages[i])
        }
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pagenation.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            pages[0].pageImage.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            pages[1].pageImage.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            pages[1].pageImage.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            pages[2].pageImage.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            pages[2].pageImage.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            pages[3].pageImage.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            pages[3].pageImage.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            pages[4].pageImage.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        if(pagenation.currentPage == 0) {
            
            let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pagenation.pageIndicatorTintColor = pageUnselectedColor
            
            
            let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pages[pagenation.currentPage].backgroundColor = bgColor
            
            let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pagenation.currentPageIndicatorTintColor = pageSelectedColor
        }
    }


    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    
    @IBAction func getStarted(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(ViewController, animated:true, completion:nil)
        
    }
    @IBAction func paginationAction(_ sender: Any)
    {
        
    }
    @IBAction func skipBtn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(ViewController, animated:true, completion:nil)
        
    }
    
}
