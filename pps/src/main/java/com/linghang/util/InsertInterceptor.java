package com.linghang.util;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.defaults.DefaultSqlSession;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Properties;

/**
 * @author by liuhao on 2017/12/25.
 * mybatis insert 拦截器
 */
@Intercepts({
        @Signature(type = Executor.class, method = "update", args = {
                MappedStatement.class, Object.class})
})
public class InsertInterceptor implements Interceptor {

    private static final String INSERT_COMMAND = "INSERT";
    private static final String LONG_PATH = "java.lang.Long";
    private static final String STRING_PATH = "java.lang.String";
    private static final String LIST = "list";

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object target = invocation.getTarget();
        if (!(target instanceof Executor)) {
            return invocation.proceed();
        }
        MappedStatement mappedStatement = (MappedStatement) invocation
                .getArgs()[0];
        String commandName = mappedStatement.getSqlCommandType().name();
        if (!INSERT_COMMAND.equals(commandName)) {
            return invocation.proceed();
        }
        if (mappedStatement.getKeyProperties() == null || mappedStatement.getKeyProperties().length == 0) {
            return invocation.proceed();
        }
        String keyString = mappedStatement.getKeyProperties()[0];
        Object parameter = invocation.getArgs()[1];
        if (parameter instanceof DefaultSqlSession.StrictMap) {
            setModelListId(keyString, parameter);
        } else {
            setModelId(keyString, parameter);
        }
        return invocation.proceed();
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {

    }

    /**
     * 设置单个model ID
     */
    private void setModelId(String keyString, Object parameter) throws Throwable {
        Class clazz = parameter.getClass();
        Field field = clazz.getDeclaredField(keyString);
        if (field == null) {
            return;
        }
        Method getMethod = clazz.getDeclaredMethod("get" + keyString.substring(0, 1).toUpperCase() + keyString.substring(1));
        Type genericType = field.getGenericType();
        if (LONG_PATH.equals(genericType.getTypeName())) {
            Method setMethod = clazz.getDeclaredMethod("set" + keyString.substring(0, 1).toUpperCase() + keyString.substring(1), Long.class);
            if (getMethod.invoke(parameter) == null) {
                setMethod.invoke(parameter, IdWorker.nextId());
            }
        } else if (STRING_PATH.equals(genericType.getTypeName())) {
            Method setMethod = clazz.getDeclaredMethod("set" + keyString.substring(0, 1).toUpperCase() + keyString.substring(1), String.class);
            if (getMethod.invoke(parameter) == null) {
                setMethod.invoke(parameter, String.valueOf(IdWorker.nextId()));
            }
        }

    }

    /**
     * 设置多个Model ID
     */
    private void setModelListId(String keyString, Object parameter) throws Throwable {
        DefaultSqlSession.StrictMap strictMap = (DefaultSqlSession.StrictMap) parameter;
        if (!strictMap.containsKey(LIST)) {
            return;
        }
        ArrayList models = (ArrayList) strictMap.get(LIST);
        if (models.isEmpty()) {
            return;
        }
        Class clazz;
        Field field;
        Type genericType;
        Method getMethod, setMethod;
        String getMethodString = "get" + keyString.substring(0, 1).toUpperCase() + keyString.substring(1);
        String setMethodString = "set" + keyString.substring(0, 1).toUpperCase() + keyString.substring(1);
        for (Object model : models) {
            clazz = model.getClass();
            field = clazz.getDeclaredField(keyString);
            if (field == null) {
                continue;
            }
            genericType = field.getGenericType();
            if (LONG_PATH.equals(genericType.getTypeName())) {
                getMethod = clazz.getDeclaredMethod(getMethodString);
                setMethod = clazz.getDeclaredMethod(setMethodString, Long.class);
                if (getMethod.invoke(model) == null) {
                    setMethod.invoke(model, IdWorker.nextId());
                }
            } else if (STRING_PATH.equals(genericType.getTypeName())) {
                getMethod = clazz.getDeclaredMethod(getMethodString);
                setMethod = clazz.getDeclaredMethod(setMethodString, String.class);
                if (getMethod.invoke(model) == null) {
                    setMethod.invoke(model, String.valueOf(IdWorker.nextId()));
                }
            }
        }
    }
}

