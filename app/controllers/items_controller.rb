class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all

    if params[:search].present?
      term = "%#{params[:search]}%"
      @items = @items.where("title LIKE ? OR description LIKE ?", term, term)
    end

    if params[:ordering].present?
      ordering = params[:ordering]
      direction = ordering.start_with?('-') ? :desc : :asc
      field = ordering.sub('-', '')

      # Garante que o campo de ordenação é válido (para evitar SQL Injection)
      if Item.column_names.include?(field)
        @items = @items.order(field => direction)
      end
    end

    
    @items = @items.limit(page_size).offset(paginate_offset)

    render json: @items, status: :ok
  end

  def show
    @item = Items.find(params[:id])
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: {
        message: "Criado com sucesso!",
        item: @item
      }, status: :ok
    else
      render json: {
        message: @item.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      render json: {
        message: "Atualizado com sucesso!",
        item: @item
      }, status: :ok
    else
      render json: {
        message: @item.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      render json: {
        message: "Item deletado com sucesso!"
      }, status: :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :user_id)
  end
end
