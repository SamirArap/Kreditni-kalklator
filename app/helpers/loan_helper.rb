module LoanHelper

	def to_valuta(number)
		number_to_currency(number, unit: "BAM ", separator: ",", delimiter: ".")
	end


	def to_precision(number)
		number_with_precision(number, separator: ",", delimiter: ".", precision: 2)
	end
	
end
