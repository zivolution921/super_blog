require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do 
      #http post request to category path
      post_via_redirect categories_path, category: { name: "sports"}
    end
    #sending user to categories index
    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do 
    get new_category_path
    assert_template 'categories/new'
    #difference in category
    assert_no_difference 'Category.count' do 
      #http post request to category path
      post categories_path, category: { name: " "}
    end
    #sending user to categories index
    assert_template 'categories/new'
    #from shared _errors.html.erb
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end