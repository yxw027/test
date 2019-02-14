package com.linghang.websocket;

/**
 * @author liuhao on 16/4/11.
 * 频道类型
 */
public enum SocketType {
    /**
     * 控制端
     */
    COMMAND("Command", 1),
    /**
     * 客户端
     */
    CLIENT("Client", 0);

    private String text;
    private Integer value;

    SocketType(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

}
