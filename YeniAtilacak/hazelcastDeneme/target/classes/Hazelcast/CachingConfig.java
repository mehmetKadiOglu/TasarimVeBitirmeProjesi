package com.Hazelcast;

import com.hazelcast.config.Config;
import com.hazelcast.config.MulticastConfig;
import com.hazelcast.config.TcpIpConfig;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Collections;

@Configuration("cachingConfig")
@EnableCaching
public class CachingConfig {

    @Bean
    public Config hazelcastConfig(){
        Config config = new Config();
        String INSTANCE_NAME = "hazelcast-deneme";
        config.setInstanceName(INSTANCE_NAME);
        config.getNetworkConfig().getJoin().setMulticastConfig(new MulticastConfig().setEnabled(false));
        int port = 9902;
        config.getNetworkConfig().getJoin().setTcpIpConfig(new TcpIpConfig().setEnabled(true).setMembers(Collections.singletonList("127.0.0.1:"+port)));
        config.getNetworkConfig().setPort(port);
        return config;
    }
}
