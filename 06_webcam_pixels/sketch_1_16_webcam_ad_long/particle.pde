class particle {
  PVector pos, vel, prevPos;
  float accel_ctrl, spd_ctrl;

  particle(PVector _pos, PVector _vel, PVector _prevPos) {
    pos = _pos;
    vel = _vel;
    prevPos = _prevPos;
    accel_ctrl = random(0.03, 0.3);
    spd_ctrl = random(1.01, 1.05);
  }
  void render(PVector _target) {
    update(_target);
    display();
    //updatePos();
  }

  void update(PVector _target) {
    PVector accel = PVector.sub(_target, pos);
    accel.mult(accel_ctrl);
    vel.div(spd_ctrl);
    vel.add(accel);
    pos.add(vel);
  }

  void display() {
    //stroke(255);

    //PVector diff_pos = PVector.sub(pos, prevPos);
    ////int s = (int)random(5, 10);
    //float s = diff_pos.magSq()/200;
    //println(s);
    //s = constrain(s,5,10);
    //for (int i = 0; i < s; i ++) {
    //  for (int j = 0; j < s; j++) {
    //    PVector offset = new PVector(noise(i,j)*diff_pos.x, noise(j,i)*diff_pos.y);
    //    PVector offsetPos = PVector.add(pos, offset);
    //    point(offsetPos.x, offsetPos.y);//, prevPos.x, prevPos.y);
    //  }
    //}

    if (pos.x < width && pos.x > 0 && pos.y < height && pos.y > 0) {
      fill(camImage.pixels[int(pos.x) + int(pos.y)*width]);
    } else {
      fill(0);
    }
    ellipse(pos.x, pos.y,1.5,1.5);
  }
}