require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "Sprots")
    end
    test "category should be valid" do 
        assert @category.valid?
    end

    test "name should be present" do 
        @category.name = " "
        assert_not @category.valid?
    end

    test "name should be unique" do 
        @category.save
        @category2 = Category.new(name: "Sprots")
        assert_not @category2.valid?
    end

    test "name should be not too long" do 
        @category.name = "A"*26
        assert_not @category.valid?
    end

    test "name should be not too short" do 
        @category.name = "A"*2
        assert_not @category.valid?
    end
end