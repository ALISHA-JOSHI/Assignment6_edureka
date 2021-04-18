

import UIKit

class DetailViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
        
    let actionMovies = ["Apocalypse Now", "The Matrix", "Gladiator", "Mad Max: Fury Road", "Terminator 2: Judgement Day", "The Dark Knight Trilogy", "Die Hard Series"]
    let animationMovies = ["Toy Story 4", "Spider-Man", "Inside Out", "Coco", "Snow White and the Seven Dwarfs", "Rotten Tomatoes", "Paddington 2", "The Incredibles", "Zootopia"]
    let crimeMovies = ["The Little Things ", "The White Tiger", " Promising Young Woman", "Homefront", "The Next Three Days", "The Wolf of Wall Street"]
    let horrorMovies = ["Host", "Saw", "The Birds ", "Dawn of the Dead ", "Shaun of the Dead", "A Nightmare on Elm Street", "Evil Dead 2", "The Babadook", "The Cabin in the Woods"]
    let warMovies = ["Dara iz Jasenovca", "1917", "Inglourious Basterds", "Shadow in the Cloud", "Fury"]

    @IBOutlet weak var movieListTableView: UITableView!
    
    var genre : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.genre == "Action"{

           return self.actionMovies.count

        }else if genre == "Animation"{
            return  self.animationMovies.count

        }else if genre == "Horror"{
            return  self.horrorMovies.count
        }else if genre == "War"{
            return  self.warMovies.count
        }else{
            return  self.crimeMovies.count
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movieList = tableView.dequeueReusableCell(withIdentifier: "movieList", for: indexPath)
    
        if genre == "Action"{
            
            movieList.textLabel?.text = actionMovies[indexPath.row]
            
        }else if genre == "Animation"{
            movieList.textLabel?.text = animationMovies[indexPath.row]

            
        }else if genre == "Horror"{
            movieList.textLabel?.text = horrorMovies[indexPath.row]

        }else if genre == "War"{
            movieList.textLabel?.text = warMovies[indexPath.row]

        }else{
            movieList.textLabel?.text = crimeMovies[indexPath.row]

        }
        
        movieList.backgroundColor = generateRandomColor()
        
        
        return movieList
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat.random(in: 0...1)
        let greenValue = CGFloat.random(in: 0...1)
        let blueValue = CGFloat.random(in: 0...1)
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 0.3)
        
        return randomColor
    }
    

}
