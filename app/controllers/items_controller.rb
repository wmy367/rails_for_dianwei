class ItemsController < ApplicationController
    before_action :signed_in_user,only: [:new,:create,:edit,:update,:destroy]
    before_action :correct_user,only: [:edit,:update,:destroy]
    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        @item.status = "新报修"
        @item.user = current_user
        if @item.save
            flash[:success] = "记录物品成功"
            redirect_to @item
        else
            render :new
        end
    end

    def show
        @item = Item.find(params[:id])
    end

    def index
        @items = Item.paginate(page: params[:page])
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])

        if @item.user.nil?
            pas = item_params.merge( {user: current_user})
        else
            pas = item_params
        end

        if @item.update(pas)
            flash[:success] = "修改物品成功"
            redirect_to @item
        else
            render :edit
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_url
    end

    private
        def item_params
          params.require(:item).permit(:name, :email,:phone,:info,:status,:tag)
        end

        def correct_user
            item = Item.find(params[:id])
            user = item.user
            unless current_user?(user)
                redirect_to root_path
            end
        end


end
