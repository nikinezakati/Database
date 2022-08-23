-- -- User
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('9362333007', 'Lewes', 'Baudou', 0, '6/17/2022', 1, 'YELLOW');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('7734881017', 'Candace', 'Kennett', 1, '11/14/2021', 1, 'WHITE');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('5189158799', 'Maddi', 'Medcalfe', 0, '12/27/2021', 0, 'RED');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('3839419867', 'Thornie', 'Lambswood', 0, '4/20/2022', 1, 'YELLOW');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('9798355059', 'Marylee', 'D''Onise', 0, '2/26/2022', 1, 'YELLOW');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('0756284872', 'Julie', 'Powis', 1, '8/18/2021', 0, 'YELLOW');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('0372729258', 'Venus', 'Hacun', 1, '8/17/2021', 0, 'WHITE');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('5094167359', 'Carlyn', 'Stiggers', 0, '12/27/2021', 0, 'RED');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('4572734313', 'Lazare', 'Wyldish', 1, '5/30/2022', 1, 'WHITE');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('3803248051', 'Arne', 'Huburn', 1, '12/3/2021', 0, 'WHITE');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('2576184464', 'Donella', 'Carass', 1, '2/3/2022', 0, 'WHITE');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('1301958778', 'Cordy', 'Velden', 0, '10/18/2021', 1, 'WHITE');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('5385563854', 'Pablo', 'Comber', 0, '5/22/2022', 1, 'RED');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('0962274232', 'Kaleb', 'Skudder', 1, '5/26/2022', 0, 'RED');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('2118326386', 'Shirleen', 'Veevers', 0, '11/20/2021', 1, 'WHITE');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('8665706836', 'Alberta', 'Mishaw', 1, '5/16/2022', 0, 'YELLOW');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('5665726567', 'Cozmo', 'Haslin', 1, '8/19/2021', 0, 'WHITE');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('8583162840', 'Henriette', 'Merioth', 1, '11/3/2021', 1, 'RED');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('8963515915', 'Leonora', 'Okill', 0, '3/10/2022', 0, 'YELLOW');
insert into [User] (user_id, firstname, lastname, last_test_result, updated_at, test_needed, covid_status) values ('5613940045', 'Dulci', 'Bromley', 1, '3/6/2022', 0, 'YELLOW');

insert into [Place] (p_name, p_address, covid_status) values ('Amelie', '35 Scoville Park','WHITE')
insert into [Place] (p_name, p_address, covid_status) values ('Sisile', '8812 North Parkway','WHITE')
insert into [Place] (p_name, p_address, covid_status) values ('Ola', '35 Sloan Terrace','RED')

insert into [Record] (record_id, r_name, r_address, duration ) values ('9297762867', 'Ola', '35 Sloan Terrace', '8/25/0001');
insert into [Record] (record_id, r_name, r_address, duration ) values ('9829480070', 'Sisile', '8812 North Parkway', '11/17/0001');
insert into [Record] (record_id, r_name, r_address, duration ) values ('1317817427', 'Sisile', '8812 North Parkway', '10/30/0001');
insert into [Record] (record_id, r_name, r_address, duration ) values ('2929710047', 'Amelie', '35 Scoville Park', '2/16/0001');
insert into [Record] (record_id, r_name, r_address, duration ) values ('6778479221', 'Amelie', '35 Scoville Park', '4/12/0001');

insert into Restriction (re_number, re_name, re_address, s_date, d_date, created_at) values ('6361391590', 'Sisile', '8812 North Parkway', '2/21/1839', '4/27/1473', '10/31/0763');
insert into Restriction (re_number, re_name, re_address, s_date, d_date, created_at) values ('6395831305', 'Sisile', '8812 North Parkway', '5/17/1315', '1/23/1342', '4/22/1090');
insert into Restriction (re_number, re_name, re_address, s_date, d_date, created_at) values ('0394683781', 'Sisile', '8812 North Parkway', '3/7/1059', '12/19/1074', '3/22/0949');
insert into Restriction (re_number, re_name, re_address, s_date, d_date, created_at) values ('6289272160', 'Amelie', '35 Scoville Park', '1/13/1487', '8/17/1223', '3/18/0327');
insert into Restriction (re_number, re_name, re_address, s_date, d_date, created_at) values ('8612681413', 'Amelie', '35 Scoville Park', '11/2/1858', '8/10/0308', '6/3/0517');


insert into [Alert] (user_id, is_read) values ('9798355059', 1);
insert into [Alert] (user_id, is_read) values ('9798355059', 1);
insert into [Alert] (user_id, is_read) values ('9798355059', 0);
insert into [Alert] (user_id, is_read) values ('9798355059', 1);
insert into [Alert] (user_id, is_read) values ('9798355059', 0);
insert into [Alert] (user_id, is_read) values ('9798355059', 0);
insert into [Alert] (user_id, is_read) values ('9798355059', 0);
insert into [Alert] (user_id, is_read) values ('9798355059', 0);
insert into [Alert] (user_id, is_read) values ('9798355059', 1);
insert into [Alert] (user_id, is_read) values ('5094167359', 0);
insert into [Alert] (user_id, is_read) values ('5094167359', 1);
insert into [Alert] (user_id, is_read) values ('5094167359', 1);
insert into [Alert] (user_id, is_read) values ('5094167359', 0);
insert into [Alert] (user_id, is_read) values ('8583162840', 0);
insert into [Alert] (user_id, is_read) values ('8583162840', 0);

insert into [HasUser] (record_id,user_id) values ('9297762867', '5094167359');
insert into [HasUser] (record_id,user_id) values ('9297762867', '8583162840');
insert into [HasUser] (record_id,user_id) values ('9297762867', '8583162840');
insert into [HasUser] (record_id,user_id) values ('9829480070', '9798355059');
insert into [HasUser] (record_id,user_id) values ('9829480070', '5094167359');
insert into [HasUser] (record_id,user_id) values ('9829480070', '8583162840');
insert into [HasUser] (record_id,user_id) values ('1317817427', '9798355059');
insert into [HasUser] (record_id,user_id) values ('1317817427', '5094167359');
insert into [HasUser] (record_id,user_id) values ('1317817427', '8583162840');
insert into [HasUser] (record_id,user_id) values ('6778479221', '9798355059');