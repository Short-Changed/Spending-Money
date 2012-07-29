class ExpendituresController < ApplicationController
  def create
    @expenditure = Expenditure.new(params[:expenditure])

    respond_to do |format|
      if @expenditure.save
        format.html { redirect_to @expenditure, notice: 'Expenditure was successfully created.' }
        format.json { render json: @expenditure, status: :created, location: @expenditure }
      else
        format.html { render action: "new" }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @expenditure = Expenditure.find(params[:id])

    respond_to do |format|
      if @expenditure.update_attributes(params[:expenditure])
        format.html { redirect_to @expenditure, notice: 'Expenditure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expenditure = Expenditure.find(params[:id])
    @expenditure.destroy

    respond_to do |format|
      format.html { redirect_to expenditures_url }
      format.json { head :no_content }
    end
  end
end
