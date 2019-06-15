package xyz.zzz989.my.blog.commons.utils;

import xyz.zzz989.my.blog.commons.dto.BaseResult;

public class SqlRes2BoolUtils {
    public static boolean res2bool(Integer result) {
        return null != result && result >= 1;
    }

    public static boolean res2bool(Integer result, BaseResult baseResult){
        return res2bool(result) && baseResult.getStatus() == 200;
    }

    public static boolean res2bool(boolean result, BaseResult baseResult){
        return result && baseResult.getStatus() == 200;
    }


}
