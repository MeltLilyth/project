package Controller;

import Mapper.UserMapper;
import com.sun.net.httpserver.HttpServer;
import javafx.application.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pojo.Article;
import pojo.Img;
import pojo.User;
import service.ArticleService;
import service.ArticleServiceImpl;
import service.ImgServiceImpl;
import service.UserServiceImpl;


import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class Test {
    @Autowired(required = false)
    private UserServiceImpl userService;
    @Autowired(required = false)
    private ArticleServiceImpl articleService;
    @Autowired(required = false)
    private ImgServiceImpl imgService;

    //输入连接后跳转页面
    @RequestMapping("/index")
    public ModelAndView index()throws Exception{
        String accountId = userService.getAccountId();
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("accountId",accountId);
        return modelAndView;
    }
    //用户注册响应
    @RequestMapping(value = "/regist.action",method = {RequestMethod.GET})
    public ModelAndView addNewUser(User user)throws Exception{
        userService.addUser(user);
        Img img = new Img();
        img.setAccountId(user.getAccountId());
        img.setImg(null);
        imgService.insertImg(img);
        return new ModelAndView("index");
    }
    //用户登录响应
    @RequestMapping(value="/login.action",method = {RequestMethod.GET,RequestMethod.POST})
    public String userLogin(User user,Model model)throws Exception{
        User loginuser = userService.queryUser(user.getAccountId());
        if(loginuser!=null){
            if(loginuser.getPassword().equals(user.getPassword())){
                List<Article> list = articleService.queryArticle(loginuser.getAccountId());
                Img img = imgService.queryImg(loginuser.getAccountId());
                model.addAttribute("img",img);
                model.addAttribute("user",loginuser);
                model.addAttribute("articleList",list);
                return "UserI";
            }
            else {
                model.addAttribute("message","用户密码错误");
                return "index";
            }
        }
        else{
            model.addAttribute("message","用户账号不存在");
            return "index";
        }
    }
    @RequestMapping(value = "/userUpdate.action",method = {RequestMethod.POST,RequestMethod.GET})
    public String updateUser(User user,Model model)throws Exception{
        System.out.println(user);
        userService.updateMessage(user);
        User loginuser = userService.queryUser(user.getAccountId());
        List<Article> list = articleService.queryArticle(loginuser.getAccountId());
        Img img = imgService.queryImg(loginuser.getAccountId());
        model.addAttribute("img",img);
        model.addAttribute("user",loginuser);
        model.addAttribute("articleList",list);
        return "UserI";
    }

    @RequestMapping("/signout.action")
    public String Signout(HttpSession session)throws Exception{
        if(session!=null){
            session.removeAttribute("user");
            session.invalidate();
        }
        return "redirect:/index";
    }

    @RequestMapping(value = "/uploadImg.action",method = {RequestMethod.GET,RequestMethod.POST})
    public String uploadImg(@RequestParam String accountId,@RequestParam MultipartFile item_pic,Model model)throws Exception{
        Img heading = new Img();
        heading.setAccountId(accountId);
        if(item_pic!=null){
            String url = "G:\\picture\\Virtual server\\";
            String  orginalfilename = item_pic.getOriginalFilename();
            String newFilename = UUID.randomUUID()+orginalfilename.substring(orginalfilename.lastIndexOf("."));
            //新的文件的创建
            File newFile = new File(url+newFilename);
            //将内存中的数据写入磁盘
            item_pic.transferTo(newFile);
            heading.setImg(newFilename);
            imgService.updateImg(heading);
        }
        List<Article> list = articleService.queryArticle(accountId);
        User user = userService.queryUser(accountId);
        heading = imgService.queryImg(accountId);
        System.out.println(heading);
        model.addAttribute("img",heading);
        model.addAttribute("user",user);
        model.addAttribute("articleList",list);
        return "UserI";
    }
}
