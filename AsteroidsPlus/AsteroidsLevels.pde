/* This source code is copyrighted materials owned by the UT system and cannot be placed 
 into any public site or public GitHub repository. Placing this material, or any material 
 derived from it, in a publically accessible site or repository is facilitating cheating 
 and subjects the student to penalities as defined by the UT code of ethics. */

class AsteroidsLevel1 extends AsteroidsGameLevel 
{
  float missileSpeed = 200;
  StopWatch powerupSW;
  boolean shouldSpawnMissilePowerup = false;
  int periodBetweenPU = 10;
  StopWatch addAsteroidsSW;
  int periodBetweenAdds = 5;
  float asteroidSpeed;
  
  StopWatch missilePowerupSW;
  int missilePowerupTime = 10;
  boolean missilePowerupActive = false;

  AsteroidsLevel1(PApplet applet)
  {
    super(applet);

    powerupSW = new StopWatch();
    addAsteroidsSW = new StopWatch();
    missilePowerupSW = new StopWatch();
    asteroidSpeed = 3;
  }

  void start()
  {
    super.start();

    ship = new Ship(game, width/2, height/2);

    // Example of setting the ship's sprite to a custom image. 
    //ship = new Ship(game, "ships2.png", width/2, height/2);
    //ship.setScale(.5);

    asteroids.add(new BigAsteroid(game, 200, 500, 0, 0.02, 22, PI*.5));
    asteroids.add(new BigAsteroid(game, 500, 200, 1, -0.01, 22, PI*1));

    gameState = GameState.Running;
  }

  void update() 
  {
    super.update();

    if (powerupSW.getRunTime() > periodBetweenPU) {
      powerupSW.reset();
      
      if (shouldSpawnMissilePowerup)
        powerUps.add(new MissilePowerup(game, game.width/2, game.height/2, 100, this));
      else
        powerUps.add(new ShieldPowerup(game, game.width/2, game.height/2, 100, ship));
        
      shouldSpawnMissilePowerup = !shouldSpawnMissilePowerup;
    }

    // TEAMS: Example of adding additional asteroids for Infinite Level
    /*
    if (addAsteroidsSW.getRunTime() > periodBetweenAdds) {
     addAsteroidsSW.reset();
     
     asteroidSpeed += 20;
     int newX = ((int)ship.getX() + game.width/2) % game.width;
     int newy = ((int)ship.getY() + game.height/2) % game.height;
     asteroids.add(new BigAsteroid(game, newX, newy, 0, 0.02, asteroidSpeed, random(0, 6.5)));
     }
     */
     
    if (missilePowerupSW.getRunTime() > missilePowerupTime && missilePowerupActive) {
      missilePowerupSW.reset();
      missilePowerupActive = false;
    }
  }

  void drawBackground() 
  {
    // Background image must be same size as window. 
    background(background);
  }

  void drawOnScreen() 
  {
    ship.drawOnScreen(); // Draws Energy Bar
    
    if (missilePowerupActive) {
      float xpos = (float)ship.getX() - 30;
      float ypos = (float)ship.getY() + 40;
      // Percentage of shield time remaining
      float pcnt = (float)((missilePowerupTime - missilePowerupSW.getRunTime())/missilePowerupTime);
      ship.drawBar(color(255, 0, 0), xpos, ypos, pcnt);
    }
  }

  void keyPressed() 
  {
    if ( key == ' ') {
      if (ship.isActive()) {
        launchMissile(missileSpeed);
      }
    }
  }

  void mousePressed()
  {
  }

  private void launchMissile(float speed) 
  {
    if (ship.energy >= .2) {
      int shipx = (int)ship.getX();
      int shipy = (int)ship.getY();
      
      Missile missile = new Missile(game, shipx, shipy);
      missile.setRot(ship.getRot() - 1.5708);
      missile.setSpeed(missilePowerupActive ? speed*2 : speed);
      missiles.add(missile);

      ship.energy -= ship.deplete;
    }
  }
  
  public void activateMissilePowerup() {
    missilePowerupSW.reset();
    missilePowerupActive = true;
  }
}

/*****************************************************/

class AsteroidsLevel2 extends AsteroidsGameLevel 
{
  float missileSpeed = 400;
  StopWatch powerupSW;
  boolean shouldSpawnMissilePowerup = false;
  int periodBetweenPU = 5;
  
  StopWatch missilePowerupSW;
  int missilePowerupTime = 5;
  boolean missilePowerupActive = false;

  AsteroidsLevel2(PApplet applet)
  {
    super(applet);

    powerupSW = new StopWatch();
    missilePowerupSW = new StopWatch();
  }

  void start()
  {
    super.start();

    ship = new Ship(game, width/2, height/2);
    asteroids.add(new BigAsteroid(game, 200, 500, 0, 0.02, 22, PI*.5));
    asteroids.add(new BigAsteroid(game, 500, 200, 1, -0.01, 22, PI*1));
    asteroids.add(new BigAsteroid(game, 100, 300, 2, 0.01, 22, PI*1.7));
    asteroids.add(new BigAsteroid(game, 500, 600, 0, -0.02, 22, PI*1.3));

    gameState = GameState.Running;
  }

  void update() 
  {
    super.update();

    if (powerupSW.getRunTime() > periodBetweenPU) {
      powerupSW.reset();
      
      if (shouldSpawnMissilePowerup)
        powerUps.add(new MissilePowerup(game, game.width/2, game.height/2, 100, this));
      else
        powerUps.add(new ShieldPowerup(game, game.width/2, game.height/2, 100, ship));
        
      shouldSpawnMissilePowerup = !shouldSpawnMissilePowerup;
    }
    
    if (missilePowerupSW.getRunTime() > missilePowerupTime && missilePowerupActive) {
      missilePowerupSW.reset();
      missilePowerupActive = false;
    }
  }

  void drawBackground() 
  {
    // Background image must be same size as window. 
    background(background);
  }
  
  void drawOnScreen() 
  {
    ship.drawOnScreen(); // Draws Energy Bar
    
    if (missilePowerupActive) {
      float xpos = (float)ship.getX() - 30;
      float ypos = (float)ship.getY() + 40;
      // Percentage of shield time remaining
      float pcnt = (float)((missilePowerupTime - missilePowerupSW.getRunTime())/missilePowerupTime);
      ship.drawBar(color(255, 0, 0), xpos, ypos, pcnt);
    }
  }

  void keyPressed() 
  {
    if ( key == ' ') {
      if (ship.isActive()) {
        launchMissile(missileSpeed);
      }
    }
  }

  void mousePressed()
  {
  }

  private void launchMissile(float speed) 
  {
    if (ship.energy >= .2) {
      int shipx = (int)ship.getX();
      int shipy = (int)ship.getY();
      Missile missile = new Missile(game, shipx, shipy);
      missile.setRot(ship.getRot() - 1.5708);
      missile.setSpeed(missilePowerupActive ? speed*1.5 : speed);
      missiles.add(missile);

      ship.energy -= ship.deplete;
    }
  }'
  
  public void activateMissilePowerup() {
    missilePowerupSW.reset();
    missilePowerupActive = true;
  }
}
