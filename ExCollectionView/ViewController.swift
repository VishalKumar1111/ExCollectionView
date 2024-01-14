//
//  ViewController.swift
//  ExCollectionView
//
//  Created by RLogixxTraining on 24/08/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arr = [[String:Any]]()
    var arrmarri = [[String:Any]]()
    var arrchild =  [[String:Any]]()
    
    @IBOutlet weak var tblEmp: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblEmp.dataSource = self
        tblEmp.delegate = self
       // print(arr)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 300.0
    }
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data(base64Encoded: imageBase64String)
        let image = UIImage(data: imageData!)
        return image!
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "storytable"
        var cell: ExpTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? ExpTableViewCell
                if cell == nil {
                    tableView.register(UINib(nibName: "ExpTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ExpTableViewCell
                }
        //cell.imgMain.image = UIImage(named: "circle")
        cell.txtname.text = self.arr[indexPath.row]["name"] as? String
        cell.txtDescription.text = self.arr[indexPath.row]["age"] as? String
        cell.txtBranch.text = self.arr[indexPath.row]["branch"] as? String
        cell.TxtVwYear.text = self.arr[indexPath.row]["year"] as? String
        cell.btnMarried.addTarget(self, action: #selector(marryclick), for: .touchUpInside)
        cell.btnChild.addTarget(self, action: #selector(childclick), for: .touchUpInside)
        cell.btnChild.tag = indexPath.row
//        if self.arr[indexPath.row]["gender"] as? String == "married"{
//            cell.btnMarried.isEnabled = true
//            cell.btnChild.isHidden = true
//        }
//        if self.arr[indexPath.row]["gender"] as? String == "child"{
//            cell.btnChild.isHidden = true
//            cell.btnMarried.isHidden = true
//        }
        
        
        var data = arr[indexPath.row]["image"] as! String
        cell.imgMain.image = convertBase64StringToImage(imageBase64String: data)
        
        return cell
        
    }
    
    @objc func marryclick(sender : UIButton) {
       
        // print(self.arr[sender.tag]["name"] as? String)
        //print(arr)
        let dict = ["name" : self.arr[sender.tag]["name"] ?? "", "age" : self.arr[sender.tag]["age"] ?? "", "year" : self.arr[sender.tag]["year"] ?? "" , "branch" : self.arr[sender.tag]["branch"] ?? "" , "status" : "married"]
        arrmarri.append(dict)
        print(sender.tag)
        print(" marry array is \(arrmarri)")

        
    }
    @objc func childclick(sender : UIButton) {
       
//        print("tap")
//
//        print(sender.tag)
//        print(self.arr[sender.tag]["name"] as? String)
//        //print(arr)
        
        let dict = ["name" : self.arr[sender.tag]["name"] ?? "", "age" : self.arr[sender.tag]["age"] ?? "", "year" : self.arr[sender.tag]["year"] ?? "" , "branch" : self.arr[sender.tag]["branch"] ?? "" , "status" : "child"]
        arrchild.append(dict)
        print("child array is \(arrchild)")

        
    }
    
    
    @IBAction func btnShow(_ sender: Any) {
        
        let sc = self.storyboard?.instantiateViewController(withIdentifier: "show") as! ShowViewController
        sc.arrshowmarried = arrmarri
        sc.arrchildshow = arrchild
        self.navigationController?.pushViewController(sc, animated: true)
    }
    
    
}

