import java.io.File;
import java.io.FileWriter;
import java.io.FileNotFoundException;  
import java.util.Collections; 
import java.util.Scanner; 

public class HighscoreController{
  private File highscoreFile = new File("Highscore.txt");
  
  private void createHighscoreFile(){
    try{
      highscoreFile.createNewFile();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  public void saveScore(Highscore score) {
    if(!highscoreFile.exists()){
      createHighscoreFile();
    }
    
    try{
      FileWriter scoreWriter = new FileWriter(highscoreFile, true);
      scoreWriter.write(score.name + "," + score.score + "\n");
      scoreWriter.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  public ArrayList<Highscore> loadScores(){
    ArrayList<Highscore> scores = new ArrayList<Highscore>();
    
    if(!highscoreFile.exists()){
      return scores;
    }
    
    try{
      Scanner scoreReader = new Scanner(highscoreFile);
      while (scoreReader.hasNextLine()) {
        String data = scoreReader.nextLine();
        try {
          String[] splitted = data.split(",");
          String name = splitted[0];
          int score = Integer.parseInt(splitted[1]);
          scores.add(new Highscore(name, score));
        }
        catch(NumberFormatException e){
          e.printStackTrace();
        }
      }
      scoreReader.close();
      Collections.sort(scores, new HighscoreComparator());
    } 
    catch(FileNotFoundException e){
      e.printStackTrace();
    }
    
    return scores;
  }
}
