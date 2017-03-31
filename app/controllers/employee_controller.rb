class EmployeeController < ApplicationController

def employee_details
    
    if session[:id].present?
        @emp=Employeedtl.all
    else
       redirect_to :controller => 'admin',:action => 'home'
    end 
end

def employee_register
    if session[:id].present?
    else
       redirect_to :controller => 'admin',:action => 'home'
    end 

end

def employee_register_con1

    @val=params[:val]
    @val1 = JSON.parse(@val)
    @name=@val1["name"]
    @desg=@val1["desg"]
    @joindate=@val1["joindate"]
    @contactno=@val1["contactno"]
    @email=@val1["email"]
    @address=@val1["address"]
    @dob=@val1["dob"]
    @city=@val1["city"]
    @state=@val1["state"]
    @pincode=@val1["pincode"]
    @salary=@val1["salary"]
    @value=Employeedtl.last
    if(@value.blank?)
        @emp_id="e001"
    else
        @emp_id=@value["emp_id"]
        @emp_id=@emp_id.next
    end
    @create = Employeedtl.create(emp_id: @emp_id, name: @name, designation: @desg, joindate: @joindate, contactno: @contactno, emailid: @email, address: @address, dob: @dob, city: @city, state: @state, salary: @salary, pincode: @pincode)
    respond_to do |format|
        format.html
        format.json {render json: @create}
    end
end

def employee_register1
    if session[:id].present?
        @emp=Employeedtl.new
    else
       redirect_to :controller => 'admin',:action => 'home'
    end 
    
end


def insertpic
    @emp=Employeedtl.new(employee_params)
    @emp_id=@emp["emp_id"]
    @user = Employeedtl.find_by(emp_id: @emp_id)
    @user1=@user.update(employee_params)
    redirect_to :action => 'employee_details' 
end

def employee_edit
    
    if session[:id].present?
        @emp_id=params[:emp_id]
        @emp=Employeedtl.where(emp_id: params[:emp_id])
    else
       redirect_to :controller => 'admin',:action => 'home'
    end 

end

def employee_edit_con1

    @val=params[:val]
    @val1 = JSON.parse(@val)
    @emp_id=@val1["emp_id"]
    @name=@val1["name"]
    @desg=@val1["desg"]
    @joindate=@val1["joindate"]
    @contactno=@val1["contactno"]
    @email=@val1["email"]
    @address=@val1["address"]
    @dob=@val1["dob"]
    @city=@val1["city"]
    @state=@val1["state"]
    @pincode=@val1["pincode"]
    @salary=@val1["salary"]
    @user = Employeedtl.find_by(emp_id: @emp_id)
    @user1=@user.update(name: @name, designation: @desg, joindate: @joindate, contactno: @contactno, emailid: @email, address: @address, dob: @dob, city: @city, state: @state, pincode: @pincode, salary: @salary)
    respond_to do |format|
        format.html
        format.json {render json: @user1}
    end
end
def employee_delete
    @emp_id=params[:emp_id]
    @user = Employeedtl.find_by(emp_id: @emp_id)
    @user1=@user.destroy
    respond_to do |format|
        format.html
        format.json {render json: @user1}
    end
end

def download_icard
    emp_id=params[:emp_id]
#puts(emp_id)
#kit = PDFKit.new('app/views/employee/files/icard.pdf')
    @all_dtls=Employeedtl.where(emp_id: emp_id)
    @name= @all_dtls[0].name
    @designation= @all_dtls[0].designation
    @contact_no=@all_dtls[0].contactno
    @email_id=@all_dtls[0].emailid
    @image=@all_dtls[0].image
#pdftk.get_fields Rails.root.join('app', 'views', 'employee', 'files', 'icard.pdf')
    filename= "#{emp_id}_icard.pdf"
#puts(@email_id)
#puts(@image)
#puts("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
#puts($gen_fil_nm)

    pdf = Prawn::Document.new
    x=pdf.image 'public/uploads/employeedtl/image/e001/b.jpg'
#pdf.render_file 'example.pdf'
#send_data pdf.render, :filename => "x.pdf", :type => "application/pdf", :disposition => 'inline'
#puts(x)

    pdftk = PdfForms.new('/usr/bin/pdftk')
    file1=pdftk.fill_form 'app/views/employee/files/icard.pdf', "public/i_card/#{filename}", {:name => @name, :designation => @designation, :contact_no => @contact_no, :email_id => @email_id, :image => @image, :button_1 => x}, :flatten => true
#file1.embed_image(filename, x)

#pdftk filename multistamp x.pdf filename
#pdftk filename x.pdf cat output filename

#pdftk filename attach_files command_ref.html to_page 1 output html_tidy_book.pd

#
#file1.x
#send_file pdf.render, :filename => "eooj.pdf", :type=>"application/pdf", :x_sendfile=>true
#

#pdf = Prawn::Document.new
#pdf.text "My Beautiful Background."
#file1.image @image
#send_data(pdf1, :filename => "#{emp_id}_salary_report",:type => 'pdf')

#kit.fill_form Rails.root.join('app', 'views', 'employee', 'files', 'icard.pdf'), Rails.root.join('public', 'employee', $gen_fil_nm ) , {"name" => 'abc'}, :flatten => true
#send_data(pdf1, :filename => "temp.pdf") 
#send_data("public/i_card/#{filename}", :type => 'pdf')
#redirect_to :action => 'employee_details'
#send_file pdf.render, :filename => "x.pdf", :type => "application/pdf", :disposition => 'inline'
#send_file "example.pdf", :type=>"application/pdf", :x_sendfile=>true
#Right code
    send_file "public/i_card/#{filename}", :type=>"application/pdf", :x_sendfile=>true
end


private

    def employee_params
        params.require(:employeedtl).permit(:emp_id, :image)     
    end
end