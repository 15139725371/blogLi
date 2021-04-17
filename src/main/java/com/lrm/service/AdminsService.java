package com.lrm.service;

import com.lrm.po.Blog;
import com.lrm.po.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface AdminsService {
    Page<User> listUser(Pageable pageable);

    List<User> listUser2(Pageable pageable);

    List<User> search(String nickname);

    void deleteUser(Long id);

    void addAdmin(User user);
}
