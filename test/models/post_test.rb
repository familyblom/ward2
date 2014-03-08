require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = build(:post)
    # @saved_post = create(:post)
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
    duplicate = build(:post, title: "Unique")
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
    @post.published_at = Time.now - 10.minutes
    assert @post.invalid?, "Time can't be in the past #{@post.errors.full_messages}"
  end

  def teardown
    Post.destroy_all
  end

end
