/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.core.modules.internal.messages;

import im.actor.core.api.OutPeer;
import im.actor.core.api.rpc.RequestMessageReceived;
import im.actor.core.api.rpc.ResponseVoid;
import im.actor.core.entity.PeerEntity;
import im.actor.core.modules.ModuleContext;
import im.actor.core.network.RpcCallback;
import im.actor.core.network.RpcException;

public class CursorReceiverActor extends CursorActor {

    public CursorReceiverActor(ModuleContext context) {
        super(CURSOR_RECEIVED, context);
    }

    @Override
    protected void perform(final PeerEntity peer, final long date) {
        OutPeer outPeer = buidOutPeer(peer);

        if (outPeer == null) {
            return;
        }

        request(new RequestMessageReceived(outPeer, date), new RpcCallback<ResponseVoid>() {
            @Override
            public void onResult(ResponseVoid response) {
                onCompleted(peer, date);
            }

            @Override
            public void onError(RpcException e) {
                CursorReceiverActor.this.onError(peer, date);
            }
        });
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof MarkReceived) {
            MarkReceived received = (MarkReceived) message;
            moveCursor(received.getPeer(), received.getDate());
        } else {
            super.onReceive(message);
        }
    }

    public static class MarkReceived {
        private PeerEntity peer;
        private long date;

        public MarkReceived(PeerEntity peer, long date) {
            this.peer = peer;
            this.date = date;
        }

        public PeerEntity getPeer() {
            return peer;
        }

        public long getDate() {
            return date;
        }
    }
}
