importScripts('../base-robot.js')

class MyRobot extends BaseRobot
  
  onIdle: !->
    @turn_left 90
    @shoot!
    @move_forwards 30
    @turn_turret_left 120
    
    if @my-var 
      @shoot!
      @turn_turret_left 15
    else 
      @shoot!

  onWallCollide: !->
    @move_opposide 10
    @turn_left 90
    @move_forwards 150
    @shoot!

  onHit: !->
    @move_backwards 50
    @turn_left 90
    @shoot!
    @yell "Oops!  Fire!"

  onEnemySpot: !->
    @yell "EnemySpot"
    @shoot!
    @my-var = @enemy-spot

tr = new MyRobot("MyRobot")
