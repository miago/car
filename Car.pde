class Car {
  
  Dimension carDimension;
  float orientation;
  Point position;
  Point[] edge;
  
  Car() {
    position = new Point(Settings.c_carOriginalPosition_x, Settings.c_carOriginalPosition_y);
    orientation = Settings.c_carOriginalOrientation;  
    carDimension = new Dimension(Settings.c_carSize_w, Settings.c_carSize_h);
    edge = new Point[4];
  }

  void drawYourself() {
    recalculateCarEdges();
    
    line(edge[0].x, edge[0].y, edge[1].x, edge[1].y);
    line(edge[1].x, edge[1].y, edge[2].x, edge[2].y);
    line(edge[2].x, edge[2].y, edge[3].x, edge[3].y);
    line(edge[3].x, edge[3].y, edge[0].x, edge[0].y);
  }
  
  void recalculateCarEdges() {
    edge[0] = new Point(position.x - carDimension.w/2, position.y - carDimension.h/2);
    edge[1] = new Point(position.x - carDimension.w/2, position.y + carDimension.h/2);
    edge[2] = new Point(position.x + carDimension.w/2, position.y + carDimension.h/2);
    edge[3] = new Point(position.x + carDimension.w/2, position.y - carDimension.h/2);
    
    edge[0] = rotatePoint(edge[0], position, orientation); 
    edge[1] = rotatePoint(edge[1], position, orientation);
    edge[2] = rotatePoint(edge[2], position, orientation);
    edge[3] = rotatePoint(edge[3], position, orientation);
  }
  
  Point rotatePoint(Point point, Point centerPoint, float orientation){
    Point retPoint = new Point(0, 0);
    
    point.subtractPoint(centerPoint);
    
    retPoint.x = (point.x) * cos(orientation) - (point.y) * sin(orientation);
    retPoint.y = (point.y) * cos(orientation) + (point.x) * sin(orientation);
    
    retPoint.addPoint(centerPoint);
    
    return retPoint;
  } 
  
  void incrementOrientation(){
    orientation += PI/32;
  }
  
   void decrementOrientation(){
    orientation -= PI/32;
  }
}