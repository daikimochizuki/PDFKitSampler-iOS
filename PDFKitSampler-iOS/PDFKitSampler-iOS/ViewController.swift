//
//  ViewController.swift
//  PDFKitSampler-iOS
//
//  Created by Daiki Mochizuki on 2019/03/13.
//  Copyright © 2019 Daiki Mochizuki. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var pdfThumbnailView: PDFThumbnailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "PDFKit Sampler"
        
        if let path = Bundle.main.path(forResource: "pdf_sample", ofType: "pdf") {
            let url = URL(fileURLWithPath: path)
            if let pdfDocument = PDFDocument(url: url) {
                
                let rect = CGRect(x: 210, y: 350, width: 300, height: 50)
                let text = PDFAnnotation(bounds: rect, forType: .freeText, withProperties: nil)
                text.color = .clear
                text.font = UIFont.systemFont(ofSize: 20)
                text.fontColor = .black
                text.contents = "👏PDFKit Sampler👏"
                
                pdfView.autoScales = true
                pdfView.displayMode = .singlePage
                pdfView.displayDirection = .horizontal
                pdfView.usePageViewController(true, withViewOptions: [UIPageViewController.OptionsKey.interPageSpacing: 20])
                pdfDocument.page(at: 0)?.addAnnotation(text)
                pdfView.document = pdfDocument
                
                pdfThumbnailView.layoutMode = .horizontal
                pdfThumbnailView.pdfView = pdfView
            }
        }
    }
}

