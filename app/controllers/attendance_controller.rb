class AttendanceController < ApplicationController

def attendance
    if session[:id].present?
        #puts("KKKKKKKKKKKKKKKKKKKKK")
    else
        #puts("jjjjjjjjjjjjjjj")
        redirect_to :controller => 'admin',:action => 'home'
    end

end



def attendance_update
    if session[:id].present?
        @emp_name=Employeedtl.select(:emp_id, :name, :designation)
        respond_to do |format|
            format.html
            format.json {render :json => @emp_name }
        end
    else
       redirect_to :controller => 'admin',:action => 'home' 
    end
end

def attendance_update1
    @val=params[:val]
    @val1 = JSON.parse(@val)
    @emp_id=@val1["emp_id"]
    #@year=@val1["year"]
    #@month=@val1["month"]
    @date=@val1["date"]
    @value=@val1["value"]
    @user1 = Employeeatdnc.find_by(emp_id: @emp_id, date: @date)
    if @user1.present?
        @user2=@user1.update(value: @value)
    else
        @create = Employeeatdnc.create(emp_id: @emp_id, date: @date, value: @value)
    end
end


def attendance_view_month
    if session[:id].present? 
        @val=params[:values]
        @val1 = JSON.parse(@val)
        @month=@val1["month"]
        @year=@val1["year"]
#puts(@month)
#puts(@year)
#@result=Employeeatdnc.where(["YEAR(date) = ? AND MONTH(date) = ?", @year, @month])
#puts(@result)
        @year_int=@year.to_i
        if @month=="1" || @month=="3" || @month=="5" || @month=="7" || @month=="8" || @month=="10" || @month=="12"
        @tot_day=31
        elsif @month=="2"
            if(@year_int % 400 == 0)
                @tot_day=29
            elsif (@year_int % 100 == 0)
                @tot_day=28
            elsif (@year_int % 4 == 0)
                @tot_day=29
            else
                @tot_day=28    
            end      
        else
        @tot_day=30
        end
    else
        redirect_to :controller => 'admin',:action => 'home'
    end
end

def attendance_view_year
    if session[:id].present? 
        @year=params[:year]
    else
       redirect_to :controller => 'admin',:action => 'home'
    end 

end


def sunday

    #puts("??????????????????????????????????????????????????")
    @year=params[:year]
    #puts("New": @year)
    @date = Time.new(@year)
    #puts(@date)
    @count=0
    @year=@date.year
    @month=@date.month
    while @year==@date.year do
        if (@date.wday==0)
            @count=@count+1
            #puts("year": @date.year, "month": @date.month, "date": @date.day)
            @date_tmp=@date.year.to_s+'-'+@date.month.to_s+'-'+@date.day.to_s
            @val1=HolidaySunday.find_by(date: @date_tmp)
            if @val1.present?

            else
                HolidaySunday.create(date: @date, reason: "Sunday")
            end
        end
        @date=@date.next_day      
    end
    #puts("total sunday": @count)
end

def holiday
    if session[:id].present? 
    else
       redirect_to :controller => 'admin',:action => 'home'
    end 
end

def salary

end


def import_xls
    file=params[:file]
    #size=file.size
    #path = file.name.url
    #puts(size)
    #puts(file.extname)
    if file.present?
        #puts("a")
        #puts(file)
        require 'spreadsheet'
        Spreadsheet.client_encoding = 'UTF-8'
        book = Spreadsheet.open(file.path)
        sheet1 = book.worksheet 'Sheet1'
        #sheet2 = Book.worksheet 'Sheet1'
        #puts(row)
        if (sheet1.row(0)[0]=="Date") && (sheet1.row(0)[1]=="Reason")
            #puts("XXXXXXXXXXXXXXXXXXXXXXXXXXX")
            sheet1.each 1 do |row|
                #puts("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH")
                @date=row[0]
                #puts("date:",col1)
                @reason=row[1]
                #puts("reason:",col2)
                @val1=HolidayExtra.where(date: @date)
                if @val1.present?
                    @val1.each do |i1|
                        if i1.reason== @reason

                        else

                          @val1.update(reason: @reason)  
                        end
                    end

                else
                    HolidayExtra.create(date: @date, reason: @reason)
                end
            end        
        end
    end
    redirect_to :action => 'holiday'
end

def abc
query = "select alias1.emp_id,count(*) as total_present from employeedtls as alias1,employeeatdncs as alias2 where alias1.emp_id=alias2.emp_id and alias2.value='present' and day(date)>=1 and day(date)<=10 group by(emp_id);
"
results = ActiveRecord::Base.connection.execute(query)

puts("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGgggg")
results.each do |i|
    puts(i)
end
puts("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH")

end

end
