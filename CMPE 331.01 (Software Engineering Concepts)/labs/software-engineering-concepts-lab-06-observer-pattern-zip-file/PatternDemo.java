public class PatternDemo {
  public static void main(String[] args) {
    //Create instances of InfoBoard and Statistics observers.
    InfoBoard infoBoard = new InfoBoard();
    Statistics statistics = new Statistics();
    //Create one object of MatchData Subject to display information.
    MatchData matchData = new MatchData();
    matchData.registerObserver(infoBoard);
    matchData.registerObserver(statistics);
    matchData.dataChanged();
    matchData.unregisterObserver(statistics);
    matchData.dataChanged();
  }
}