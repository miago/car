
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
    subtractPoint(center);
    
    x = (center.x) * cos(angle) - (center.y) * sin(angle);
    y = (center.y) * cos(angle) + (center.x) * sin(angle);
    
    addPoint(center);
  }
  
  Point subtractPoint(Point p1, Point p2) {
    return new Point(p1.x - p2.x, p1.y - p2.y);
  }
  
  Point addPoint(Point p1, Point p2) {
    return new Point(p1.x + p2.x, p1.y + p2.y);
  }  
  
  
}