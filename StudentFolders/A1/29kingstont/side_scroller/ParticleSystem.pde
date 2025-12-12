@FunctionalInterface
public interface ParticleSupplier<T extends Particle> {
    T create(float x, float y, PVector vel, PVector acc);
}

@FunctionalInterface
public interface ParticleVel {
    PVector get();
}

@FunctionalInterface
public interface ParticleAcc {
    PVector get();
}

public class ParticleSystem<T extends Particle> {
    PVector pos;
    Entity parent;
    PVector offset;

    ArrayList<T> particles;
    ParticleSupplier<T> factory;

    ParticleSystem(PVector pos, ParticleSupplier<T> factory) {
        this.pos = pos;
        this.offset = new PVector();
        this.particles = new ArrayList<>();
        this.factory = factory;
    }

    void attachTo(Entity e) {
        this.parent = e;
        this.pos = parent.getPos().copy();
    }
    void attachTo(Entity e, PVector offset) {
        this.parent = e;
        this.offset = offset;
        this.pos = parent.getPos().copy().add(offset);
    }
    void setOffset(PVector offset) {
        this.offset = offset;
    }

    void spawn(int N) {
        for (int i=0; i<N; i++) {
            particles.add(factory.create(pos.x, pos.y, new PVector(random(-5, 5), random(-5, 5)), new PVector(random(-0.5, 0.5), random(-0.5, 0.5))));
        }
    }
    void spawn(int N, ParticleVel genVel, ParticleAcc genAcc) {
        for (int i=0; i<N; i++) {
            particles.add(factory.create(pos.x, pos.y, genVel.get(), genAcc.get()));
        }
    }

    void update() {
        if (parent != null) {
            this.pos = parent.getPos().copy().add(offset);
        }

        for (int i=particles.size()-1; i>=0; i--) {
            particles.get(i).update();
        }
    }

    void display() {
        for (int i=particles.size()-1; i>=0; i--) {
            particles.get(i).display();
        }
    }
}