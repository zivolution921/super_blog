require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end

  test "should show categories listing" do 
    get categories_path
    assert_template 'categories/index'
    #select a link and ensure that the link is category path and sending cariable cateogry and category name
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
  
end