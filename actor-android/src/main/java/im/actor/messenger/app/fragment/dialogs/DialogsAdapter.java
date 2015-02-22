package im.actor.messenger.app.fragment.dialogs;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;

import com.droidkit.engine.list.view.EngineUiList;
import com.droidkit.engine.list.view.ListState;
import com.droidkit.mvvm.ValueChangeListener;

import im.actor.messenger.R;
import im.actor.messenger.app.view.*;
import im.actor.messenger.util.Screen;
import im.actor.model.entity.Dialog;
import im.actor.model.entity.PeerType;

import static im.actor.messenger.core.Core.myUid;

public class DialogsAdapter extends EngineHolderAdapter<Dialog> {

    private static final int LOAD_GAP = 20;

    private final Typeface robotoMedium;
    private final Typeface robotoRegular;

    private final int paddingH = Screen.dp(10);
    private final int paddingV = Screen.dp(9);

    private OnItemClickedListener<Dialog> itemClicked;
    private OnItemClickedListener<Dialog> itemLongClicked;

    public DialogsAdapter(EngineUiList<Dialog> engine, Context context, OnItemClickedListener<Dialog> itemClicked,
                          OnItemClickedListener<Dialog> itemLongClicked) {
        super(engine, false, false, context);
        this.robotoMedium = Fonts.medium();
        this.robotoRegular = Fonts.regular();
        this.itemClicked = itemClicked;
        this.itemLongClicked = itemLongClicked;
    }

    @Override
    public boolean areAllItemsEnabled() {
        return false;
    }

    @Override
    public boolean isEnabled(int position) {
        return false;
    }

    @Override
    public long getItemId(Dialog obj) {
        return obj.getListId();
    }

    @Override
    protected ViewHolder<Dialog> createHolder(Dialog obj) {
        return new Holder();
    }

    private class Holder extends ViewHolder<Dialog> {
        private AvatarView avatar;
        private TextView title;
        private TextView text;
        private TextView time;

        private TintImageView state;
        private TextView counter;

        private View separator;

        private CharSequence bindedText;
        private int bindedUid;
        private int bindedGid;
        private ValueChangeListener<Boolean> privateTypingListener;
        private ValueChangeListener<int[]> groupTypingListener;
        private Dialog bindedItem;

        private int pendingColor;
        private int sentColor;
        private int receivedColor;
        private int readColor;
        private int errorColor;

        @Override
        public View init(final Dialog data, ViewGroup parent, Context context) {

            pendingColor = context.getResources().getColor(R.color.chats_state_pending);
            sentColor = context.getResources().getColor(R.color.chats_state_sent);
            receivedColor = context.getResources().getColor(R.color.chats_state_delivered);
            readColor = context.getResources().getColor(R.color.chats_state_read);
            errorColor = context.getResources().getColor(R.color.chats_state_error);

            FrameLayout fl = new FrameLayout(context);
            fl.setLayoutParams(new AbsListView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Screen.dp(72)));
            fl.setBackgroundResource(R.drawable.selector_white);

            avatar = new AvatarView(context);
            {
                FrameLayout.LayoutParams avatarLayoutParams = new FrameLayout.LayoutParams(Screen.dp(54), Screen.dp(54));
                avatarLayoutParams.gravity = Gravity.CENTER_VERTICAL | Gravity.LEFT;
                avatarLayoutParams.leftMargin = paddingH;
                avatar.setLayoutParams(avatarLayoutParams);
            }
            fl.addView(avatar);

            LinearLayout linearLayout = new LinearLayout(context);
            linearLayout.setOrientation(LinearLayout.VERTICAL);
            linearLayout.setGravity(Gravity.CENTER_VERTICAL);
            {
                FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                layoutParams.rightMargin = paddingH;
                layoutParams.leftMargin = Screen.dp(76);
                layoutParams.topMargin = paddingV;
                layoutParams.bottomMargin = paddingV;
                linearLayout.setLayoutParams(layoutParams);
            }

            LinearLayout firstRow = new LinearLayout(context);
            firstRow.setOrientation(LinearLayout.HORIZONTAL);
            {
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                firstRow.setLayoutParams(params);
            }

            title = new TextView(context);
            title.setTextColor(0xDD000000);
            title.setTypeface(robotoMedium);
            title.setTextSize(17);
            title.setPadding(0, 0, 0, 0);
            title.setSingleLine();
            title.setCompoundDrawablePadding(Screen.dp(4));
            title.setEllipsize(TextUtils.TruncateAt.END);
            {
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT);
                params.weight = 1;
                title.setLayoutParams(params);
            }
            firstRow.addView(title);

            time = new TextView(context);
            time.setTextColor(getContext().getResources().getColor(R.color.text_subheader));
            time.setTypeface(robotoRegular);
            time.setTextSize(12);
            time.setPadding(Screen.dp(8), 0, 0, 0);
            time.setSingleLine();
            firstRow.addView(time);

