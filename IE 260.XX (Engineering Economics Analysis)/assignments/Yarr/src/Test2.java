import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;

public class Test2 {
	public static void main(String[] args) {
		Hashtable<String, ArrayList<Movie>> hashtable = new Hashtable<String, ArrayList<Movie>>();

		// Adding Key and Value pairs to Hashtable
		// System.out.println(hashtable.containsKey("Key1"));
		// System.out.println(hashtable.get("Key1"));

		// TODO Auto-generated method stub
		// The name of the file to open.
		String fileName = "u.data";

		// This will reference one line at a time
		String line = null;

		try {
			// FileReader reads text files in the default encoding.
			FileReader fileReader = new FileReader(fileName);

			// Always wrap FileReader in BufferedReader.
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			
			while ((line = bufferedReader.readLine()) != null) {
				// System.out.println(line);
				String[] tempData = line.split("\t");
				if (hashtable.containsKey(tempData[0])) {
					hashtable.get(tempData[0]).add(new Movie(tempData[1], tempData[2]));
				} 
				else {
					ArrayList<Movie> list = new ArrayList<>();
					list.add(new Movie(tempData[1], tempData[2]));
					hashtable.put(tempData[0], list);
				}
			}

			// Always close files.
			bufferedReader.close();
		} catch (FileNotFoundException ex) {
			System.out.println("Unable to open file '" + fileName + "'");
		} catch (IOException ex) {
			System.out.println("Error reading file '" + fileName + "'");
			// Or we could just do this:
			// ex.printStackTrace();
		}
		System.out.println(hashtable.get("186"));
	}
}
