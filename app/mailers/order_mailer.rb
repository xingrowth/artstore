class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com" , subject: "[JDStore] 用户#{order.user.email}申请取消订单 #{order.token}")
  end

  def notify_ship(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已发货")
  end

  def notify_cancel(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已取消")
  end

  def apply_cancel(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com" , subject: "[JDStore] 用户#{order.user.email}申请取消订单 #{order.token}")
  end

end
