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

    void applyForce(PVector F) {
        for (Entity e : entities) {
            e.applyForce(F);
        }
    }


    void cleanup() {
        for (int i = entities.size() - 1; i >= 0; i--) {
            if (entities.get(i).isDead()) {
                entities.remove(i);
            }
        }
    }

    void update(World world, float minX, float maxX) {
        cleanup();

        for (int i = entities.size()-1; i>=0; i--) {
            Entity e = entities.get(i);
            if (e.getBody().isWithin(minX, maxX)) e.update(world);
            // else println("SKIPPED update for entity " + e.toString());
        }
        for (ParticleSystem d : particleSystems) {
            d.update();
        }
    }

    void display(float minX, float maxX) {
        for (Static d : items) {
            if (d.getPos().x >= minX && d.getPos().x <= maxX) {
                d.display();
            }
        }

        for (ParticleSystem ps : particleSystems) {
            ps.display();
        }

        for (Platform p : platforms) {
            if (p.getBody().isWithin(minX, maxX)) p.display();
            // else println("SKIPPED display for platform " + p.toString());
        }

        for (Entity e : entities) {
            if (e.getBody().isWithin(minX, maxX)) e.display();
            // else println("SKIPPED display for entity " + e.toString());
        }
    }
}