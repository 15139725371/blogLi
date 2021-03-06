package com.lrm.dao;

import com.lrm.po.Comment;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by lizhonghua on 2020/12/16.
 */
public interface CommentRepository extends JpaRepository<Comment,Long>{


    List<Comment> findByBlogIdAndParentCommentNull(Long blogId, Sort sort);

    Comment findOndCommentById(int commentId);
}
