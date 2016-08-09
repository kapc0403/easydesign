require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "debe poder crear un post" do
    post = Post.create(titulo: "mi titulo", contenido: "Mi contenido")
    assert post.save
  end
  test "debe actualizar un post" do
    post = posts(:one)
    assert post.update(titulo:"nuevo titulo", contenido:"add dskfdskl")
  end
  test "debe probar que encuentra un post por su id" do
    post_id = posts(:one).id
    post = Post.find(post_id)
    assert_equal post, posts(:one), "No encontró el registro"
  end
  test "no debe crear un post sin titulo" do
    post = Post.new
    assert post.invalid?, "El post no posee titulo"
  end
end
