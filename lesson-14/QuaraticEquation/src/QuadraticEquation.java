import java.util.ArrayList;
import java.util.List;

public class QuadraticEquation {
    public static void main(String[] args) {

    }
    public static List<Double> solve(double a, double b , double c){
        List<Double> solutions = new ArrayList<>();
        double delta = b*b - 4*a*c;
        if(delta>=0){
            double x1 = (-b + Math.sqrt(delta)) / (2 * a);
            solutions.add(x1);
            if (delta > 0) {
                double x2 = (-b - Math.sqrt(delta)) / (2 * a);
                solutions.add(x2);
                solutions.add(x2);
            }
        }
        return solutions;
    }
}