//
//  ViewController.swift
//  JSON-Swift
//
//  Created by Mindrose on 26/05/17.
//  Copyright © 2017 Mindrose. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var actorsTableView: UITableView!
    
    var actorArray = [Actor]()

    var str :Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self .JsonFetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func JsonFetch () {
        let urlString: NSURL = NSURL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")!
        
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: urlString as URL)
        
         let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? NSDictionary{
                        //JSON PRINT..
               print(json)
                        if let actorsArray = json.value(forKey: "actors") as? NSArray {
                            
                            for actor in actorsArray {
                                
                            if let actorsDic = actor as? NSDictionary {
                                
                              //  UserDefaults.standard.setValue(actorsDic, forKey: "actorsDetails")
                          
                                let name: String = {
                                    if let name = actorsDic.value(forKey: "name")  {
                                        return name as! String
                                    }
                                    return " "
                                    
                                }()
                                let country: String = {
                                    if let country = actorsDic.value(forKey: "country"){
                                        return country as! String
                                    }
                                    return " "
                                }()
                                let image: String = {
                                    if let image = actorsDic.value(forKey: "image") {
                                        return image as! String
                                    }
                                    return " "
                                    
                                }()
                                self.actorArray.append(Actor(name: name, country: country, images: image))

                                OperationQueue.main.addOperation {
                                    
                                    self.actorsTableView.reloadData()
                                }
                                
                                }
                            }
                        }
                    }
                    
                }catch let err{
                    print(err.localizedDescription)
            }
            }
        }
        task.resume()
}
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! TableViewCell
        
        let actor = actorArray[indexPath.row]
     
        
        cell.nameLabel.text = actor.nameString
        
        cell.countryLabel.text = actor.countryString
        
        let imageURL = NSURL(string: actor.imageString)
        
        if imageURL != nil {
            let data = NSData(contentsOf: imageURL! as URL)
            
            cell.imageViewActors.image = UIImage(data: data! as Data)
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        str = indexPath.row
        let index = 0
       let dataToPass = actorArray[index] as Actor
        performSegue(withIdentifier: "push", sender:dataToPass)
  
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let controller = segue.destination as! DisplayViewController
       
        let actorData = actorArray[str]

        controller.displayActor = actorData.nameString
       controller.actorCountry = actorData.countryString
        controller.actorImage = actorData.imageString
}
}
