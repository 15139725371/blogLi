package com.lrm.service;

import com.lrm.dao.AdminsRepository;
import com.lrm.po.Blog;
import com.lrm.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.jws.soap.SOAPBinding;
import java.util.List;

@Service
public class AdminsServiceImpl implements AdminsService{

    @Autowired
    public AdminsRepository adminsRepository;


    @Override
    public Page<User> listUser(Pageable pageable) {
        System.out.println(adminsRepository.findAllBy(pageable).get(0));
        System.out.println(adminsRepository.findAllBy(pageable).size());
        Page<User> user =adminsRepository.findAll(pageable);
        return user;
    }

    @Override
    public List<User> listUser2(Pageable pageable) {
        return adminsRepository.findAllAll(pageable);
    }

    @Override
    public List<User> search(String nickname) {
        List<User> list=adminsRepository.search("%"+nickname+"%");
        for (int i = 0; i < list.size(); i++) {
            if(list.get(i).getType()==0){
                list.remove(i);
            }
        }
        return list;
    }


    @Transactional
    @Override
    public void deleteUser(Long id) {
        adminsRepository.delete(id);
    }

    @Transactional
    @Override
    public void addAdmin(User user) {
        adminsRepository.save(user);
    }
}
