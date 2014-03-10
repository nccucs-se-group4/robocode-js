importScripts('../base-robot.js')

class MyRobot extends BaseRobot
  mode = 0

  onIdle: !->

    if @mode==0
      @turn_right 308-@me.tank_angle
      @move_forwards 100
      @shoot!
      @turn_turret_right 45
    else if @mode==1
      @turn_turret_right 2
      @turn_left 0
      @shoot!
      if @me.turret_angle > 235
        @mode = 2
    else if @mode==2
      @turn_turret_left 2
      @turn_right 0
      @shoot!
      if @me.turret_angle < 135
        @mode = 1
    else
      @shoot!
      @turn_turret_right 45
      @mode = 0

  onWallCollide: !->
      @mode = 1
      @shoot!

  onHit: !->
    @shoot!

  onEnemySpot: !->
    @shoot!
    if @mode==1
      @mode=2
    else if @mode==2
      @mode=1

tr = new MyRobot("MyRobot")
