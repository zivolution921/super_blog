require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  #everytime before test will run setup
  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do 
    #can we insert category and is it valid?
    assert @category.valid?
  end
  
  test "name should be present" do 
    #set name to empty
    @category.name = " "
    # test negative assertions
    # if this is not valid the test will pass
    assert_not @category.valid?
  end
  #hit the database than initiate new category
  test "name should be unique" do 
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name should not be too long" do 
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  #start with failed test
  test "name should not be too short" do 
    @category.name = "aa"
    assert_not @category.valid?
  end
end