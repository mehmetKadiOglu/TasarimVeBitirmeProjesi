package dev.valentinspac.proxy.service;

import dev.valentinspac.proxy.framework.MyCustomTransaction;
import dev.valentinspac.proxy.framework.TransactionalService;

import java.io.File;

@TransactionalService
public class Hello implements Playable, Seekable {
    @Override
    public String play(String song) {
        return "deneöe";
    }

    @Override
    @MyCustomTransaction("file")
    public String play(File song) {

        return "deneöe";
    }

    @Override
    public String play(File song, int start) {
        return "deneöe";
    }

    @Override
    public String play(File song, int start, int finish) {
        return "deneöe";
    }

    @Override
    public String seekTo(int position) {
        return "deneöe";
    }
}
