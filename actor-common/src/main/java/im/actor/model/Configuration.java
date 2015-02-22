package im.actor.model;

import im.actor.model.network.ConnectionEndpoint;

/**
 * Created by ex3ndr on 08.02.15.
 */
public class Configuration {

    private final Networking networking;

    private final ConnectionEndpoint[] endpoints;

    private final Threading threading;
    private final MainThread mainThread;

    private final Storage storage;

    private final LogCallback log;

    private final boolean persistUploadingFiles;

    public Configuration(Networking networking, ConnectionEndpoint[] endpoints,
                         Threading threading, MainThread mainThread, Storage storage,
                         LogCallback log, boolean persistUploadingFiles) {
        this.networking = networking;
        this.endpoints = endpoints;
        this.threading = threading;
        this.mainThread = mainThread;
        this.storage = storage;
        this.log = log;
        this.persistUploadingFiles = persistUploadingFiles;
    }

    public Networking getNetworking() {
        return networking;
    }

    public ConnectionEndpoint[] getEndpoints() {
        return endpoints;
    }

    public Threading getThreading() {
        return threading;
    }

    public MainThread getMainThread() {
        return mainThread;
    }

    public Storage getStorage() {
        return storage;
    }

    public LogCallback getLog() {
        return log;
    }

    public boolean isPersistUploadingFiles() {
        return persistUploadingFiles;
    }
}