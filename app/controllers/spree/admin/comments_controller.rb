class Spree::Admin::CommentsController < Spree::Admin::ResourceController
    def create
        @comment = Spree::Comment.new(params[:comment])
        @order_number = Spree::Order.find(params[:comment][:commentable_id])
        if @comment.save
        respond_to do |format|
logger.debug "=================================================================================="
            logger.debug params[:comment][:commentable_type].inspect
            format.html {redirect_to comments_admin_order_path(@order_number.number), notice: "Registrado exitosamente"}
       end
        else
            respond_with(@comment.errors) do |format|

                format.html {redirect_to comments_admin_order_path("R745518277"), notice: "No puedo estar en blanco comentario", :comment => @comment}
            end
        end
    end

    private

    def location_after_save
        :back
    end
end
