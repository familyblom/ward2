require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = posts(:welcome)
  end

  def tests_default_validity
    assert @post.valid?
  end

  def test_must_have_an_author
    @post.author = nil
    assert @post.invalid?
  end

  def test_must_have_a_title
    @post.title = nil
    assert @post.invalid?
  end

  def test_must_have_a_body
    @post.body = nil
    assert @post.invalid?
  end

  def test_title_must_be_unique
    @post.save
    duplicate = Post.new title: 'different', body: @post.body, author: @post.author, published_at: Time.now + 5.minutes
    assert duplicate.valid?
    duplicate.title = @post.title
    duplicate.save
    assert duplicate.invalid?
  end

  def test_title_is_between_6_and_65
    @post.title = '12345'
    assert @post.invalid?
    @post.title = "#{"s" * 66}"
    assert @post.invalid?
  end

  def tests_that_published_at_date_is_in_the_future
    post = Post.create body: 'ok', author: 'cool', title: "asdfasdf", published_at: (Time.now - 5.minutes)
    assert post.invalid?
  end

  def teardown
    Post.destroy_all
  end

end
