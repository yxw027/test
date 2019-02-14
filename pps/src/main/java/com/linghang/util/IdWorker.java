package com.linghang.util;

/**
 * 数据库ID生成工具
 *
 * @author liuhao
 */
public class IdWorker {

    /**
     * 起始时间戳，用于用当前时间戳减去这个时间戳，算出偏移量
     **/
    private static final long OFFSET = 1528370000000L;
    /**
     * 记录上次生成的ID
     */
    private static long lastId = 0L;

    public synchronized static long nextId() {
        long nextId = System.currentTimeMillis() - OFFSET;
        if (0 > nextId) {
            throw new RuntimeException(String.format("Clock moved backwards.  Refusing to generate id for %d milliseconds", OFFSET));
        }
        if (lastId >= nextId) {
            return ++lastId;
        }
        lastId = nextId;
        return nextId;
    }

}
