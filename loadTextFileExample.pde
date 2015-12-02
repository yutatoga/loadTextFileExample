import processing.opengl.*;
BufferedReader reader;
String line;
ArrayList<PVector> dataArray = new ArrayList<PVector>();;
 
void setup() {
  size(400, 400, OPENGL);
  // Open the file from the createWriter() example
  reader = createReader("data.txt");    
  readData();
}
 
void readData(){
  line = "";
  while(line != null){
    try {
      line = reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line != null) {
      String[] pieces = split(line, ",");
      PVector v1 = new PVector(float(pieces[0]), float(pieces[1]), float(pieces[2]));
      dataArray.add(v1);
    }
  }
  println(dataArray);
}
 
void draw() {
  for (int i = 0; i < dataArray.size(); i++){
    pushMatrix();
      translate(dataArray.get(i).x, dataArray.get(i).y, dataArray.get(i).z);
      sphere(10);
    popMatrix();
  }
} 
