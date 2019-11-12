import java.util.ArrayList;
import java.util.List;

public class Generic{

    public static  <Taskin> Taskin getTT(List<Taskin> gel, Taskin eşlik){
        boolean kontrol = false;
        Taskin ff2 = null;
        for ( Taskin ff: gel){
            if ( ff.equals(eşlik) ){
                kontrol = true;
                ff2 = ff;
                break;
            }
        }

        if (kontrol)
            return ff2;
        else
            return null;

    }
}