            linearLayout.addView(firstRow);

            text = new TextView(context);
            text.setTypeface(robotoRegular);
            text.setTextSize(14);
            text.setPadding(0, 0, Screen.dp(28), 0);
            text.setSingleLine();
            text.setEllipsize(TextUtils.TruncateAt.END);
            linearLayout.addView(text);

            fl.addView(linearLayout);

            separator = new View(context);
            separator.setBackgroundColor(getContext().getResources().getColor(R.color.divider));
            FrameLayout.LayoutParams divLayoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    getContext().getResources().getDimensionPixelSize(R.dimen.div_size));
            divLayoutParams.leftMargin = Screen.dp(76);
            divLayoutParams.rightMargin = Screen.dp(10);
            divLayoutParams.gravity = Gravity.BOTTOM;
            fl.addView(separator, divLayoutParams);

            state = new TintImageView(context);
            {
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(Screen.dp(28), Screen.dp(12), Gravity.BOTTOM | Gravity.RIGHT);
                params.bottomMargin = Screen.dp(16);
                params.rightMargin = Screen.dp(9);
                state.setLayoutParams(params);
                fl.addView(state);
            }

            counter = new TextView(context);
            counter.setTextColor(Color.WHITE);
            counter.setBackgroundColor(0xff46aa36);
            counter.setPadding(Screen.dp(4), 0, Screen.dp(4), 0);
            counter.setTextSize(10);
            counter.setTypeface(robotoRegular);
            counter.setGravity(Gravity.CENTER);
            counter.setIncludeFontPadding(false);
            counter.setMinWidth(Screen.dp(14));
            {
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, Screen.dp(14), Gravity.BOTTOM | Gravity.RIGHT);
                params.bottomMargin = Screen.dp(12);
                params.rightMargin = Screen.dp(10);
                counter.setLayoutParams(params);
                fl.addView(counter);
            }

            fl.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (bindedItem != null) {
                        itemClicked.onClicked(bindedItem);
                    }
                }
            });
            if (itemLongClicked != null) {
                fl.setOnLongClickListener(new View.OnLongClickListener() {
                    @Override
                    public boolean onLongClick(View v) {
                        if (bindedItem != null) {
                            itemLongClicked.onClicked(bindedItem);
                            return true;
                        } else {
                            return false;
                        }
                    }
                });
            }

            return fl;
        }

        @Override
        public void bind(Dialog data, int position, final Context context) {
            if (getEngine().getListState().getValue().getState() == ListState.State.LOADED) {
                if (position > getCount() - LOAD_GAP) {
                    // DialogsHistoryActor.get().onEndReached();
                }
            }

            this.bindedItem = data;
            avatar.unbind();
            avatar.setEmptyDrawable(AvatarDrawable.create(data, 24, context));
            if (data.getDialogAvatar() != null && data.getDialogAvatar().getSmallImage() != null) {
                avatar.bindAvatar(54, data.getDialogAvatar());
            }

            if (data.getUnreadCount() > 0) {
                counter.setText("" + data.getUnreadCount());
                counter.setVisibility(View.VISIBLE);
            } else {
                counter.setVisibility(View.GONE);
            }

            title.setText(data.getDialogTitle());

            int right = 0;
            int left = 0;

//            if (!NotificationSettings.getInstance().convValue(DialogUids.getDialogUid(data)).getValue()) {
//                right = R.drawable.dialogs_mute;
//            }

            if (data.getPeer().getPeerType() == PeerType.GROUP) {
                left = R.drawable.dialogs_group;
            }

            title.setCompoundDrawablesWithIntrinsicBounds(left, 0, right, 0);

            time.setText(Formatter.formatShortDate(data.getDate()));

            boolean isGroup = data.getPeer().getPeerType() == PeerType.GROUP;
            if (data.getMessageType() == Dialog.ContentType.TEXT) {
                bindedText = MessageTextFormatter.textMessage(data.getSenderId(), isGroup, data.getText());
            } else if (data.getMessageType() == Dialog.ContentType.DOCUMENT_PHOTO) {
                bindedText = MessageTextFormatter.photoMessage(data.getSenderId(), isGroup);
            } else if (data.getMessageType() == Dialog.ContentType.DOCUMENT_VIDEO) {
                bindedText = MessageTextFormatter.videoMessage(data.getSenderId(), isGroup);
            } else if (data.getMessageType() == Dialog.ContentType.DOCUMENT) {
                bindedText = MessageTextFormatter.documentMessage(data.getSenderId(), isGroup);
            } else if (data.getMessageType() == Dialog.ContentType.SERVICE_REGISTERED) {
                bindedText = MessageTextFormatter.joinedActor(data.getSenderId());
            } else if (data.getMessageType() == Dialog.ContentType.SERVICE_CREATED) {
                bindedText = MessageTextFormatter.groupCreated(data.getSenderId());
            } else if (data.getMessageType() == Dialog.ContentType.SERVICE_LEAVE) {
                bindedText = MessageTextFormatter.groupLeave(data.getSenderId());
            } else if (data.getMessageType() == Dialog.ContentType.SERVICE_ADD) {
                bindedText = MessageTextFormatter.groupAdd(data.getSenderId(), data.getRelatedUid());
            } else if (data.getMessageType() == Dialog.ContentType.SERVICE_KICK) {
                bindedText = MessageTextFormatter.groupKicked(data.getSenderId(), data.getRelatedUid());
            } else if (data.getMessageType() == Dialog.ContentType.SERVICE_TITLE) {
                bindedText = MessageTextFormatter.groupChangeTitle(data.getSenderId());
            } else if (data.getMessageType() == Dialog.ContentType.SERVICE_AVATAR) {
                bindedText = MessageTextFormatter.groupChangeAvatar(data.getSenderId());
            } else if (data.getMessageType() == Dialog.ContentType.SERVICE_AVATAR_REMOVED) {
                bindedText = MessageTextFormatter.groupRemoveAvatar(data.getSenderId());
            } else {
                bindedText = "";
            }

            if (privateTypingListener != null) {
                // TypingModel.privateChatTyping(bindedUid).removeUiSubscriber(privateTypingListener);
                privateTypingListener = null;
            }

            if (groupTypingListener != null) {
                // TypingModel.groupChatTyping(bindedGid).removeUiSubscriber(groupTypingListener);
                groupTypingListener = null;
            }

            text.setText(bindedText);
            text.setTextColor(getContext().getResources().getColor(R.color.text_primary));

            if (data.getPeer().getPeerType() == PeerType.PRIVATE) {
                bindedUid = data.getPeer().getPeerId();
                privateTypingListener = new ValueChangeListener<Boolean>() {
                    @Override
                    public void onChanged(Boolean value) {
                        if (value) {
                            text.setText(R.string.typing_private);
                            text.setTextColor(context.getResources().getColor(R.color.primary));
                        } else {
                            text.setText(bindedText);
                            text.setTextColor(getContext().getResources().getColor(R.color.text_primary));
                        }
                    }
                };
                // TypingModel.privateChatTyping(bindedUid).addUiSubscriber(privateTypingListener);
            } else if (data.getPeer().getPeerType() == PeerType.GROUP) {
                bindedGid = data.getPeer().getPeerId();
                groupTypingListener = new ValueChangeListener<int[]>() {
                    @Override
                    public void onChanged(int[] value) {
                        if (value.length != 0) {
                            text.setText(Formatter.formatTyping(value));
                            text.setTextColor(context.getResources().getColor(R.color.primary));
                        } else {
                            text.setText(bindedText);
                            text.setTextColor(getContext().getResources().getColor(R.color.text_primary));
                        }
                    }
                };
                // TypingModel.groupChatTyping(bindedGid).addUiSubscriber(groupTypingListener);
            } else {
                text.setText(bindedText);
                text.setTextColor(getContext().getResources().getColor(R.color.text_primary));
            }

            if (data.getSenderId() != myUid()) {
                state.setVisibility(View.GONE);
            } else {
                switch (data.getStatus()) {
                    default:
                    case PENDING:
                        state.setResource(R.drawable.msg_clock);
                        state.setTint(pendingColor);
                        break;
                    case SENT:
                        state.setResource(R.drawable.msg_check_1);
                        state.setTint(sentColor);
                        break;
                    case RECEIVED:
                        state.setResource(R.drawable.msg_check_2);
                        state.setTint(receivedColor);
                        break;
                    case READ:
                        state.setResource(R.drawable.msg_check_2);
                        state.setTint(readColor);
                        break;
                    case ERROR:
                        state.setResource(R.drawable.msg_error);
                        state.setTint(errorColor);
                        break;
                }
                state.setVisibility(View.VISIBLE);
            }

            if (position == getCount() - 1) {
                separator.setVisibility(View.GONE);
            } else {
                separator.setVisibility(View.VISIBLE);
            }
        }

        @Override
        public void unbind() {
            this.bindedItem = null;

            if (privateTypingListener != null) {
                // TypingModel.privateChatTyping(bindedUid).removeUiSubscriber(privateTypingListener);
                privateTypingListener = null;
            }

            if (groupTypingListener != null) {
                // TypingModel.groupChatTyping(bindedGid).removeUiSubscriber(groupTypingListener);
                groupTypingListener = null;
            }

            avatar.unbind();
        }
    }
}