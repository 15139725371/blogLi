package com.lrm.web;

import com.lrm.po.Comment;
import com.lrm.po.User;
import com.lrm.service.BlogService;
import com.lrm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lizhonghua on 2020/12/13.
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private BlogService blogService;

    @Value("${comment.avatar}")
    private String avatar;

    @GetMapping("/comments/{blogId}")
    public String comments(@PathVariable Long blogId, Model model) {
        model.addAttribute("comments", commentService.listCommentByBlogId(blogId));
        return "blog :: commentList";
    }


    @PostMapping("/comments")
    public String post(Comment comment, HttpSession session) {
        Long blogId = comment.getBlog().getId();
        comment.setBlog(blogService.getBlog(blogId));
        User user = (User) session.getAttribute("user");
        if (user != null) {
            comment.setAvatar(user.getAvatar());
            comment.setAdminComment(true);
        } else {
            comment.setAvatar(avatar);
        }
        commentService.saveComment(comment);
        return "redirect:/comments/" + blogId;
    }

    //执行删除留言操作
    @GetMapping("/comments/deleteComment")
    public String postDel(HttpSession session,String commentId,String blogId,Model model) {
        System.out.println(commentId+"comid");
        System.out.println(blogId+"comid");
        Comment comment=commentService.findOndCommentById(Long.parseLong(commentId));//删除的记录
        List<Comment> commentList=commentService.findAllComment();
        System.out.println(comment.getId());
        boolean tt=true;
        for (int i = 0; i < commentList.size(); i++) {
            if(commentList.get(i).getParentComment()!=null){
                if (comment.getId()==commentList.get(i).getParentComment().getId()){
                    tt=false;
                    session.setAttribute("noDel","此评论不能删除，有人回复他！");
                    break;
                }else {
                    //可以删除
                    tt=true;
                    session.setAttribute("noDel","");
                }
            }
        }
        System.out.println(tt);
        if(tt){
            commentService.delOneComent(comment.getId());
        }
        model.addAttribute("blog", blogService.getAndConvert(Long.parseLong(blogId)));
        session.setAttribute("blogIdId",Long.parseLong(blogId));
        return "blog";
    }



}
