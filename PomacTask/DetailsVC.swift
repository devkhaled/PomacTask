//
//  DetailsVC.swift
//  PomacTask
//
//  Created by Khaled Rashed on 8/27/20.
//  Copyright © 2020 Khaled Rashed. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsVC: UIViewController {

    @IBOutlet var topView: UIView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var generalView: UIView!
    @IBOutlet var articleImg: UIImageView!
    @IBOutlet var articleTitleLbl: UILabel!
    @IBOutlet var byLbl: UILabel!
    @IBOutlet var readBtn: UIButton!
    @IBOutlet var copyRightLbl: UILabel!
    @IBOutlet var sectionLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!

    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()


        articleTitleLbl.text = article?.title
        articleImg.sd_setImage(with: URL(string: article!.media[0].mediaMetadata[1].url))
        byLbl.text = article?.byline
        readBtn.addShadowCornerRedius(cornerRadius: 3)
        articleImg.addShadowCornerRedius(cornerRadius: 10)
        copyRightLbl.text = article?.media[0].copyright
        sectionLbl.text = article?.section


        // handle the date
        let articleDate = article?.publishedDate
        let formator1 = DateFormatter()
        formator1.dateFormat = "yyyy-MM-dd"
        var date1 = formator1.date(from: articleDate!)
        let formater2 = DateFormatter()
        formater2.dateFormat = "MM dd yyyy"
        dateLbl.text =  formater2.string(from: date1!)



    }


    @IBAction func backAction(_ sender: Any) {

        navigationController?.popViewController(animated: true)
    }


    @IBAction func readAction(_ sender: Any) {

        UIApplication.shared.openURL(NSURL(string: article?.url ?? "")! as URL)


    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
