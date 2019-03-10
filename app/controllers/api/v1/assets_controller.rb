class Api::V1::AssetsController < ApplicationController

  def index
    @assets = Asset.all
    render json: @assets
  end

  def show
    @asset = Asset.find(params[:id])
    render json: @asset
  end

  def create
    @asset = Asset.create(asset_params)
    if @asset.save
      render json: @asset, status: :accepted
    else
      render json: { errors: @asset.errors }, status: :unprocessible_entity
    end
  end

  def update
    @asset = Asset.find(params[:id])

    @asset.update(asset_params)
    if @asset.save
      render json: @asset, status: :accepted
    else
      render json: { errors: @asset.errors }, status: :unprocessible_entity
    end
  end

  def destroy
    @asset = Asset.find(params[:id])

    @asset.destroy
    render json: @asset
  end

  private

  def asset_params
    params.permit(:name, :amount, :user_id)
  end

  def find_asset
    @asset = Asset.find(params[:id])
  end
end
