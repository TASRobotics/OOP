public class Layer {
    ArrayList<Static> items;
    ArrayList<Platform> platforms;
    ArrayList<Entity> entities;
    ArrayList<ParticleSystem> particleSystems;

    Layer() {
        items = new ArrayList<>();
        platforms = new ArrayList<>();
        entities = new ArrayList<>();
        particleSystems = new ArrayList<>();
    }

    int getNumItems() {
        return items.size() + entities.size() + particleSystems.size();
    }

    void register(Static d) {
        items.add(d);
    }
    void register(Platform p) {
        platforms.add(p);
    }
    void register(Entity d) {
        entities.add(d);
    }
    void register(ParticleSystem d) {
        particleSystems.add(d);
    }

    public void deregisterEntity(int id) {
        entities.removeIf(e -> e.id == id);
    }

    void update(World world) {
        for (Entity e : entities) {
            e.update(world);
        }
        for (ParticleSystem d : particleSystems) {
            d.update();
        }
    }

    void display(PVector offset) {
        for (Static d : items) {
            if (d.getPos().x >= offset.x && d.getPos().x <= offset.x + width) {
                long t = System.nanoTime(); // DEBUGGER ########################
                d.display();
                logStats("Static display", (System.nanoTime() - t)/1e6);
            }
        }

        
        for (Entity e : entities) {
            if (e.getPos().x >= offset.x && e.getPos().x <= offset.x + width) {
                e.display();
            }
        }

        for (ParticleSystem ps : particleSystems) {
            // if (d.pos.x >= offset.x && d.pos.x <= offset.x + width) {
                ps.display();
            // }
        }

        for (Platform p : platforms) {
            if (p.getPos().x - p.getW() >= offset.x && p.getPos().x <= offset.x + width) {
                p.display();
            }
        }
    }
}