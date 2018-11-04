import java.util.Iterator;
import java.util.Observer;
import java.util.ArrayList;

public class MatchData implements Subject{
  int goals;
  int yellowCard;
  int redCard;
  int hitWoodwork;
  int normalShoots;
  ArrayList<Observer> observerList;

  public MatchData(){
    observerList = new ArrayList<Observer>();
  }
  public void registerObserver(Observer o) {
    observerList.add(o);
  }
  public void unregisterObserver(Observer o) {
    observerList.remove(observerList.indexOf(o));
  }
  public void notifyObservers(){
    for(Iterator<Observer> it = observerList.iterator(); it.hasNext();){
      Observer o = it.next();
      o.update(goals,yellowCard,redCard,hitWoodwork,normalShoots);
    }
  }
  public int getGoals(){
    return 5;
  }
  public int getYellowCard(){
    return 6;
  }
  public int getRedCard(){
    return 1;
  }
  public int getHitWoodwork(){
    return 3;
  }
  public int getNormalShoots(){
    return 14;
  }
  public void dataChanged() { 
        
        goals = getGoals(); 
        yellowCard = getYellowCard(); 
        redCard = getRedCard(); 
        normalShoots = getNormalShoots();
        hitWoodwork= getHitWoodwork();
  
        notifyObservers(); 
    }
}