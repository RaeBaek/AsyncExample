//
//  ViewController.swift
//  AsyncExample
//
//  Created by 백래훈 on 2023/02/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        // 이미지 다운로드 -> 이미지 뷰에 셋팅
        //https://img.redbull.com/images/w_3000/q_auto,f_auto/redbullcom/2016/08/11/1331811639859_2/gallery-tahiti-adriano-de-souza-standing-tall-in-the-tube
        
        guard let imageURL: URL = URL(string: "https://img.redbull.com/images/w_3000/q_auto,f_auto/redbullcom/2016/08/11/1331811639859_2/gallery-tahiti-adriano-de-souza-standing-tall-in-the-tube") else {
            return
        }
        
        OperationQueue().addOperation {
            do {
                let imageDate: Data = try Data.init(contentsOf: imageURL)
                guard let image: UIImage = UIImage(data: imageDate) else {
                    return
                }
                OperationQueue.main.addOperation {
                    self.imageView.image = image
                }
            } catch {
                return
            }
        }
    }
}
