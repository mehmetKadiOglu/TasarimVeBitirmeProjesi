package com.STATE;

public abstract class AbstractFormHandle {
    protected FormState kayitFormState;

    private FormState getKayitFormState() {
        return kayitFormState;
    }

    public void setKayitFormState(FormState kayitFormState) {
        this.kayitFormState = kayitFormState;
    }

    abstract public void handle();
}
