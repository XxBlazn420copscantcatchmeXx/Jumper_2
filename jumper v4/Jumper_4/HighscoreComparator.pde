import java.util.Comparator;

class HighscoreComparator implements Comparator<Highscore> {
  public int compare(Highscore h1, Highscore h2){
    return -Integer.compare(h1.score, h2.score);
  }
}
