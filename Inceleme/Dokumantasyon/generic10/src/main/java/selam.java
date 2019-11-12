public class selam {
    String as;

    public selam(String selamss){
        setAs(selamss);
    }
    public String getAs() {
        return as;
    }

    public void setAs(String as) {
        this.as = as;
    }

    @Override
    public boolean equals(Object obj) {
        return ((selam)obj).getAs().equals(getAs());
    }
}
