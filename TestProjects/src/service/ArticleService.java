package service;

import pojo.Article;

import java.util.List;

public interface ArticleService {
    public List<Article> queryArticle(String accountId)throws Exception;
    public void insertArticle(Article article)throws Exception;
    public Article findArticleByName(Article article)throws Exception;
}
