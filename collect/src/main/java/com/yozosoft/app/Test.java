package com.yozosoft.app;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * @author hongzhiqiang
 * @ClassName Test
 * @description:
 * @date 2024-04-23 11:13
 * @version: 1.0
 */
public class Test {

    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        //map.put("a","1");

        String b = map.computeIfAbsent("a", e -> "20");
        System.out.println("输出:" + b);

        Map<String, String> maps = new HashMap<>(Collections.emptyMap());
        //maps.put("1","2");
        maps.putIfAbsent("A", "1");
        maps.putIfAbsent("a", "2");

        System.out.println(maps);
    }

}
