class ProductsController < ApplicationController

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
    current_cart.add_product_to_cart(@product)

    flash[:notice]= "成功#{@product.title}加入购物车"
  else
    flash[:warning]= "购物车中已有该物品"
  end
    redirect_to :back
  end

  def index
   @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    set_page_title @product.title

    page_description = view_context.truncate(@product.description, :length =>5)
    set_page_description "#{page_description}"

    set_page_keywords    "你好啊#{@product.price}"

    set_page_image @product.image_url

  end


end
