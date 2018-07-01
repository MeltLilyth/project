import Mapper.ArticleMapper;
import Mapper.ImgMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Article;
import pojo.Img;
import service.UserService;
import service.UserServiceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TestMain {

    public static void main(String[] args)throws Exception{
        String str = "Config/springConfig/applicationContext.xml";
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext(str);
        ArticleMapper articleMapper = applicationContext.getBean("articleMapper",ArticleMapper.class);
        Article article = new Article();
        article.setAccountId("8873737792");
        article.setTitle("幻想中的钢琴曲");
        Article get =articleMapper.findArticleByName(article);
        System.out.println(get);
    }
}
