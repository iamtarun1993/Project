class SalaryController < ApplicationController

def salary
    if session[:id].present? 
    else
       redirect_to :controller => 'admin',:action => 'home'
    end 
end

def create_salary_report

    #puts("555555555555555555555555555555555555") 
    @val=params[:values]
    @val1 = JSON.parse(@val)
    @month=@val1["month"]
    @year=@val1["year"]
    @year_int=@year.to_i
    @month_int=@month.to_i
    Employeedtl.select(:emp_id,:salary).each do |t|
        @emp_id=t.emp_id
        @salary=t.salary
        #puts(@emp_id)
        #puts(@salary)
        #@date_tmp=@year+'-'+@month+'-'+1.to_s
        #puts(@date_tmp)
        @salary_db=AllSalary.find_by(emp_id: @emp_id, year: @year_int, month: @month_int)
        if @salary_db.present?
            #puts("YESSSSSSSSSSSSSSSSSSSSs")
            #puts(@salary)
            #puts(@salary1)
            @salary_db.update(amount: @salary)
        else
            #puts("Noooooooooooooooooooooooooo")
            AllSalary.create(emp_id: @emp_id, year: @year_int, month: @month_int, amount: @salary)
        end
    end


end

def yearly_salary_report
    if session[:id].present? 
        @year=params[:year]
    else
        redirect_to :controller => 'admin',:action => 'home'
    end 
    

end


def monthly_salary_report
    if session[:id].present? 
        @year=params[:year]
        @month=params[:month]
    else
       redirect_to :controller => 'admin',:action => 'home'
    end 



end



def individual_salary_report 
        @emp_id=params[:emp_id]
end

def download_pdf
    #x=session[:id]
    emp_id=params[:emp_id]
    link=params[:link]
    puts("888888888888888888888888888888888")
    puts(link)
    #emp_id=link.params[:emp_id]
    #puts(link)
    #kit=PDFKit.new()
    #$x="file1"
    #file = kit.to_file('/home/rv/Desktop/ang')
    #link1='http://localhost:3000/salary/individual_salary_report?emp_id=e002'
    kit = PDFKit.new(link)
     pdf1 = kit.to_pdf
     send_data(pdf1, :filename => "#{emp_id}_salary_report.pdf",:type => 'pdf')
    #kit = PDFKit.new "http://www.10to1.be"
    #kit = PDFKit.new File.new(file_path)
    
    #redirect_to link
end


def pdf_salary_gen



puts("5555555555555555555555555555")
@year=params[:year]
@month=params[:month]
@emp_id=params[:emp_id]
@name=Employeedtl.where(emp_id: @emp_id)[0].name
@designation= Employeedtl.where(emp_id: @emp_id)[0].designation
#puts(@emp_name)
@amount=AllSalary.where(year: @year, month: @month, emp_id: @emp_id)[0].amount
#puts(@amount[0].amount)
@month_char=Date::MONTHNAMES[@month.to_i]
filename= "#{@emp_id}_#{@year}_#{@month_char}_salary.pdf"
puts(filename)
pdf = Prawn::Document.new
pdftk = PdfForms.new('/usr/bin/pdftk')
file1=pdftk.fill_form 'app/views/salary/files/report.pdf', "public/salary/#{filename}", {:name => @name, :designation => @designation, :year => @year, :month => @month_char, :amount => @amount}, :flatten => true

puts(@month_char)

puts("_____________________________________")
send_file "public/salary/#{filename}", :type=>"application/pdf", :x_sendfile=>true



end

end
