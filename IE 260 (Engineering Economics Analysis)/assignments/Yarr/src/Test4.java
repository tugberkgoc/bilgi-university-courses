import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Test4 {
	public static void main(String[] args) {
		HashT<Integer,HashT> data = new HashT<Integer, HashT>();
		// Adding Key and Value pairs to data
		// System.out.println(data.containsKey("Key1"));
		// System.out.println(data.get("Key1"));

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
				int[] intData=new int[4];
				for (int i = 0; i < tempData.length; i++) {
					intData[i]=Integer.parseInt(tempData[i]);
				}
				if (data.contains(intData[0])) {
					data.get(intData[0]).put(intData[1], intData[2]);
				} 
				else {
					HashT<Integer, Integer> nestedTree=new HashT<>();
					nestedTree.put(intData[1], intData[1]);
					data.put(intData[0], nestedTree);
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
		System.out.println(data.keys());
		for (int s : data.keys()) {
			HashT a=data.get(s);
			System.out.println(s+" "+a.keys());
		}
			
    }
	}

