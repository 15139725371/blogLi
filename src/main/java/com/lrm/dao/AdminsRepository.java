package com.lrm.dao;

import com.lrm.po.Blog;
import com.lrm.po.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AdminsRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {

    @Query("select u from User u where u.type=1")
    List<User> findAllBy(Pageable pageable);

    @Query("select u from User u where u.type=1")
    List<User> findAllAll(Pageable pageable);

    @Query("select u from User u where u.nickname like ?1 or u.username like ?1 and u.type=1")
    List<User> search(String nickname);

//    @Query("select b from Blog b where b.recommend = true")
//    List<Blog> findTop(Pageable pageable);
//
//    @Query("select b from Blog b where b.title like ?1 or b.content like ?1")
//    Page<Blog> findByQuery(String query, Pageable pageable);
//
//
//    @Transactional
//    @Modifying
//    @Query("update Blog b set b.views = b.views+1 where b.id = ?1")
//    int updateViews(Long id);
//
//    @Query("select function('date_format',b.updateTime,'%Y') as year from Blog b group by function('date_format',b.updateTime,'%Y') order by year desc ")
//    List<String> findGroupYear();
//
//    @Query("select b from Blog b where function('date_format',b.updateTime,'%Y') = ?1")
//    List<Blog> findByYear(String year);
}

