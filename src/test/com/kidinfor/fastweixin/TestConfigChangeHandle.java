package com.kidinfor.fastweixin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kidinfor.fastweixin.api.config.ConfigChangeNotice;
import com.kidinfor.fastweixin.handle.AbstractApiConfigChangeHandle;

/**
 * @author peiyu
 */
public class TestConfigChangeHandle extends AbstractApiConfigChangeHandle {

    private static final Logger LOG = LoggerFactory.getLogger(TestConfigChangeHandle.class);

    @Override
    public void configChange(ConfigChangeNotice notice) {
        LOG.debug("收到通知.....");
        LOG.debug(notice.toJsonString());
    }
}
