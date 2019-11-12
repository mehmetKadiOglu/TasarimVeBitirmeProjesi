import jdk.nashorn.internal.runtime.options.Option;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class Main {
    public static void main(String[] args) {

        List<String> ad = new ArrayList<String>();

        ad.add("mehmet");
        ad.add("ali");

        if (Generic.getTT(ad, "mehmet") != null){
            System.out.println("mehmet girdi");
        }
        if (Generic.getTT(ad, "mehmet2") != null){
            System.out.println("mehmet2 girdi");
        }

        List<Integer> integers = new ArrayList<Integer>();

        integers.add(15);
        integers.add(25);
        integers.add(35);
        if (Generic.getTT(integers, 5) != null){
            System.out.println("5 girdi");
             Integer sd = Generic.getTT(integers, 5);
             System.out.println(sd);
        }
        if (Generic.getTT(integers, 25) != null){
            System.out.println("25 girdi");
            Integer sd = Generic.getTT(integers, 25);
            System.out.println(sd);
        }
        if (Generic.getTT(integers, 35) != null){
            System.out.println("35 girdi");
        }

        List<selam> selams = new ArrayList<selam>();

        selams.add(new selam("selam2"));
        selams.add(new selam("selam1"));
        selams.add(new selam("selam3"));

        selam selam1 = new selam("selam2");


        if (Generic.getTT(selams, selam1) != null){
            System.out.println("selam2 girdi");
            selam sd = Generic.getTT(selams, selam1);
            System.out.println(sd.getAs());
        }

    }
}
