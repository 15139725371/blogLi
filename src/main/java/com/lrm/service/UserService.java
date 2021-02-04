package com.lrm.service;

import com.lrm.po.User;

/**
 * Created by lizhonghua on 2020/12/16.
 */
public interface UserService {

    User checkUser(String username, String password);
}
