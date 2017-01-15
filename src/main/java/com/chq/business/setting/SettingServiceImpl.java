package com.chq.business.setting;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import org.springframework.stereotype.Service;

/**
 * Created by CHQ on 2017/1/14.
 */
@Service("settingService")
public class SettingServiceImpl extends SuperServiceImpl<SettingMapper, SettingEntity> implements ISettingService {
}
