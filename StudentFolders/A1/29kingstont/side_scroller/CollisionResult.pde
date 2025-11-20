public static class CollisionResult {
    public boolean collided;
    public String side;
    public float penetration;

    public CollisionResult(boolean collided, String side, float penetration) {
        this.collided = collided;
        this.side = side;
        this.penetration = penetration;
    }

    public static CollisionResult none() {
        return new CollisionResult(false, "", 0);
    }
}