require 'spec_helper'

describe "the articles interface", type: :request do
  before(:each) do
    @test_articles = []
    3.times{ @test_articles << Fabricate(:article) }
  end
  describe "on the index page" do
    before(:each) {visit articles_path}

    it "should list the article titles on the index" do
      @test_articles.each do |article|
        page.should have_content(article.title.titleize)
      end
    end

    it "should have links for the articles on the index" do
      @test_articles.each do |article|
        page.should have_link("Show", :href => article_path(article))
      end
    end
  end
end