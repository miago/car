
class Point {
  float x, y;
  
  Point(float xp, float yp) {
    x = xp;
    y = yp;
  }
  
  void subtractPoint(Point point) {
    x-=point.x;
    y-=point.y;
  }
  
  void addPoint(Point point ) {
    x+=point.x;
    y+=point.y;
  }
  
  void rotateMe(Point center, float angle) {
    Point tmPnt = new Point(0,0);
    
    subtractPoint(center);
    
    tmPnt.x = (x) * cos(angle) - (y) * sin(angle);
    tmPnt.y = (y) * cos(angle) + (x) * sin(angle);
    
    
    tmPnt.addPoint(center);
    
    x = tmPnt.x;
    y = tmPnt.y;
    
  }
  
  Point subtractPoint(Point p1, Point p2) {
    return new Point(p1.x - p2.x, p1.y - p2.y);
  }
  
  Point addPoint(Point p1, Point p2) {
    return new Point(p1.x + p2.x, p1.y + p2.y);
  }  
  
  
}