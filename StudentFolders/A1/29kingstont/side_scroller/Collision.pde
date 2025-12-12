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

public static class Collision {
    public static CollisionResult check(RectBody a, RectBody b) {
        float overlapX = min(a.getX() + a.getW() - b.getX(), b.getX() + b.getW() - a.getX());
        float overlapY = min(a.getY() + a.getH() - b.getY(), b.getY() + b.getH() - a.getY());

        if (overlapX > 0 && overlapY > 0) {
            if (overlapX < overlapY) {
                return new CollisionResult(
                    true,
                    (a.getX() < b.getX() ? "left" : "right"),
                    overlapX
                );
            } else {
                return new CollisionResult(
                    true,
                    (a.getY() < b.getY() ? "top" : "bottom"),
                    overlapY
                );
            }
        }

        return CollisionResult.none();
    }



    // ChatGPTed because this is literally never used. Idk why I don't just remove CircleBody -_-
    public static CollisionResult check(CircleBody circle, RectBody rect) {
        float cx = circle.getPos().x;
        float cy = circle.getPos().x;
        float r  = circle.getR();

        float rx = rect.getX();
        float ry = rect.getY();
        float rw = rect.getW();
        float rh = rect.getH();

        // 1. Find closest point on rectangle to circle center
        float closestX = clamp(cx, rx, rx + rw);
        float closestY = clamp(cy, ry, ry + rh);

        // 2. Distance from circle to closest point
        float dx = cx - closestX;
        float dy = cy - closestY;

        float distSq = dx * dx + dy * dy;

        if (distSq > r * r) {
            return CollisionResult.none(); // No collision
        }

        // 3. Determine penetration along X/Y
        float distance = (float)Math.sqrt(distSq);
        float penetration = r - distance;

        // Normalize direction
        float nx = dx / distance;
        float ny = dy / distance;

        // Choose axis of strongest push
        if (Math.abs(nx) > Math.abs(ny)) {
            return new CollisionResult(
                true,
                nx < 0 ? "left" : "right",
                Math.abs(penetration * nx)
            );
        } else {
            return new CollisionResult(
                true,
                ny < 0 ? "top" : "bottom",
                Math.abs(penetration * ny)
            );
        }
    }

    private static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }
}