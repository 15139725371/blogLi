package com.lrm.service;

import com.lrm.po.Comment;

import java.util.List;

/**
 * Created by lizhonghua on 2020/12/15.
 */
public interface CommentService {

    List<Comment> listCommentByBlogId(Long blogId);

    List<Comment> findAllComment();

    Comment saveComment(Comment comment);

    Comment findOndCommentById(long commentId);

    void delOneComent(long commentId);
}
