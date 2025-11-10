public class Layer {
    ArrayList<Displayable> items;
    ArrayList<Entity> entities;
    ArrayList<ParticleSystem> particleSystems;

    Layer() {
        items = new ArrayList<>();
        entities = new ArrayList<>();
        particleSystems = new ArrayList<>();
    }

    public void submitEntity(Entity m) {
        entities.add(m);
    }
    public void removeEntity(int id) {
        entities.removeIf(e -> e.id == id);
    }

    int getNumItems() {
        return items.size() + entities.size();
    }

    void add(Static d) {
        items.add(d);
    }
    void add(Entity d) {
        entities.add(d);
    }
    void add(ParticleSystem d) {
        particleSystems.add(d);
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
        for (Displayable d : items) {
            if (d.pos.x >= offset.x && d.pos.x <= offset.x + width) {
                d.display();
            }
        }
        for (Entity d : entities) {
            if (d.pos.x >= offset.x && d.pos.x <= offset.x + width) {
                d.display();
            }
        }
        for (ParticleSystem d : particleSystems) {
            // if (d.pos.x >= offset.x && d.pos.x <= offset.x + width) {
                d.display();
            // }
        }
    }
}