package com.lrm.web.admin;

import com.lrm.minganzifu.SensitivewordFilter;
import com.lrm.po.Blog;
import com.lrm.po.Type;
import com.lrm.po.User;
import com.lrm.service.BlogService;
import com.lrm.service.TagService;
import com.lrm.service.TypeService;
import com.lrm.vo.BlogQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Set;

/**
 * Created by lizhonghua on 2020/12/13.
 */
@Controller
@RequestMapping("/admin")
public class BlogController {

    private static final String INPUT = "admin/blogs-input";
    private static final String LIST = "admin/blogs";
    private static final String REDIRECT_LIST = "redirect:/admin/blogs";


    @Autowired
    private BlogService blogService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private TagService tagService;

//    public Blog QuickSort(Blog blog){
//        int
////如果left等于right，即数组只有一个元素，直接返回
//        if(left>=right) {
//            return;
//        }
//        //设置最左边的元素为基准值
//        int key=num[left];
//        //数组中比key小的放在左边，比key大的放在右边，key值下标为i
//        int i=left;
//        int j=right;
//        while(i<j){
//            //j向左移，直到遇到比key小的值
//            while(num[j]>=key && i<j){
//                j--;
//            }
//            //i向右移，直到遇到比key大的值
//            while(num[i]<=key && i<j){
//                i++;
//            }
//            //i和j指向的元素交换
//            if(i<j){
//                int temp=num[i];
//                num[i]=num[j];
//                num[j]=temp;
//            }
//        }
//        num[left]=num[i];
//        num[i]=key;
//        count++;
//        QuickSort(num,left,i-1);
//        QuickSort(num,i+1,right);
//
//        return blog;
//    }


    //敏感词过滤
    public Set<String> mingan(String string){
        SensitivewordFilter filter = new SensitivewordFilter();
        System.out.println("敏感词的数量：" + filter.sensitiveWordMap.size());
//        String string = "第一夫人太多的伤感情怀也许只局限于饲养基地 荧幕中的情节，主人公尝试着去用某种方式渐渐的很潇洒地释自杀指南怀那些自己经历的伤感。"
//                + "然后法.轮.功 我们的扮演的角色就是跟随着主人公的喜红客联盟 怒哀乐而过于牵强的把自己的情感也附加于银幕情节中，然后感动就流泪，"
//                + "难过就躺在某一个人的怀里尽情的阐述心扉或者手机卡复制器一个人一杯红酒一部电影在夜三.级.片 深人静的晚上，关上电话静静的发呆着主席李世民红满堂红满堂。中国教徒,轮法功。";
        System.out.println("待检测语句字数：" + string.length());
        long beginTime = System.currentTimeMillis();
        Set<String> set = filter.getSensitiveWord(string, 1);
        long endTime = System.currentTimeMillis();
        System.out.println("语句中包含敏感词的个数为：" + set.size() + "。包含：" + set);
        System.out.println("总共消耗时间为：" + (endTime - beginTime));
        return set;
    }



    @GetMapping("/blogs")
    public String blogs(@PageableDefault(size = 8, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                        BlogQuery blog, Model model) {
        model.addAttribute("types", typeService.listType());
        model.addAttribute("page", blogService.listBlog(pageable, blog));
        return LIST;
    }

    @PostMapping("/blogs/search")
    public String search(@PageableDefault(size = 8, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                         BlogQuery blog, Model model) {
        model.addAttribute("page", blogService.listBlog(pageable, blog));
        return "admin/blogs :: blogList";
    }


    @GetMapping("/blogs/input")
    public String input(Model model) {
        setTypeAndTag(model);
        model.addAttribute("blog", new Blog());
        return INPUT;
    }

    private void setTypeAndTag(Model model) {
        model.addAttribute("types", typeService.listType());
        model.addAttribute("tags", tagService.listTag());
    }


    @GetMapping("/blogs/{id}/input")
    public String editInput(@PathVariable Long id, Model model) {
        setTypeAndTag(model);
        Blog blog = blogService.getBlog(id);
        blog.init();
        model.addAttribute("blog",blog);
        return INPUT;
    }



    @PostMapping("/blogs")
    public String post(Blog blog, RedirectAttributes attributes, HttpSession session) {
        //首先判断内容中是否包含敏感词
        Set<String> set=mingan(blog.getContent());
        if(set.size()>0){
            attributes.addFlashAttribute("messageError", "操作失败文件包含敏感词："+set);
        }else {
            blog.setUser((User) session.getAttribute("user"));
            blog.setType(typeService.getType(blog.getType().getId()));
            blog.setTags(tagService.listTag(blog.getTagIds()));
            Blog b;
            if (blog.getId() == null) {
                b =  blogService.saveBlog(blog);
            } else {
                b = blogService.updateBlog(blog.getId(), blog);
            }

            if (b == null ) {
                attributes.addFlashAttribute("message", "操作失败");
            } else {
                attributes.addFlashAttribute("message", "操作成功");
            }
        }

        return REDIRECT_LIST;
    }


    @GetMapping("/blogs/{id}/delete")
    public String delete(@PathVariable Long id,RedirectAttributes attributes) {
        blogService.deleteBlog(id);
        attributes.addFlashAttribute("message", "删除成功");
        return REDIRECT_LIST;
    }



}
