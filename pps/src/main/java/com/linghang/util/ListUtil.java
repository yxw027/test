package com.linghang.util;

import java.util.ArrayList;
import java.util.List;

public class ListUtil {
    /**
     * 将一个List分割为多个list
     *
     * @param allList 要分割的List
     * @param size    分割的大小
     * @return
     */
    public static <T> List<List<T>> getSubList(List<T> allList, int size) {
        List<List<T>> lists = new ArrayList<List<T>>();
        for (int i = 0; i < allList.size(); i += size) {
            if (i + size < allList.size()) {
                lists.add(allList.subList(i, i + size));
            } else {
                lists.add(allList.subList(i, allList.size()));
            }
        }
        return lists;
    }

}
