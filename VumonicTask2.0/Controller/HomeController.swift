//
//  HomeController.swift
//  VumonicTask2.0
//
//  Created by Suresh Swaminathan on 01/06/21.
//
import UIKit
class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public var collectionView: UICollectionView? // declaring collection view
    private let Stories  = ["Profile","Profile3","Profile2","Profile1","Profile","Profile3","Profile3",
                           "Profile1","Profile2","Profile3","Profile","Profile2","Profile1"] //
    var tableView = UITableView() // create tableview
    var post: [Post] = [] // create empty array
    
    struct Cells {
        static let feedCell = "feedcell" // asign cell identifier
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.post = fetchdata()
        view.backgroundColor = .white
        configureNavigationBar() // call navigation bar
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.sectionInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.identifier)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        
        guard let myCollection = collectionView else {
            return
        }
        
        view.addSubview(tableView)
        view.addSubview(myCollection)
        configureTableView()
        tableView.contentInset = UIEdgeInsets(top: myCollection.bounds.height+100, left: 0, bottom: 0, right: 0)
    }
    
    func configureTableView(){
        setTableViewDelegates()
        tableView.rowHeight = 400 // set cell height
        tableView.register(HomePostCell.self, forCellReuseIdentifier: Cells.feedCell) // register tableview cell
        tableView.pin(to: view) //set constrsint super view
    }
    // set delegate and datasource
    func  setTableViewDelegates(){
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: 130).integral
    }
    // Number of collection cell- stories
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Stories.count
        
    }
    // stories cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.identifier, for: indexPath) as! StoriesCollectionViewCell
        cell.configure(with: Stories[indexPath.row])
        
        
        return cell
    }
    // navigation bar
    private func configureNavigationBar() {
        self.navigationItem.leftBarButtonItem =  UIBarButtonItem(title: "Vumonicgram", style: .plain, target: self, action: nil)
        let addImage    = UIImage(systemName: "plus.square")!
        let directImage  =  UIImage(systemName: "paperplane")!
        let directButton   = UIBarButtonItem(image: directImage,  style: .plain, target: self, action: nil)
        let addButton = UIBarButtonItem(image: addImage,  style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [directButton, addButton]
        
    }
}

extension HomeViewController:  UITableViewDelegate,UITableViewDataSource{
    // Number of cells in tableview - timeline
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    // timeline post cell - tableviewcell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.feedCell) as! HomePostCell
        cell.selectionStyle = .none
        cell.setdata(post: post[indexPath.row])
        return cell
    }
}



extension HomeViewController{//  using static data
    func  fetchdata() ->[Post]
    {
        let post1 = Post(user: User(username: "Suresh Swaminathan", profileImageUrl : "Profile3"), imageUrl:
                            "one", caption: "Liked by Karthithikeyan and ", creationDate: Date())
        let post2 = Post(user: User(username: "Arun Kumar",profileImageUrl : "Profile1"), imageUrl:
                            "two", caption: "Liked by Manikandan and ", creationDate: Date())
        let post3 = Post(user: User(username: "Kavitha",profileImageUrl : "Profile2"), imageUrl:
                            "three", caption: "Liked by suresh and ", creationDate: Date())
        let post4 = Post(user: User(username: "Manikandan", profileImageUrl : "Profile"), imageUrl:
                            "four", caption: "Liked by Aravind and ", creationDate: Date())
        let post5 = Post(user: User(username: "Karthithikeyan", profileImageUrl : "Profile3"), imageUrl:
                            "five", caption: "Liked by Manikandan and ", creationDate: Date())
        let post6 = Post(user: User(username: "Aravind", profileImageUrl : "Profile2"), imageUrl:
                            "six", caption: "Liked by Swaminathan and ", creationDate: Date())
        let post7 = Post(user: User(username: "Kanishka", profileImageUrl : "Profile1"), imageUrl:
                            "seven", caption: "Liked by Arun Kumar and ", creationDate: Date())
        let post8 = Post(user: User(username: "Swaminathan", profileImageUrl : "Profile"), imageUrl:
                            "one", caption: "Liked by Kavitha and ", creationDate: Date())
        let post9 = Post(user: User(username: "Siva Shankar", profileImageUrl : "Profile2"), imageUrl:
                            "two", caption: "Liked by Karthithikeyan and ", creationDate: Date())
        let post10 = Post(user: User(username: "Venkateshwaran", profileImageUrl : "Profile3"), imageUrl:
                            "three", caption: "Liked by Suresh Swaminathan and ", creationDate: Date())
        return [post1,post2,post3,post4,post5,post6,post7,post8,post9,post10]
        
    }
}

