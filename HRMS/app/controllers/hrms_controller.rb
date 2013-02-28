class HrmsController < ApplicationController

#TODO : DATETIME SET IN EDIT AND MANAGER SET IN EDIT

  def home
    respond_to do |format|
      format.html
    end
  end


  def showall
    @employees = Employee.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hrm }
    end
  end

  def displayone
    empid = params[:empid]
    @employee = Employee.where(:employees_id => empid.to_i).first
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def newemployee
  	respond_to do |format|
      format.html # show.html.erb
    end
  end

  def editemployee
    @employee = Employee.where(:employees_id => params[:empid]).first
    @dname = params[:dname]
    @rname = params[:rname]

    @mname = if !@employee.manager_id.blank? then Employee.where(:employees_id => @employee.manager_id).first.name else "" end
    
    eprofile = EmployeeProfile.where(:employees_id => @employee.employees_id).first
    @dob = if !eprofile.blank? then eprofile.dob else Date.current end
    
    addr = EmployeeProfile.where(:employees_id => @employee.employees_id).first

    if !addr.blank?
        @addr = Address.where(:id => addr.address_id).first
    else
        @addr = Address.new
        @addr.addressLine1 = "";
        @addr.addressLine2 = "";
        @addr.city = "";
        @addr.state = "";
        @addr.pincode = "";
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hrm }
    end
  end

  def create

  	flash[:message] = "";

    if params[:operation]=="new"
  	       @employee = Employee.new
           @address = Address.new
           @profile = EmployeeProfile.new
    else
           id = params[:id]
           @employee = Employee.where(:id => id.to_i).first
           @profile = EmployeeProfile.where(:employees_id => @employee.employees_id.to_i).first
           @address = @profile.includes(:address).first.address
    end

  	@employee["employees_id"] = params[:employees][:employees_id].to_i
  	@employee["name"] = params[:employees][:name]
  	@employee["level"] = params[:employees][:level].to_i
  	@employee["email"] = params[:employees][:email]

  	if params[:ismanager] == "TRUE"
  		@employee["is_manager"]=true
  	else
  		@employee["is_manager"]=false
  	end


  	res = Employee.find(:all)
	  res.each do |m|
	  		if params[:employees][:mname] == m.name
	  			m.is_manager = true
	  			if m.save
	  				@employee["manager_id"] = m.employees_id.to_i
	  			end
	  		end
	end
	
  	res1 = Department.find(:all)
  	res1.each do |d|
  		if d.description == params[:employees][:dname]
  			@employee["departments_id"] = d.departments_id.to_i
  			temp = d.supported_role_ids
	  		@supportedRoles = temp.split(",")
  		end
  	end

  	res2 = Role.find(:all)
  	res2.each do |r|
  		if r.role_name == params[:employees][:rname]
  			roleId = r.roles_id
  			@supportedRoles.each do |s|
  				if s == roleId.to_s
  					@employee["roles_id"]= roleId
  				end
  			end
  		end
  	end

    @address.addressLine1 = params[:employees][:adl1]
    @address.addressLine2 = params[:employees][:adl2]
    @address.city = params[:employees][:city]
    @address.state = params[:employees][:state]
    @address.pincode = params[:employees][:pin]

    @profile.dob = params[:employees][:dob]
    @profile.employees_id = params[:employees][:employees_id]

    if @address.save
      addrId = @address.id
      @profile.address_id = addrId
      @profile.save
    end


  	if @employee.save
    	redirect_to :action => :showall
    else
    	flash[:message] = "Failure"
    	render :action => :newemployee
    end

  end

  def destroy
    empid = params[:empid]
    @employee = Employee.where(:employees_id => empid.to_i).first
    if @employee.is_manager
        subordinates = Employee.where(:manager_id => @employee.employees_id)
        newmanagerid = @employee.manager_id
        subordinates.each do |s|
          s.manager_id = newmanagerid
          s.save
        end
    end
  
    if @employee.destroy
      redirect_to :action => :showall
    end
  end

  def stupid
      @res= Employee.where(:employees_id => params[:empid].to_i).first.name
      respond_to do |format|
          format.json { render json: {:result => @res} }
      end
  end

  def profile
      empid = params[:empid].to_i
      @employee = Employee.where(:employees_id => empid).first

      res1 = Employee.where(:employees_id => @employee.manager_id).first
      @mname = if !res1.blank? then res1 else "NOT ASSIGNED" end

      res2 = Department.where(:departments_id => @employee.departments_id).first
      @dname = if !res2.blank? then res2.description else "NOT ASSIGNED" end

      res3 = Role.where(:roles_id => @employee.roles_id).first
      @rname = if !res3.blank? then res3.role_name else "NOT ASSIGNED" end

      ep = EmployeeProfile.where(:employees_id => empid).first
      @profile = if !ep.blank? then ep else EmployeeProfile.new end
      aid = @profile.id

      addr = Address.where(:id => aid).first
      @addr = if !addr.blank? then addr else Address.new end

      respond_to do |format|
        format.html # show.html.erb
      end
  end

end