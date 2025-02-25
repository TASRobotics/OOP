class Path {
 ArrayList<PVector> points = new ArrayList<PVector>(); 

  Path(){
   points.add(new PVector(1500, 25));
   points.add(new PVector(1500, 600));
   points.add(new PVector(1200, 600));
   points.add(new PVector(1200, 800));
   points.add(new PVector(1500, 800));
  }
  
  void display(){
    for(int i = 0; i < points.size()-1; i++){
      PVector a = points.get(i);
      PVector b = points.get(i+1);
      line(a.x, a.y, b.x, b.y);
    }
  }
  
}
