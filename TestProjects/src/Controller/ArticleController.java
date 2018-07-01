package Controller;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import pojo.Article;
import pojo.Date;
import pojo.Img;
import pojo.User;
import service.*;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class ArticleController {
    @Autowired(required = false)
    private ArticleServiceImpl articleService;
    @Autowired(required = false)
    private UserServiceImpl userService;
    @Autowired(required = false)
    private ImgServiceImpl imgService;
    @Autowired(required = false)
    private Date date;

    @RequestMapping(value = "/publish.action",method = {RequestMethod.POST})
    public String articlePublish(Article articles,Model model)throws Exception{
        articles.setTime(date.getDate());
        System.out.println(articles);
        articleService.insertArticle(articles);
        List<Article> list = articleService.queryArticle(articles.getAccountId());
        User user = userService.queryUser(articles.getAccountId());
        Img img = imgService.queryImg(articles.getAccountId());
        model.addAttribute("user",user);
        model.addAttribute("img",img);
        model.addAttribute("articleList",list);
        return "UserI";
    }
    @RequestMapping(value = "/Articleread.action",method = {RequestMethod.GET,RequestMethod.POST})
    public String articleRead(String accountId,String title,String time,Model model)throws Exception {
        if(accountId!=null&&title!=null){
            Article article = new Article();
            article.setTitle(title);
            article.setTime(time);
            article.setAccountId(accountId);
            Article result = articleService.findArticleByName(article);
            User user = userService.queryUser(accountId);
            Img headImg = imgService.queryImg(accountId);
            model.addAttribute("user",user);
            model.addAttribute("img",headImg);
            model.addAttribute("articles",result);
        }
        return "Article";
    }
    @RequestMapping(value = "/return.action",method = {RequestMethod.GET,RequestMethod.POST})
    public String returnMainpage(String accountId,Model model)throws Exception{
        List<Article> list = articleService.queryArticle(accountId);
        User user = userService.queryUser(accountId);
        Img headimg = imgService.queryImg(accountId);
        model.addAttribute("user",user);
        model.addAttribute("img",headimg);
        model.addAttribute("articleList",list);
        return "UserI";
    }
}
