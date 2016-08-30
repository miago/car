class Wheel {
  float offsetFromCarCenter_x;
  float offsetFromCarCenter_y;
  float orientation;
  Point wheelCenter;
  Point[] edge;
  Car car;
  
  Wheel(float x_off, float y_off, float orient, Car cc) {
    offsetFromCarCenter_x = x_off;
    offsetFromCarCenter_y = y_off;
    orientation = orient;
    car = cc;
    
    edge = new Point[4];
  }
  
  void drawYourself(){
    recalculateWheelEdges();
    
    line(edge[0].x, edge[0].y, edge[1].x, edge[1].y);
    line(edge[1].x, edge[1].y, edge[2].x, edge[2].y);
    line(edge[2].x, edge[2].y, edge[3].x, edge[3].y);
    line(edge[3].x, edge[3].y, edge[0].x, edge[0].y);
  }
  
  void recalculateWheelEdges() {
    
    wheelCenter = new Point(car.position.x + offsetFromCarCenter_x, car.position.y + offsetFromCarCenter_y);
    
    edge[0] = new Point(wheelCenter.x - Settings.w_wheelSize_w/2, wheelCenter.y - Settings.w_wheelSize_h/2);
    edge[1] = new Point(wheelCenter.x - Settings.w_wheelSize_w/2, wheelCenter.y + Settings.w_wheelSize_h/2);
    edge[2] = new Point(wheelCenter.x + Settings.w_wheelSize_w/2, wheelCenter.y + Settings.w_wheelSize_h/2);
    edge[3] = new Point(wheelCenter.x + Settings.w_wheelSize_w/2, wheelCenter.y - Settings.w_wheelSize_h/2);
    
    // rotate over itself
    edge[0].rotateMe(wheelCenter, orientation);
    edge[1].rotateMe(wheelCenter, orientation);
    edge[2].rotateMe(wheelCenter, orientation);
    edge[3].rotateMe(wheelCenter, orientation);
    
    // rotate over center of car
    edge[0].rotateMe(car.position, car.orientation);
    edge[1].rotateMe(car.position, car.orientation);
    edge[2].rotateMe(car.position, car.orientation);
    edge[3].rotateMe(car.position, car.orientation); 
  }
  
  void incrementOrientation(){
    orientation += PI/32;
  }
  
  void decrementOrientation(){
    orientation -= PI/32;
  }
}