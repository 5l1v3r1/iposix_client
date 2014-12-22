package mx.com.banco.azteca.whiteboard.pojo;

/**
 * @author Carlos Cuaya Xinto
 */
public class Coordinate {
    
    private float x;
    private float y;
    
    public Coordinate() {}

    public Coordinate(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public float getX() {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    @Override
    public String toString() {
        return "Coordinate{" + "x=" + x + ", y=" + y + '}';
    }
}
