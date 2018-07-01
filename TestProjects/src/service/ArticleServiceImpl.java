package service;

import Mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import pojo.Article;

import java.util.ArrayList;
import java.util.List;

public class ArticleServiceImpl implements ArticleService {
    @Autowired(required = false)
    private ArticleMapper articleMapper;

    @Override
    public List<Article> queryArticle(String accountId) throws Exception {
        return articleMapper.findArticleById(accountId);
    }

    @Override
    public void insertArticle(Article article) throws Exception {
        articleMapper.addArticle(article);
    }

    @Override
    public Article findArticleByName(Article article) throws Exception {
        return articleMapper.findArticleByName(article);
    }
}
