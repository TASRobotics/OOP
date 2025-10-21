/*
 * Grenade Class - Damage-Dealing Explosive
 * 
 * This class extends the Bomb class to create a grenade that deals damage
 * to the player instead of blinding them. It demonstrates object-oriented
 * programming concepts like inheritance and method overriding.
 * 
 * Key differences from Bomb:
 * - Green color instead of gray
 * - Deals progressive damage based on distance from explosion
 * - Reduces player health instead of causing screen flash
 * - Uses mathematical mapping for damage calculation
 * 
 * Damage system:
 * - Maximum damage (40) at explosion center
 * - Damage decreases with distance from explosion
 * - No damage if too far from explosion
 */

class Grenade extends Bomb {
  // Maximum damage this grenade can deal
  float maxDamage = 40;
  
  // Constructor: creates a green grenade at specified position
  Grenade(int x, int y){
    super(x, y); // Call parent constructor to initialize bomb properties
    c = color(30, 180, 30); // Override color to green
  }
  
  // Override parent action method to deal damage instead of blinding
  void action(){
    println("poof"); // Debug output for grenade explosion
    
    // Calculate distance from explosion center to player
    float d = dist(bx, by, x, y);
    
    // Calculate maximum effective range (explosion radius + player radius)
    float max = damageRadius + 25;
    
    // Map distance to damage amount (closer = more damage)
    // Distance 0 to max maps to damage maxDamage to 0
    float damageToDo = map(d, 0, max, maxDamage, 0);
    
    // Ensure minimum damage threshold (no tiny damage amounts)
    if(damageToDo < 1){
      damageToDo = 0;
    }
    
    // Apply damage to player health
    playerHealth -= damageToDo;
  }
}
