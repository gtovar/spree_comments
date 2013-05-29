Spree::Admin::OrdersController.class_eval do
    include Spree::Admin::NavigationHelper

def comments
    load_order
    @comment_types = Spree::CommentType.where(:id =>1)
  end
end
