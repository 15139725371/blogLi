package com.lrm.web.admin;

import com.lrm.po.Type;
import com.lrm.po.User;
import com.lrm.service.AdminsService;
import com.lrm.util.MD5Utils;
import com.lrm.vo.BlogQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

/**
 * Created by lizhonghua on 2020/12/13.
 */
@Controller
@RequestMapping("/admins")
public class AdminsController {
    private static final String INPUT = "super_admin/blogs-input";
    private static final String LIST = "super_admin/admins";
    private static final String REDIRECT_LIST = "redirect:/admins/users";


    @Autowired
    public AdminsService adminsService;

    @GetMapping("/users")
    public String admins(@PageableDefault(size = 8, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                         BlogQuery blog, Model model) {
       //Page page = adminsService.listUser(pageable);
        //model.addAttribute("page", adminsService.listUser(pageable));
        model.addAttribute("page",adminsService.listUser2(pageable));
        return LIST;
    }

    @PostMapping("/search")
    public String search(@RequestParam("title") String title, Model model){
        model.addAttribute("page",adminsService.search(title));
        return "super_admin/admins :: blogList";
    }


    @GetMapping("/users/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes attributes) {
        adminsService.deleteUser(id);
        attributes.addFlashAttribute("message", "删除成功");
        return REDIRECT_LIST;
    }

    @GetMapping("/users/input")
    public String input(Model model) {
       // model.addAttribute("user", new User());
        return "super_admin/admins-input";
    }

    @PostMapping("/addAdmin")
    public String addAdmin(@PageableDefault(size = 8, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                           BlogQuery blog, Model model, User user){

        user.setType(1);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setPassword(MD5Utils.code(user.getPassword()));
        adminsService.addAdmin(user);

        System.out.println(user.getUsername()+user.toString());
        model.addAttribute("page",adminsService.listUser2(pageable));
        return LIST;
    }

}
