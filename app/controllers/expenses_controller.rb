class ExpensesController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @expense = current_user.expenses.build
    end
  
    def create
      @expense = current_user.expenses.build(expense_params)
      if @expense.save
        flash[:notice] = 'Expense created successfully.'
        redirect_to expenses_path
      else
        render 'new'
      end
    end
  
    private
  
    def expense_params
      params.require(:expense).permit(:name, :amount)
    end
  end
  