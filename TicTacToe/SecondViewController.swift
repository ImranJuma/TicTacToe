//
//  SecondViewController.swift
//  TicTacToe
//
//  Created by Imran Juma on 2018-03-28.
//  Copyright © 2018 Imran Juma. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //Button that will allow us to go back to the orignial viewController

    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
