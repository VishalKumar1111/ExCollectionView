

import UIKit

class ShowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tblSegment: UITableView!
    
    var arrshowmarried = [[String:Any]]()
    var arrchildshow = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSegment.delegate = self
        tblSegment.dataSource = self
            print("married arr \(arrshowmarried)")
            print("child arr \(arrchildshow)")
    }
    
    @IBAction func btnSegment(_ sender: Any) {
        tblSegment.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segment.selectedSegmentIndex {
        case 0:
            return arrshowmarried.count
        case 1:
            return arrchildshow.count
        default:
            break
        }
        return 0
    }
        
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 300.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "storytable"
        var cell: ExpTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? ExpTableViewCell
                if cell == nil {
                    tableView.register(UINib(nibName: "ExpTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ExpTableViewCell
                }
        switch self.segment.selectedSegmentIndex {
        case 0:
                cell.txtname.text = arrshowmarried[indexPath.row]["name"] as? String
                cell.btnMarried.isHidden = true
                cell.btnChild.isHidden = true
                
        case 1:
            
                cell.txtname.text = arrchildshow[indexPath.row]["name"] as? String
                cell.btnChild.isHidden = true
                cell.btnMarried.isHidden = true
            
        default:
            break
                        
        }
        
        return cell
    }


}
