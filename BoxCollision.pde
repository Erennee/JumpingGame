class BoxCollision {
  Point p[] = new Point[4];
  Triangle t[] = new Triangle[2];
  boolean trigger = false;

  BoxCollision(float x, float y, float w, float h) {
    p[0] = new Point(x, y);
    p[1] = new Point(x+w, y);
    p[2] = new Point(x, y+h);
    p[3] = new Point(x+w, y+h);
    t[0] = new Triangle(p[0], p[1], p[2]);
    t[1] = new Triangle(p[1], p[2], p[3]);
  }

  void check(float x, float y, float w, float h) {
    p[0] = new Point(x, y);
    p[1] = new Point(x+w, y);
    p[2] = new Point(x, y+h);
    p[3] = new Point(x+w, y+h);
    t[0] = new Triangle(p[0], p[1], p[2]);
    t[1] = new Triangle(p[1], p[2], p[3]);
  }
  boolean checkTriggeredFrom(BoxCollision c){
    boolean triggered = false;

    for (int i = 0; i<t.length; i++) {
      Point n1;
      Point n2;
      Point n3;
      n1 = getNormal(getVector(t[i].p1, t[i].p2));
      n2 = getNormal(getVector(t[i].p2, t[i].p3));
      n3 = getNormal(getVector(t[i].p3, t[i].p1));
      for (int j = 0; j<c.p.length; j++) {
        boolean side1;
        boolean side2;
        boolean side3;

        side1 = checkSide(c.p[j], t[i].p1, t[i].p2, n1);
        side2 = checkSide(c.p[j], t[i].p2, t[i].p3, n2);
        side3 = checkSide(c.p[j], t[i].p3, t[i].p1, n3);
        triggered = triggered || (side1 && side2 && side3) ;
      }
    }
      return triggered;
  }

  boolean isTriggeredBy(BoxCollision c) {
     boolean triggered = false;

    for (int i = 0; i<t.length; i++) {
      Point n1;
      Point n2;
      Point n3;
      n1 = getNormal(getVector(t[i].p1, t[i].p2));
      n2 = getNormal(getVector(t[i].p2, t[i].p3));
      n3 = getNormal(getVector(t[i].p3, t[i].p1));
      for (int j = 0; j<c.p.length; j++) {
        boolean side1;
        boolean side2;
        boolean side3;

        side1 = checkSide(c.p[j], t[i].p1, t[i].p2, n1);
        side2 = checkSide(c.p[j], t[i].p2, t[i].p3, n2);
        side3 = checkSide(c.p[j], t[i].p3, t[i].p1, n3);
        triggered = triggered || (side1 && side2 && side3) ;
      }
    }
      triggered = triggered || c.checkTriggeredFrom(this);
      return triggered;
  }
}



Boolean checkSide(Point p, Point p1, Point p2, Point n) {
  Point u = getUnitVector(n);

  float x1;
  float x2;

  float y1;
  float y2;

  x1 = getValueOfPointNormalX(p.y, u, p1);
  x2 = getValueOfPointNormalX(p.y, u, p2);

  y1 = getValueOfPointNormalY(p.x, u, p1); 
  y2 = getValueOfPointNormalY(p.x, u, p2);

  boolean checkX = false;
  boolean checkY = false;

  if (x1 != x2)
    checkX = (x1>x2) ? (x1 >= p.x && p.x >= x2) : (x2 >= p.x && p.x >= x1);
  else
    checkX = true;

  if (y1 != y2)
    checkY = (y1>y2) ? (y1 >= p.y && p.y >= y2) : (y2 >= p.y && p.y >= y1);
  else
    checkY = true; 

  return (checkX && checkY);
}
float getValueOfPointNormalX(float y, Point u, Point p) {
  float i;
  float x;
  if (u.y != 0) {
    i = (y - p.y) / u.y;
    x = p.x + u.x*i;
  } else {
    x = p.x;
  }
  return x;
}

float getValueOfPointNormalY(float x, Point u, Point p) {
  float i;
  float y;
  if (u.x != 0) {
    i = (x - p.x) / u.x;
    y = p.y + u.y*i;
  } else {
    y = p.y;
  }
  return y;
}

Point getUnitVector(Point p) {
  float s;
  Point u;

  s = getValueOfVector(p);
  u = new Point (p.x/s, p.y/s);

  return u;
}

float getValueOfVector(Point p) {
  float s;
  s = sqrt(pow(p.x, 2) + pow(p.y, 2));
  return s;
}

Point getNormal(Point p) {
  Point normal;
  normal = new Point(-p.y, p.x);
  return normal;
}

Point getVector(Point p1, Point p2) {
  Point vector = new Point(p2.x-p1.x, p2.y-p1.y);
  return vector;
}
