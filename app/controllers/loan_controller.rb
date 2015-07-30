class LoanController < ApplicationController

  def index 

  end

  def kredit
  	iznos_kredita = params[:kredit].to_i
  	session[:visina_kredita] = iznos_kredita

  	mjesecna_kamata = (params[:kamata].to_f)/100/12
  	session[:postotak] = mjesecna_kamata

  	mjeseci_otplate = params[:mjesec].to_i
  	session[:mjeseci] = mjeseci_otplate

  	godina_otplate = session[:mjeseci].to_i / 12
  	session[:godine] = godina_otplate

  	mjesecna_otplata = (1+ session[:postotak])**session[:mjeseci]
  	session[:mjesecno] = mjesecna_otplata

  	num1 = (session[:visina_kredita] * session[:mjesecno] * session[:postotak])
  	session[:formula1] = num1

  	num2 = (session[:mjesecno] - 1)
  	session[:formula2] = num2

	  redirect_to(:action => 'calculate')
  end

  def calculate
  	@loan = Loan.new
  	@loan.glavnica = session[:visina_kredita]
  	@loan.kamatica = session[:postotak]*100*12
    @loan.uplata_kamate = session[:postotak]

  	@loan.mjeseci_zivota = session[:mjeseci].to_i
  	@loan.godine = session[:godine]
  	@loan.mjesecno = session[:mjesecno] 
  	@loan.mjesecna_rata = session[:formula1].to_f / session[:formula2].to_f
  	@loan.ukupno_vracate = @loan.mjesecna_rata * @loan.mjeseci_zivota
  	@loan.ukupno_kamate = (@loan.mjesecna_rata * @loan.mjeseci_zivota)-@loan.glavnica

    
  end	  
end