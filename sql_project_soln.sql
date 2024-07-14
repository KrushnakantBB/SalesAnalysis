create database edtech;
use edtech;
delimiter //
create procedure analysis1()
begin
select count(lead_id), current_education, age,gender from leads_basic_details group by current_education, age,gender;
select count(lead_id),current_city,lead_gen_source from leads_basic_details group by current_city,lead_gen_source;
select count(distinct lead_id),lead_stage from leads_interaction_details group by lead_stage;
select count(lead_id) as No_of_Leads, language as Preferred_language from leads_demo_watched_details group by language;
select count(lead_id) as  No_of_Leads,reasons_for_not_interested_in_demo as Reasons_For_Not_Interested_In_Demo,
count(lead_id) as  No_of_Leads,reasons_for_not_interested_to_consider as Reasons_For_Not_Interested_To_Consider,
count(lead_id) as  No_of_Leads, reasons_for_not_interested_to_convert as Reasons_For_Not_Interested_To_Convert
from leads_reasons_for_no_interest
group by
reasons_for_not_interested_in_demo,reasons_for_not_interested_to_consider,reasons_for_not_interested_to_convert;
select snr_sm_id as Senior_Manager_id,cycle as Cycle, count(distinct jnr_sm_id) as Junior_Mgr_Id, count(lead_id) as No_of_leads
from sales_managers_assigned_leads_details
group by 
snr_sm_id,cycle;
select jnr_sm_id as Junior_Mgr_Id,cycle as Cycle, count(lead_id) as No_of_Leads
from sales_managers_assigned_leads_details
group by jnr_sm_id, cycle;
select jnr_sm_id as Junior_Mgr_Id ,call_status as Call_Status, count(lead_id) as No_of_Leads
from leads_interaction_details
group by call_status,jnr_sm_id ;
select jnr_sm_id as Jr_Mgr,lead_stage as Lead_Stage,count(lead_id) as No_of_Lead
from leads_interaction_details
group by jnr_sm_id,lead_stage;
end //
delimiter ;

call analysis1;