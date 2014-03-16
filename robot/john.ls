importScripts('../base-robot.js')

class MyRobot extends BaseRobot
	
  do-search: !->
    @turn_turret_right 45
    @turn_right 15
    @move_forwards 25
	@shoot
	
  onIdle: !->
  @shoot
   
   if @my-var-enemy
      forward = false
      tiny-move = Math.random! * 45
      tiny-shoot = Math.random! * 10
      left-dist = my-angle + 360 - @my-var-enemy[0].angle
      if left-dist > 360
        left-dist = left-dist - 360

      right-dist = @my-var-enemy[0].angle - my-angle
      if right-dist < 0
        right-dist = 360 + right-dist

      if left-dist != right-dist
        if Math.random! > 0.5
          forward = true
        if left-dist > right-dist
          @turn_turret_right right-dist + 5
        else
          @turn_turret_left left-dist + 5
        if forward
          @move_forwards tiny-move
        else
          @move_backwards tiny-move
        @shoot!
      else
        @shoot!

      @my-var-enemy = undefined
  
  
  
  
  
  
    @move_forwards 30
    @turn_turret_left 45
    @turn_right 90

  onWallCollide: !->
    @move_opposide 10
    @turn_left 90

  onHit: !->
  tiny-move = Math.random! * 45
  
  
    @yell "Oops!"

  onEnemySpot: !->
    @yell "Fire!"
    @shoot!
	@my-var-enemy = @enemy-spot
	
tr = new MyRobot("MyRobot")
