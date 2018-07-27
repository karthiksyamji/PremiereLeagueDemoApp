//
//  TeamListViewController.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/25/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import UIKit

class TeamListViewController: UIViewController {
    
    let manager = TeamDataManager()
    var teamList = [TeamData]()

    @IBOutlet weak var teamListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = Texts.Titles.teamList
        fetchTeamList()
        getToken()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Custom Methods

extension TeamListViewController {
    
    func fetchTeamList(){
        manager.getTeamList { (error) in
            if let error = error {
                self.showAlert(error.localizedDescription, actions: nil)
                return
            }
            self.initializeView()
        }
    }
    
    func getToken() {
        manager.getBearerToken { (success, error) in
            
        }
    }
    
    func initializeView() {
        teamListTable.register(UINib.init(nibName: Texts.CustomNib.TeamDetailTableViewCell, bundle: nil), forCellReuseIdentifier: Texts.CustomNib.TeamDetailTableViewCell)
        guard let teamList = manager.teamDetails else {
            return
        }
        self.teamList = teamList
    }
}

//MARK:- TableView Data Source and Delegates

extension TeamListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :  TeamDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: Texts.CustomNib.TeamDetailTableViewCell) as! TeamDetailTableViewCell
        cell.model = TeamListCellModel(teamData: self.teamList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tweetVC = self.storyboard?.instantiateViewController(withIdentifier: Texts.ViewControllers.teamVC) as! TeamTweetsViewController
        tweetVC.tweetKeyword = self.teamList[indexPath.row].hashTag
        self.navigationController?.pushViewController(tweetVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

