package im.actor.model.api;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.model.droidkit.bser.Bser;
import im.actor.model.droidkit.bser.BserParser;
import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.droidkit.bser.DataInput;
import im.actor.model.droidkit.bser.DataOutput;
import static im.actor.model.droidkit.bser.Utils.*;
import java.io.IOException;
import im.actor.model.network.parser.*;
import java.util.List;
import java.util.ArrayList;

public class TextExMarkdown extends BserObject {

    private String markdown;

    public TextExMarkdown(String markdown) {
        this.markdown = markdown;
    }

    public TextExMarkdown() {

    }

    public String getMarkdown() {
        return this.markdown;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.markdown = values.getString(2);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.markdown == null) {
            throw new IOException();
        }
        writer.writeString(2, this.markdown);
    }

    @Override
    public String toString() {
        String res = "struct TextExMarkdown{";
        res += "markdown=" + this.markdown;
        res += "}";
        return res;
    }

}