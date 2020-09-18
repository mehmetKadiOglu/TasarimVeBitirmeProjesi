package dev.valentinspac.proxy.framework;

import java.util.List;

public class MyCustomProxy {
    private List<Class<?>> interfaces;
    private Object proxy;
    private String classType;

    public MyCustomProxy(List<Class<?>> interfaces, Object proxy, String classType) {
        this.interfaces = interfaces;
        this.proxy = proxy;
        this.classType = classType;
    }

    public Object getJdkProxy() {
        return proxy;
    }

    public boolean hasInterface(Class<?> expectedInterface) {
        return interfaces.contains(expectedInterface);
    }

    public String getClassType() {
        return classType;
    }

    public List<Class<?>> getInterfaces() {
        return interfaces;
    }

}
