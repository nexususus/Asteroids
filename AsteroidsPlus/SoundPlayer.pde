/* This source code is copyrighted materials owned by the UT system and cannot be placed
 into any public site or public GitHub repository. Placing this material, or any material
 derived from it, in a publically accessible site or repository is facilitating cheating
 and subjects the student to penalities as defined by the UT code of ethics. */

import processing.sound.*;

class SoundPlayer
{
  SoundFile boomPlayer, popPlayer, gameOverPlayer;
  SoundFile explosionLargeAsteroid, explosionShip, explosionSmallAsteroid;
  SoundFile ohYea, missileLaunch;
  SoundFile bgMusic; // Background music soundfile

  SoundPlayer(PApplet app, float globalVolume)
  {
    boomPlayer = new SoundFile(app, "explode.wav");
    boomPlayer.amp(globalVolume);

    gameOverPlayer = new SoundFile(app, "ThatsAllFolks.wav");
    gameOverPlayer.amp(globalVolume);

    popPlayer = new SoundFile(app, "pop.wav");
    popPlayer.amp(globalVolume);

    explosionLargeAsteroid = new SoundFile(app, "LargAsteroidExplosion.wav");
    explosionLargeAsteroid.amp(globalVolume);

    explosionSmallAsteroid = new SoundFile(app, "SmallAsteroidExplosion.wav");
    explosionSmallAsteroid.amp(globalVolume);

    explosionShip = new SoundFile(app, "ExplosionShip.wav");
    explosionShip.amp(globalVolume);

    ohYea = new SoundFile(app, "OhYea.wav");
    ohYea.amp(globalVolume);

    missileLaunch = new SoundFile(app, "MissileLaunch.wav");
    missileLaunch.amp(globalVolume);

    // set audio and volume of bgMusic
    bgMusic = new SoundFile(app, "strategist-2.wav");
    bgMusic.amp(0.1);
  }

  void playExplosion()
  {
    boomPlayer.play();
  }

  void playPop()
  {
    popPlayer.play();
  }

  void playGameOver()
  {
    gameOverPlayer.play();
    
    bgMusic.stop();
  }

  void playExplosionLargeAsteroid()
  {
    explosionLargeAsteroid.play();
  }

  void playExplosionSmallAsteroid()
  {
    explosionSmallAsteroid.play();
  }

  void playExplosionShip()
  {
    explosionShip.play();
  }

  void playOhYea()
  {
    ohYea.play();
    
    bgMusic.stop();
  }

  void playMissileLaunch()
  {
    missileLaunch.play();
  }

  // method to play background music on loop
  void playbgMusic() {
    bgMusic.loop();
  }
}
