package com.wz.emptyframe.service.system.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wz.emptyframe.constant.MsgConstant;
import com.wz.emptyframe.dao.system.SysNoteDao;
import com.wz.emptyframe.dto.WebDTO;
import com.wz.emptyframe.entity.system.SysNote;
import com.wz.emptyframe.entity.system.User;
import com.wz.emptyframe.service.system.SysNoteService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wangzhe
 * @since 2020-01-21
 */
@Service
public class SysNoteServiceImpl extends ServiceImpl<SysNoteDao, SysNote> implements SysNoteService {

    @Resource
    private SysNoteDao sysNoteDao;

    @Override
    public Object listCurrUser() {
        //当前登录用户信息
        /*User user = (User) SecurityUtils.getSubject().getPrincipal();
        if (user == null) {
            return WebDTO.faliure(MsgConstant.PLEASE_LOGIN);
        }*/
        User user = new User();
        user.setId("04d214e0e3154a4f9081148331f6212b");

        QueryWrapper<SysNote> qw = new QueryWrapper();
        qw.eq("create_user", user.getId());
        qw.orderByDesc("create_time");
        List<SysNote> list = sysNoteDao.selectList(qw);

        SysNote result = null;
        if (list.size() > 0) {
            result = list.get(0);
        }
        return WebDTO.success(result);
    }
}
