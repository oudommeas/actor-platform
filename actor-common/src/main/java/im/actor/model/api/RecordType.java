package im.actor.model.api;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import java.io.IOException;

public enum RecordType {

    PHONE(1),
    EMAIL(2);

    private int value;

    RecordType(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static RecordType parse(int value) throws IOException {
        switch(value) {
            case 1: return RecordType.PHONE;
            case 2: return RecordType.EMAIL;
        }
        throw new IOException();
    }
}