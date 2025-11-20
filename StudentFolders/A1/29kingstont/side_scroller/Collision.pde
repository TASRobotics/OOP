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
}