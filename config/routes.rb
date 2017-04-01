Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'admin#home'

# ALL page under admin controller

get 'admin/home'
post 'admin/home'
get 'admin/admin_check1'
post 'admin/admin_check1'
get 'admin/admin_home'
post 'admin/admin_home'
get 'admin/admin_direct1'
post 'admin/admin_direct1'
get 'admin/destroy_session'
post 'admin/destroy_session'
get 'admin/_header'
post 'admin/_header'



get 'attendance/attendance'
post 'attendance/attendance'

get 'attendance/attendance_update'
post 'attendance/attendance_update'
get 'attendance/attendance_update1'
post 'attendance/attendance_update1'
get 'attendance/attendance_view_month'
post 'attendance/attendance_view_month'
get 'attendance/attendance_view_year'
post 'attendance/attendance_view_year'
get 'attendance/sunday'
post 'attendance/sunday'
get 'attendance/holiday'
post 'attendance/holiday'
get 'attendance/import_xls'
post 'attendance/import_xls'


get 'attendance/abc'


get 'employee/employee_details'
post 'employee/employee_details'
get 'employee/employee_register'
post 'employee/employee_register'
get 'employee/employee_register1'
post 'employee/employee_register1'
get 'employee/employee_register_con1'
post 'employee/employee_register_con1'
get 'employee/insertpic'
post 'employee/insertpic'
get 'employee/employee_edit'
post 'employee/employee_edit'
get 'employee/employee_edit_con1'
post 'employee/employee_edit_con1'
get 'employee/employee_delete'
post 'employee/employee_delete'
get 'employee/download_icard'
post 'employee/download_icard'


#get 'employee/salary'
#post 'employee/salary'

#get 'employee/attendance_view_month_1'
#post 'employee/attendance_view_month_1'



#get 'employee/abc'
#post 'employee/abc'

#get 'employee/attendance_view_month1'
#post 'employee/attendance_view_month1'

get 'salary/salary'
post 'salary/salary'
get 'salary/individual_salary_report'
post 'salary/individual_salary_report'
get 'salary/yearly_salary_report'
post 'salary/yearly_salary_report'
get 'salary/monthly_salary_report'
post 'salary/monthly_salary_report'
get 'salary/create_salary_report'
post 'salary/create_salary_report'
get 'salary/all_report'
post 'salary/all_report'
get 'salary/download_pdf'
post 'salary/download_pdf'
get 'salary/salary_report'
post 'salary/salary_report'


get 'salary/pdf_salary_gen'
post 'salary/pdf_salary_gen'


#get 'employee/admin_home?name='
#post 'employee/admin_home?name='




end
