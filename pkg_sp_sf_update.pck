create or replace package pkg_sp_sf_update is

  -- Author  : 1924178
  -- Created : 6/5/2023 12:41:56 PM
  -- Purpose : 
  
  -- Public type declarations
  procedure SP_SALARY_UPDATE(i_salary in number,i_fname in varchar2,o_msg out varchar2,o_cursor out sys_refcursor);

  
end pkg_sp_sf_update;
/
create or replace package body pkg_sp_sf_update is
  procedure SP_SALARY_UPDATE(i_salary in number,
                             i_fname  in varchar2,
                             o_msg out varchar2,o_cursor out sys_refcursor) is
                        
                          
     cnt number;                                                    
  begin
     cnt:=0;
    select count(fname) into cnt from person1 where Upper(fname) = Upper(i_fname);
  if(cnt<>0)
    THEN
    Update person1 set salary = i_salary where Upper(fname) = Upper(i_fname);
    commit;
    o_msg :='updated';

    end if;  
    open o_cursor for select id,fname,salary from person1;
    
  end SP_SALARY_UPDATE; 
end pkg_sp_sf_update;
/
