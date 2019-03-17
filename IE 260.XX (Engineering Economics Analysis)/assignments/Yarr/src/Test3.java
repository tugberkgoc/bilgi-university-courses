import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Test3 {
	public static HashT<Integer, Integer> intersection(HashT<Integer, HashT> data,int person1,int person2){
		HashT<Integer, Integer> temp= new HashT<>();
		HashT<Integer, Integer> tempPerson1=data.get(person1);
		HashT<Integer, Integer> tempPerson2=data.get(person2);
		data.get(person2);
		for(int i:tempPerson1.keys()){
			if(tempPerson2.contains(i)){
				temp.put(i, 1);
			}
		}
		return temp;
	}
	public static double 
	public static void main(String[] args) {
		HashT<Integer,String> item = new HashT<>();
		HashT<Integer,HashT> data = new HashT<Integer, HashT>();
		// Adding Key and Value pairs to data
		// System.out.println(data.containsKey("Key1"));
		// System.out.println(data.get("Key1"));

		// TODO Auto-generated method stub
		// The name of the file to open.
		String fileName[]=new String[3];
		fileName[0] = "u.data";fileName[1] = "u.item";

		// This will reference one line at a time
		String line = null;
		try {
			// FileReader reads text files in the default encoding.
			FileReader fileReader = new FileReader(fileName[1]);

			// Always wrap FileReader in BufferedReader.
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			
			while ((line = bufferedReader.readLine()) != null) {
				// System.out.println(line);
				String[] tempData = line.split("\\|");
				item.put(Integer.parseInt(tempData[0]), tempData[1]);

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
		
		
		try {
			// FileReader reads text files in the default encoding.
			FileReader fileReader = new FileReader(fileName[0]);

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
					nestedTree.put(intData[1], intData[2]);
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

		HashT<Integer, Integer> a= intersection(data, 31, 301);
		for(int i:a.keys()){
			System.out.println(i);
		}
		
		
//		for(int i:data.keys()){
//			LinearProbingHashST<Integer, Integer> movie= data.get(i);
//
//			for(int c:movie.keys()){
//				if(c==1){
//					System.out.println(i+":"+item.get(c)+":"+movie.get(c));
//				}
//				
//			}
//		}
//		for (int s : data.keys()) {
//			LinearProbingHashST<Integer, Integer> yarr= data.get(s);
//			//System.out.println(yarr.keys());
//			for(int i:yarr.keys()){
//				System.out.println(s+":"+ i +":"+yarr.get(i));
//			}
//		}
			
    }
	}

