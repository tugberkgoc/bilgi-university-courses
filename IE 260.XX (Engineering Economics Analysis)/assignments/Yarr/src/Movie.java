
public class Movie {

	public String id;
	public String rate;
	public Movie(String id, String rate) {
		this.id = id;
		this.rate = rate;
	}
	@Override
	public String toString() {
		return "Movie [id=" + id + ", rate=" + rate + "]";
	}

}
